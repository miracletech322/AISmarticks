<?php

namespace Modules\Edd\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;

// Module alias.
define('EDD_MODULE', 'edd');

class EddServiceProvider extends ServiceProvider
{
    const MAX_ORDERS = 5;

    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Boot the application events.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerConfig();
        $this->registerViews();
        $this->registerFactories();
        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');
        $this->hooks();
    }

    /**
     * Module hooks.
     */
    public function hooks()
    {
        // Add module's CSS file to the application layout.
        \Eventy::addFilter('stylesheets', function($styles) {
            $styles[] = \Module::getPublicPath(EDD_MODULE).'/css/module.css';
            return $styles;
        });

        // Add module's JS file to the application layout.
        \Eventy::addFilter('javascripts', function($javascripts) {
            $javascripts[] = \Module::getPublicPath(EDD_MODULE).'/js/laroute.js';
            $javascripts[] = \Module::getPublicPath(EDD_MODULE).'/js/module.js';
            return $javascripts;
        });

        // Add item to the mailbox menu.
        \Eventy::addAction('mailboxes.settings.menu', function($mailbox) {
            if (auth()->user()->isAdmin()) {
                echo \View::make('edd::partials/settings_menu', ['mailbox' => $mailbox])->render();
            }
        }, 34);

        // Section settings.
        \Eventy::addFilter('settings.sections', function($sections) {
            $sections[EDD_MODULE] = ['title' => 'EDD', 'icon' => 'download-alt', 'order' => 550];

            return $sections;
        }, 35);

        // Section parameters.
        \Eventy::addFilter('settings.section_params', function($params, $section) {
           
            if ($section != EDD_MODULE) {
                return $params;
            }

            $params['settings'] = [
                'edd.url' => [
                    'env' => 'EDD_URL',
                ],
                'edd.key' => [
                    'env' => 'EDD_KEY',
                ],
                'edd.token' => [
                    'env' => 'EDD_TOKEN',
                ],
            ];

            // Validation.
            // $params['validator_rules'] = [
            //     'settings.edd\.url' => 'required|url',
            // ];

            return $params;
        }, 20, 2);

        // Settings view.
        \Eventy::addFilter('settings.view', function($view, $section) {
            if ($section != EDD_MODULE) {
                return $view;
            } else {
                return 'edd::settings';
            }
        }, 20, 2);

        // Section settings.
        \Eventy::addFilter('settings.section_settings', function($settings, $section) {
           
            if ($section != EDD_MODULE) {
                return $settings;
            }

            $settings['edd.url'] = config('edd.url');
            $settings['edd.key'] = config('edd.key');
            $settings['edd.token'] = config('edd.token');
            $settings['edd.version'] = config('edd.version');

            return $settings;
        }, 20, 2);

        // Before saving settings.
        \Eventy::addFilter('settings.before_save', function($request, $section, $settings) {

            if ($section != EDD_MODULE) {
                return $request;
            }

            if (!empty($request->settings['edd.url'])) {
                $settings = $request->settings;

                $settings['edd.url'] = preg_replace("/https?:\/\//i", '', $settings['edd.url']);

                $request->merge([
                    'settings' => $settings,
                ]);
            }

            return $request;
        }, 20, 3);

        // After saving settings.
        \Eventy::addFilter('settings.after_save', function($response, $request, $section, $settings) {

            if ($section != EDD_MODULE) {
                return $response;
            }

            if (self::isApiEnabled()) {
                // Check API credentials.
                $result = self::apiGetOrders('test@example.org');

                if (!empty($result['error'])) {
                    $request->session()->flash('flash_error', __('Error occurred connecting to the API').': '.$result['error']);
                } else {
                    $request->session()->flash('flash_success', __('Successfully connected to the API.'));
                }
            }

            return $response;
        }, 20, 4);

        // Show recent orders.
        \Eventy::addAction('conversation.after_prev_convs', function($customer, $conversation, $mailbox) {

            $load = false;
            $orders = [];

            if (!$customer) {
                return;
            }

            $customer_email = $customer->getMainEmail();

            if (!$customer_email) {
                return;
            }

            if (!\Edd::isApiEnabled() && !\Edd::isMailboxApiEnabled($mailbox)) {
                return;
            }

            $cached_orders = [];
            if (self::isMailboxApiEnabled($mailbox)) {
                $cached_orders_json = \Cache::get('edd_orders_'.$mailbox->id.'_'.$customer_email);
            } else {
                $cached_orders_json = \Cache::get('edd_orders_'.$customer_email);
            }
            if ($cached_orders_json && is_array($cached_orders_json)) {
                $orders = $cached_orders_json;
            } else {
                $load = true;
            }

            echo \View::make('edd::partials/orders', [
                'orders'         => $orders,
                'customer_email' => $customer_email,
                'load'           => $load,
                'url'            => \Edd::getSanitizedUrl('', $mailbox),
            ])->render();

        }, 12, 3);

        // Custom menu in conversation.
        \Eventy::addAction('conversation.customer.menu', function($customer, $conversation) {
            ?>
                <li role="presentation" class="col3-hidden"><a data-toggle="collapse" href=".edd-collapse-orders" tabindex="-1" role="menuitem">Easy Digital Downloads</a></li>
            <?php
        }, 12, 2);
    }

    public static function isApiEnabled()
    {
        return (config('edd.url') && config('edd.key') && config('edd.token'));
    }

    public static function isMailboxApiEnabled($mailbox)
    {
        if (empty($mailbox) || empty($mailbox->meta['edd'])) {
            return false;
        }
        $settings = self::getMailboxEddSettings($mailbox);

        return (!empty($settings['url']) && !empty($settings['key']) && !empty($settings['token']));
    }

    public static function getMailboxEddSettings($mailbox)
    {
        return [
            'url' => $mailbox->meta['edd']['url'] ?? '',
            'key' => $mailbox->meta['edd']['key'] ?? '',
            'token' => $mailbox->meta['edd']['token'] ?? '',
        ];
    }

    public static function formatDate($date)
    {
        $date_carbon = Carbon::parse($date);

        if (!$date_carbon) {
            return '';
        }

        return $date_carbon->format('M j, Y');
    }

    public static function getSanitizedUrl($url = '', $mailbox = null)
    {
        if (empty($url)) {
            $url = config('edd.url');

            if (!empty($mailbox) && $mailbox && \Edd::isMailboxApiEnabled($mailbox)) {
                $settings = self::getMailboxEddSettings($mailbox);
                $url = $settings['url'];
            }
        }

        $url = preg_replace("/https?:\/\//i", '', $url);

        if (substr($url, -1) != '/') {
            $url .= '/';
        }

        return 'https://'.$url;
    }

    /**
     * Retrieve Edd orders for customer.
     */
    public static function apiGetOrders($customer_email, $mailbox = null)
    {
        $response = [
            'error' => '',
            'data' => [],
        ];

        if ($mailbox && \Edd::isMailboxApiEnabled($mailbox)) {
            $settings = self::getMailboxEddSettings($mailbox);

            $url = self::getSanitizedUrl($settings['url']);
            $key = $settings['key'];
            $token = $settings['token'];
        } else {
            $url = self::getSanitizedUrl(config('edd.url'));
            $key = config('edd.key');
            $token = config('edd.token');
        }

        $request_url = $url.'edd-api/sales/';

        try {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $request_url.'?key='.$key.'&token='.$token.'&number='.self::MAX_ORDERS.'&email='.$customer_email);
            \Helper::setCurlDefaultOptions($ch);
            curl_setopt($ch, CURLOPT_USERAGENT, config('app.curl_user_agent') ?: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 7_1_4) AppleWebKit/603.26 (KHTML, like Gecko) Chrome/55.0.3544.220 Safari/534');
            curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

            $json = curl_exec($ch);
            $status_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);

            curl_close($ch);

            $json_decoded = json_decode($json, true);

            if ($status_code == 200) {
                if (!empty($json_decoded['sales'])) {
                    $response['data'] = $json_decoded['sales'];
                }
            } else {
                $response['error'] = '';

                if (!empty($json_decoded['error'])) {
                    $response['error'] .= $json_decoded['error'].' :: ';
                }

                $response['error'] .= 'HTTP Status Code: '.$status_code.' ('.self::errorCodeDescr($status_code).')';
            }

        } catch (\Exception $e) {
            $response['error'] = $e->getMessage();
        }

        if ($response['error']) {
            $response['error'] .= ' :: Requested resource: '.$request_url;
        }

        return $response;
    }

    public static function errorCodeDescr($code)
    {
        switch ($code) {
            case 400:
                $descr = __('Bad request');
                break;
            case 401:
            case 403:
                $descr = __('Authentication or permission error, e.g. incorrect API keys or your store is protected with Basic HTTP Authentication');
                break;
            case 0:
            case 404:
                $descr = __('Store not found at the specified URL');
                break;
            case 500:
                $descr = __('Internal store error');
                break;
            default:
                $descr = __('Unknown error');
                break;
        }

        return $descr;
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->registerTranslations();
    }

    /**
     * Register config.
     *
     * @return void
     */
    protected function registerConfig()
    {
        $this->publishes([
            __DIR__.'/../Config/config.php' => config_path('edd.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'edd'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/edd');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/edd';
        }, \Config::get('view.paths')), [$sourcePath]), 'edd');
    }

    /**
     * Register translations.
     *
     * @return void
     */
    public function registerTranslations()
    {
        $this->loadJsonTranslationsFrom(__DIR__ .'/../Resources/lang');
    }

    /**
     * Register an additional directory of factories.
     * @source https://github.com/sebastiaanluca/laravel-resource-flow/blob/develop/src/Modules/ModuleServiceProvider.php#L66
     */
    public function registerFactories()
    {
        if (! app()->environment('production')) {
            app(Factory::class)->load(__DIR__ . '/../Database/factories');
        }
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return [];
    }
}
