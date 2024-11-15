<?php

namespace Modules\SmsTickets\Providers;

use App\Attachment;
use App\Conversation;
use App\Customer;
use App\Mailbox;
use App\Thread;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;

require_once __DIR__.'/../vendor/autoload.php';

class SmsTicketsServiceProvider extends ServiceProvider
{
    const DRIVER = 'sms';

    // Communication channel.
    // The value must be between 1 and 255. Official modules use channel numbers below 100.
    // Non-official - above 100. To avoid conflicts with other modules contact FreeScout Team
    // to get your Channel number: https://freescout.net/contact-us/
    const CHANNEL = 14;
    
    const CHANNEL_NAME = 'SMS';

    const LOG_NAME = 'sms_twilio_errors';
    const SALT = 'dd3dsxd2d';

    public static $skip_messages = [

    ];

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
        // Add item to the mailbox menu
        \Eventy::addAction('mailboxes.settings.menu', function($mailbox) {
            if (auth()->user()->isAdmin()) {
                echo \View::make('smstickets::partials/settings_menu', ['mailbox' => $mailbox])->render();
            }
        }, 35);

        \Eventy::addFilter('menu.selected', function($menu) {
            $menu['sms'] = [
                'mailboxes.sms.settings',
            ];
            return $menu;
        });

        \Eventy::addFilter('channel.name', function($name, $channel) {
            if ($name) {
                return $name;
            }
            if ($channel == self::CHANNEL) {
                return self::CHANNEL_NAME;
            } else {
                return $name;
            }
        }, 20, 2);

        \Eventy::addFilter('channels.list', function($channels) {
            $channels[self::CHANNEL] = self::CHANNEL_NAME;
            return $channels;
        });

        \Eventy::addAction('chat_conversation.send_reply', function($conversation, $replies, $customer) {

            if ($conversation->channel != self::CHANNEL) {
                return;
            }

            $mailbox = $conversation->mailbox;

            $channel_id = $customer->getChannelId(self::CHANNEL);

            if (!$channel_id) {
                \SmsTickets::log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'): customer has no Twilio phone number.', $conversation->mailbox);
                return;
            }

            $twilio_phone_number = $mailbox->meta[\SmsTickets::DRIVER]['phone_number'] ?? '';
            $twilio_phone_number = preg_replace("#[^0-9]#", '', $twilio_phone_number);
            if (!$twilio_phone_number) {
                \SmsTickets::log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'). Enter Twilio phone number in SMS Tickets settings.', $conversation->mailbox);
                return;
            }

            $twilio_client = \SmsTickets::getTwilioClient($mailbox, true);

            if (!$twilio_client) {
                return;
            }

            // We send only the last reply.
            $replies = $replies->sortByDesc(function ($item, $key) {
                return $item->id;
            });
            $thread = $replies[0];

            // If thread is draft, it means it has been undone
            $thread = $thread->fresh();
            
            if ($thread->isDraft()) {
                return;
            }

            // Attachments.
            $files = [];
            if ($thread->has_attachments) {
                foreach ($thread->attachments as $attachment) {
                    $files[] = $attachment->url();
                }
            }

