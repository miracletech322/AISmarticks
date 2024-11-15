<?php

namespace Modules\SmsNotifications\Providers;

use App\Conversation;
use App\Subscription;
use App\User;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;

require_once __DIR__.'/../vendor/autoload.php';

class SmsNotificationsServiceProvider extends ServiceProvider
{
    const SYSTEM_TWILIO = 1;
    const SYSTEM_MESSAGEBIRD = 2;

    public static $system_names = [
        self::SYSTEM_TWILIO => 'Twilio',
        self::SYSTEM_MESSAGEBIRD => 'MessageBird',
    ];

    const LOG_NAME = 'sms_notifications_errors';

    const MEDIUM_SMS = 100;
    
    const API_URL = 'https://rest.messagebird.com/messages';
    const API_RECIPIENTS_LIMIT = 50;
    const API_DEFAULT_ORIGINATOR = 'MessageBird';

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
        \Eventy::addFilter('settings.sections', function ($sections) {
            $sections['sms'] = ['title' => __('SMS Notifications'), 'icon' => 'phone', 'order' => 250];

            return $sections;
        }, 15);

        // Section settings.
        \Eventy::addFilter('settings.section_settings', function ($settings, $section) {

            if ($section != 'sms') {
                return $settings;
            }

            $settings['smsnotifications.system'] = self::getSystem();
            $settings['smsnotifications.twilio_sid'] = config('smsnotifications.twilio_sid');
            $settings['smsnotifications.twilio_token'] = config('smsnotifications.twilio_token');
            $settings['smsnotifications.twilio_phone_number'] = config('smsnotifications.twilio_phone_number');
            $settings['smsnotifications.api_key'] = config('smsnotifications.api_key');
            $settings['smsnotifications.phone_number'] = config('smsnotifications.phone_number');

            return $settings;
        }, 20, 2);

        // Section parameters.
        \Eventy::addFilter('settings.section_params', function ($params, $section) {
            if ($section != 'sms') {
                return $params;
            }

            $params = [
                'template_vars' => [
                    
                ],
                'settings' => [
                    'smsnotifications.system' => [
                        'env' => 'SMSNOTIFICATIONS_SYSTEM',
                    ],
                    'smsnotifications.twilio_sid' => [
                        'env' => 'SMSNOTIFICATIONS_TWILIO_SID',
                    ],
                    'smsnotifications.twilio_token' => [
                        'env' => 'SMSNOTIFICATIONS_TWILIO_TOKEN',
                    ],
                    'smsnotifications.twilio_phone_number' => [
                        'env' => 'SMSNOTIFICATIONS_TWILIO_PHONE_NUMBER',
                    ],
                    'smsnotifications.api_key' => [
                        'env' => 'SMSNOTIFICATIONS_API_KEY',
                    ],
                    'smsnotifications.phone_number' => [
                        'env' => 'SMSNOTIFICATIONS_PHONE_NUMBER',
                    ],
                ]
            ];

            return $params;
        }, 20, 2);

        // Settings view name
        \Eventy::addFilter('settings.view', function ($view, $section) {
            if ($section != 'sms') {
                return $view;
            } else {
                return 'smsnotifications::settings';
            }
        }, 20, 2);

        \Eventy::addAction('user.edit.phone_append', function($user) {
            if ($user->phone && !self::sanitizePhone($user->phone)) {
                ?>
                    <span class="help-block has-error"><?php echo __('SMS notifications can not be sent to this number. Enter full phone number with the country code (with or without "+" in front). Example for USA: +1 (888) 512-27-86 or +18885122786'); ?></span>
                <?php
            }
        });

        \Eventy::addFilter('flash_messages.flashes', function($flashes) {
            if (\Route::is('users.notifications')) {
                $user_id = request()->route('id');
                $user = User::find($user_id);
                
                if ($user) {
                    $has_sms_enabled = false;
                    foreach ($user->subscriptions as $subscription) {
                        if ($subscription->medium == self::MEDIUM_SMS) {
                            $has_sms_enabled = true;
                            break;
                        }
                    }

                    if ($has_sms_enabled && !self::sanitizePhone($user->phone)) {
                        $flashes[] = [
                            'type'      => 'warning',
                            'text'      => __('SMS notifications can not be sent to the user. Enter proper phone number in :%a_begin%user\'s profile:%a_end%.', ['%a_begin%' => '<a href="'.route('users.profile', ['id' => $user_id]).'">', '%a_end%' => '</a>']),
                            'unescaped' => true,
                        ];
                    }
                }
            }

            return $flashes;
        });

        \Eventy::addAction('notifications_table.th', function() {
            ?>
                <td class="text-center">SMS<br/><input type="checkbox" class="sel-all" value="sms"></td>
            <?php
        });

        \Eventy::addAction('notifications_table.td', function($event, $subscriptions_formname, $subscriptions) {
            echo \View::make('smsnotifications::partials/notifications_table_td', [
                'event' => $event,
                'subscriptions_formname' => $subscriptions_formname,
                'subscriptions' => $subscriptions,
            ])->render();
        }, 20, 3);

        \Eventy::addFilter('subscription.mediums', function($mediums) {
            $mediums[] = self::MEDIUM_SMS;
            return $mediums;
        }, 20, 1);

