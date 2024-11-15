<?php

namespace Modules\MobileNotifications\Providers;

use App\Conversation;
use App\Subscription;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;

// Module alias
define('MOBNOTIF_MODULE', 'mobilenotifications');

class MobileNotificationsServiceProvider extends ServiceProvider
{
    const SERVICE_URL = 'https://service.freescout.net/fcm/send.php';

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
        \Eventy::addFilter('notifications.mobile_available', function($value) {
            return true;
        });

        // \Eventy::addFilter('notifications.android_link', function($value) {
        //     return 'https://freescout.net/module/mobile-notifications/';
        // });

        // Add module's JS file to the application layout.
        \Eventy::addAction('javascript', function() {
            $user = auth()->user();
            $topic = '';
            //$token = '';
            if ($user) {
                $topic = self::getUserTopic($user);
                //$token = $user->getAuthToken();
            }
            // inAppSendData('<?php echo $topic; ? >', '<?php echo $token; ? >');
            ?>
                fs_in_app_data['topic'] = '<?php echo $topic; ?>';
            <?php
        });

        // Send push notifications
        \Eventy::addAction('subscription.process_events', function($notify) {
            if (empty($notify[Subscription::MEDIUM_MOBILE])) {
                return;
            }
            $delay = now()->addSeconds(Conversation::UNDO_TIMOUT);
            foreach ($notify[Subscription::MEDIUM_MOBILE] as $conversation_id => $notify_info) {
                \Modules\MobileNotifications\Jobs\SendPushNotificationToUsers::dispatch($notify_info['users'], $notify_info['conversation'], $notify_info['threads'])
                    ->delay($delay)
                    ->onQueue('default');
            }
        });
    }

    public static function getUserTopic($user)
    {
        return md5(\Helper::getAppIdentifier().$user->id);
    }

    /**
     * https://firebase.google.com/docs/cloud-messaging/http-server-ref
     */
    public static function sendPushNotification($title, $body, $url, $topics)
    {
        $data = [
            'title' => $title,
            'body'  => $body,
            'url'   => $url,
            'topics' => $topics,
        ];

        $client = new \GuzzleHttp\Client();
        $res = $client->post(self::SERVICE_URL, \Helper::setGuzzleDefaultOptions([
            'form_params' => $data,
            'connect_timeout' => 10,
        ]));

        if ($res->getStatusCode() != 200) {
            throw new \Exception("Error occured sending push notification: ".$http_code, 1);
        }

        $response = $res->getBody();
        try {
            $response_data = json_decode($response, true);
        } catch (\Exception $e) {
            throw new \Exception("Error occured parsing push notification response: ".$response, 1);
        }

        return $response_data;
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
            __DIR__.'/../Config/config.php' => config_path('mobilenotifications.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'mobilenotifications'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/mobilenotifications');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/mobilenotifications';
        }, \Config::get('view.paths')), [$sourcePath]), 'mobilenotifications');
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