            // https://www.twilio.com/docs/libraries/php/usage-guide#exceptions
            try {
                $twilio_client->messages->create('+'.$channel_id, [
                    'from' => $twilio_phone_number,
                    'body' => $thread->getBodyAsText(),
                    'mediaUrl' => $files
                ]);
            //} catch (\Twilio\Exceptions\TwilioException $e) {
            } catch (\Exception $e) {
                \SmsTickets::log('Conversation #'.$conversation->number.'. Could not send a reply to the customer (ID '.$customer->id.'; Phone '.$channel_id.'): '.$e->getMessage(), $conversation->mailbox, false);
            }

        }, 20, 3);
    }

    // Botram Twilio does not allow to receive attachments.
    // public static function getDriverClass()
    // {
    //     return \BotMan\Drivers\Twilio\TwilioDriver::class;
    // }

    // public static function getBotman($mailbox, $request = null, $is_webhook = false)
    // {
    //     $driver_config = $mailbox->meta[self::DRIVER] ?? [];

    //     if (empty($driver_config['enabled']) || !(int)$driver_config['enabled'] || empty($driver_config['token'])) {
    //         \SmsTickets::log(self::CHANNEL_NAME.' is not configured for this mailbox.', $mailbox, $is_webhook);
    //         return false;
    //     }
        
    //     \BotMan\BotMan\Drivers\DriverManager::loadDriver(\BotMan\Drivers\Twilio\TwilioDriver::class);
    //     \BotMan\BotMan\Drivers\DriverManager::loadDriver(\BotMan\Drivers\Twilio\TwilioMessageDriver::class);

    //     return \BotMan\BotMan\BotManFactory::create([
    //         'twilio' => $driver_config
    //     ], new \BotMan\BotMan\Cache\LaravelCache());
    // }

    public static function getTwilioClient($mailbox, $is_webhook = false)
    {
        $driver_config = $mailbox->meta[self::DRIVER] ?? [];

        if (empty($driver_config['enabled']) || !(int)$driver_config['enabled'] 
            || empty($driver_config['sid']) || empty($driver_config['token'])
        ) {
            \SmsTickets::log(self::CHANNEL_NAME.' is not configured for this mailbox.', $mailbox, $is_webhook);
            return false;
        }
        
        return new \Twilio\Rest\Client($driver_config['sid'], $driver_config['token']);
    }

    public static function processIncomingMessage($customer_data, $text, $mailbox, $files = [])
    {
        if (in_array($text, self::$skip_messages) && empty($files)) {
            return false;
        }

        // Get or creaate a customer.
        $channel = \SmsTickets::CHANNEL;
        $channel_id = ltrim($customer_data['phone'], '+');

        if (!$channel_id) {
            \SmsTickets::log('Empty sender phone number. Check App Logs', $mailbox, true);
            return;
        }

        $customer = Customer::getCustomerByChannel($channel, $channel_id);

        // Try to find by phone number.
        if (!$customer) {
            // Get first customer by phone number.
            $customer = Customer::findByPhone($channel_id);
            if ($customer) {
                $customer->addChannel($channel, $channel_id);
            }
        }

        if (!$customer) {

            // These two lines will add a record to customer_channel via observer.
            $customer_data['channel'] = $channel;
            $customer_data['channel_id'] = $channel_id;
            $customer_data['first_name'] = $channel_id;
            $customer_data['phones'] = Customer::formatPhones([$channel_id]);

            $customer = Customer::createWithoutEmail($customer_data);

            if (!$customer) {
                \SmsTickets::log('Could not create a customer.', $mailbox, true);
                return;
            }
        }

        // Get last customer conversation or create a new one.
        $conversation = Conversation::where('mailbox_id', $mailbox->id)
            ->where('customer_id', $customer->id)
            ->where('channel', $channel)
            ->orderBy('created_at', 'desc')
            ->first();

        $attachments = [];

        if (count($files)) {
            foreach ($files as $file) {
                if (!$file['url']) {
                    continue;
                }
                $file_url = $file['url'];

                // To aboid https://www.twilio.com/docs/api/errors/20003
                if (strstr($file_url, '/Accounts/')) {
                    // MMS.
                    // https://www.twilio.com/docs/sms/tutorials/how-to-receive-and-download-images-incoming-mms/php-laravel
                    $driver_config = $mailbox->meta[self::DRIVER] ?? [];
                    if (!empty($driver_config['sid']) && !empty($driver_config['token'])) {
                        $file_url = str_replace('https://', 'https://'.$driver_config['sid'].':'.$driver_config['token'].'@', $file_url);
                    }
                    $mms_data = self::getMediaContent($file_url);
                    if ($mms_data) {
                        $attachments[] = [
                            'file_name' => \Helper::remoteFileName($file_url).'.'.preg_replace("#.*/#", '', $file['mime_type']),
                            'data' => base64_encode($mms_data),
                            'mime_type' => $file['mime_type'],
                        ];
                    } else {
                        \SmsTickets::log('Conversation #'.$conversation->number.'. Could not retrieve MMS file data: '.$file['url'], $conversation->mailbox);
                    }
                } else {
                    $attachments[] = [
                        'file_name' => \Helper::remoteFileName($file_url),
                        'file_url' => $file_url,
                        'mime_type' => $file['mime_type'],
                    ];
                }
            }
        }

        if (!$text) {
            $text = ' ';
        }

        $text = nl2br($text);

        if ($conversation) {
            // Create thread in existing conversation.
            Thread::createExtended([
                    'type' => Thread::TYPE_CUSTOMER,
                    'customer_id' => $customer->id,
                    'body' => $text,
                    'attachments' => $attachments,
                ],
                $conversation,
                $customer
            );
        } else {
            // Create conversation.
            Conversation::create([
                    'type' => Conversation::TYPE_CHAT,
                    'subject' => Conversation::subjectFromText($text),
                    'mailbox_id' => $mailbox->id,
                    'source_type' => Conversation::SOURCE_TYPE_WEB,
                    'channel' => $channel,
                ], [[
                    'type' => Thread::TYPE_CUSTOMER,
                    'customer_id' => $customer->id,
                    'body' => $text,
                    'attachments' => $attachments,
                ]],
                $customer
            );
        }
    }

    // https://github.com/TwilioDevEd/receive-mms-laravel/blob/23fb5c947fd41333054db82889142d439e736bc1/app/Services/MediaMessageService/MediaMessageService.php#L7
    public static function getMediaContent($media_url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $media_url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        // Option to follow the redirects, otherwise it will return an XML.
        curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
        \Helper::setCurlDefaultOptions($ch);

        $media = curl_exec($ch);

        curl_close($ch);

        return $media;
    }

    public static function getWebhookUrl($mailbox_id)
    {
        return route('sms_tickets.webhook', ['mailbox_id' => $mailbox_id, 'mailbox_secret' => \SmsTickets::getMailboxSecret($mailbox_id)]);
    }

    public static function getMailboxSecret($id)
    {
        return crc32(config('app.key').$id.'salt'.self::SALT);
    }

    public static function getMailboxVerifyToken($id)
    {
        return crc32(config('app.key').$id.'verify'.self::SALT).'';
    }

    public static function log($text, $mailbox = null, $is_webhook = true)
    {
        \Helper::log(\SmsTickets::LOG_NAME, '['.self::CHANNEL_NAME.($is_webhook ? ' Webhook' : '').'] '.($mailbox ? '('.$mailbox->name.') ' : '').$text);
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
            __DIR__.'/../Config/config.php' => config_path('smstickets.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'smstickets'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/smstickets');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/smstickets';
        }, \Config::get('view.paths')), [$sourcePath]), 'smstickets');
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