        // Send notifications.
        \Eventy::addAction('subscription.process_events', function($notify) {
            if (empty($notify[self::MEDIUM_SMS])) {
                return;
            }
            $delay = now()->addSeconds(Conversation::UNDO_TIMOUT);
            foreach ($notify[self::MEDIUM_SMS] as $conversation_id => $notify_info) {
                \Modules\SmsNotifications\Jobs\SendSmsNotificationToUsers::dispatch($notify_info['users'], $notify_info['conversation'], $notify_info['threads'])
                    ->delay($delay)
                    ->onQueue('default');
            }
        });
    }

    // For backward compatibility when there was only MessageBird.
    public static function getSystem()
    {
        $system = (int)config('smsnotifications.system');

        if (!$system) {
            if (config('smsnotifications.api_key')) {
                return self::SYSTEM_MESSAGEBIRD;
            } else {
                return self::SYSTEM_TWILIO;
            }
        } else {
            return $system;
        }
    }

    // https://developers.messagebird.com/tutorials/send-sms-node
    public static function sendSmsNotification($recipients, $body/*, $url*/)
    {
        $system = self::getSystem();

        if ($system == self::SYSTEM_MESSAGEBIRD) {
            $params = [
                'recipients' => $recipients,
                // If empty a shared number is used.
                'originator' => config('smsnotifications.phone_number') ?: self::API_DEFAULT_ORIGINATOR,
                'body' => $body,
            ];

            $curl = curl_init(self::API_URL);

            $headers = [
                // 'Accept: application/json',
                // 'Content-Type: application/json',
                // 'Accept-Charset: utf-8',
                'Authorization: AccessKey '.config('smsnotifications.api_key'),
            ];

            curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
            curl_setopt($curl, CURLOPT_HEADER, true);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            \Helper::setCurlDefaultOptions($curl);
            // curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, $this->connectionTimeout);
            curl_setopt($curl, CURLOPT_POST, true);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($params));

            $response = curl_exec($curl) ?: '';

            $http_code = curl_getinfo($curl, \CURLINFO_HTTP_CODE);
            // if ($http_code != 200) {
            //     throw new \Exception("Error occured sending SMS notification: ".$response, 1);
            // }

            // Split the header and body.
            $parts = explode("\r\n\r\n", $response, 3);
            $isThreePartResponse = (strpos($parts[0], "\n") === false && strpos($parts[0], 'HTTP/1.') === 0);
            [$response_header, $response_body] = $isThreePartResponse ? [$parts[1], $parts[2]] : [$parts[0], $parts[1]];

            curl_close($curl);

            $response_data = json_decode($response_body, true);

            if (!$response_data ||
                !empty($response_data['errors']) 
                || empty($response_data['recipients'])
                || empty($response_data['recipients']['totalSentCount'])
                || (int)$response_data['recipients']['totalSentCount'] != count($recipients)
            ) {
                if (!empty($response_data['errors'])) {
                    throw new \Exception(json_encode($response_data['errors']), 1);
                } else {
                    throw new \Exception('Response: '.json_encode($response_data).'; HTTP code: '.$http_code, 1);
                }
            }
        } else {
            // Twilio.
            $twilio_phone_number = config('smsnotifications.twilio_phone_number');
            $twilio_phone_number = preg_replace("#[^0-9]#", '', $twilio_phone_number);
            
            // https://www.twilio.com/docs/libraries/php/usage-guide#exceptions
            $twilio_errors = [];
            try {
                $twilio_client = self::getTwilioClient();
                if (!$twilio_client) {
                    throw new \Exception("Could not create Twilio client. Check Twilio settings in mailbox settings.", 1);
                }
                try {
                    foreach ($recipients as $recipient_phone) {
                        $twilio_client->messages->create($recipient_phone, [
                            'from' => $twilio_phone_number,
                            'body' => $body,
                            //'mediaUrl' => $files
                        ]);
                    }
                //} catch (\Twilio\Exceptions\TwilioException $e) {
                } catch (\Exception $e) {
                    $twilio_errors[] = $e->getMessage();
                }
            } catch (\Exception $e) {
                // In case client could not be created.
                throw new $e;
            }

            if (count($twilio_errors)) {
                throw new \Exception(json_encode($twilio_errors), 1);
            }
        }
    }

    public static function getTwilioClient()
    {       
        return new \Twilio\Rest\Client(config('smsnotifications.twilio_sid'), config('smsnotifications.twilio_token'));
    }

    // Sanitizes phone number into E.164 format
    public static function sanitizePhone($phone)
    {
        $phone = trim($phone ?? '');

        if (!$phone) {
            return '';
        }
        if ($phone[0] != '+') {
            $phone = '+'.$phone;
        }
        $libphonenumber = \libphonenumber\PhoneNumberUtil::getInstance();
        try {
            $phone_proto = $libphonenumber->parse($phone);
            if (!$libphonenumber->isValidNumber($phone_proto)) {
                return '';
            }
            $phone_e164 = $libphonenumber->format($phone_proto, \libphonenumber\PhoneNumberFormat::E164);
            return ltrim($phone_e164 ?? '', '+');
        } catch (\libphonenumber\NumberParseException $e) {
            return '';
        }
    }

    public static function log($text, $params = [], $system = null)
    {
        if ($params) {
            $text .= ' '.json_encode($params);
        }
        $text = stripslashes(str_replace("\n", '\n', $text));

        if (!$system) {
            $system = self::getSystem();
        }
        $system_name = self::$system_names[$system] ?? '';

        \Log::error('[SMS Notifications Module] ('.$system_name.') '.$text);
        \Helper::log(self::LOG_NAME, '('.$system_name.') '.$text);
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
            __DIR__.'/../Config/config.php' => config_path('smsnotifications.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'smsnotifications'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/smsnotifications');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/smsnotifications';
        }, \Config::get('view.paths')), [$sourcePath]), 'smsnotifications');
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
