<?php

namespace Modules\VoipeWhatsapp\Providers;

use App\Attachment;
use App\Conversation;
use App\Customer;
use App\CustomerChannel;
use App\Mailbox;
use App\Thread;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;

class VoipeWhatsappServiceProvider extends ServiceProvider
{
	const DRIVER = 'voipewhatsapp';
	const CHANNEL = 12;
    const CHANNEL_NAME = 'VoipeWhatsapp';

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
                echo \View::make('voipewhatsapp::partials/settings_menu', ['mailbox' => $mailbox])->render();
            }
        }, 35);

		\Eventy::addFilter('menu.selected', function($menu) {
            $menu['voipewhatsapp'] = [
                'mailboxes.voipewhatsapp.settings',
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

            $channel_id = $customer->getChannelId(self::CHANNEL);

            if (!$channel_id) {
                \VoipeWhatsapp::log('Can not send a reply to the customer ('.$customer->id.': '.$customer->getFullName().'): customer has no messenger ID.', $conversation->mailbox);
                return;
            }
            // $driver_class = self::getDriverClass();

            // $botman = \TelegramIntegration::getBotman($conversation->mailbox, null, false);

            // if (!$botman) {
            //     return;
            // }

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

            //$botman->typesAndWaits(2);
            
            $text = $thread->getBodyAsText();

			$settings = $conversation->mailbox->meta[\VoipeWhatsapp::DRIVER] ?? [];
			error_log('SETTINGS = '.json_encode($settings));

            // Attachments.
            // Some drivers can not send message with attachment https://github.com/botman/driver-facebook/issues/65
            if ($thread->has_attachments) 
			{
                foreach ($thread->attachments as $attachment) 
				{
					$link=$attachment->url();
					$type='document';
                    switch ($attachment->type) 
					{
                        case Attachment::TYPE_IMAGE:
                            $type='image';
							break;
                        case Attachment::TYPE_VIDEO:
                            $type='video';
							break;
                        case Attachment::TYPE_AUDIO:
                            $type='audio';
							break;
                        default:
                            
							break;
                    }
					$client = new \GuzzleHttp\Client([
						'headers'=>[
							'Authorization'=>'Bearer '.$settings['token'],
							'Content-Type'=>'application/json',
						]
					]);
					$body=json_encode([
						'messaging_product'=>'whatsapp',
						'to'=>$channel_id,
						'type'=>$type,
						$type=>[
							'link'=>$link,
						],
					]);
					if (@$settings['url']=='') $settings['url']='https://graph.facebook.com/v17.0/';
					error_log('POST '.$settings['url'].$settings['phone'].'/messages < '.$body.' (Token: '.$settings['token'].')');
					$response = $client->request('POST', $settings['url'].$settings['phone'].'/messages', ['body' => $body]);
					$statusCode = $response->getStatusCode();
					$content = $response->getBody();
					error_log('Code = '.$statusCode.', content='.$content);
			    }
            }

			if (@$text!='')
			{
				$client = new \GuzzleHttp\Client([
					'headers'=>[
						'Authorization'=>'Bearer '.$settings['token'],
						'Content-Type'=>'application/json',
					]
				]);
				$body=json_encode([
					'messaging_product'=>'whatsapp',
					'to'=>$channel_id,
					'type'=>'text',
					'text'=>[
						'body'=>$text,
					],
				]);
				if (@$settings['url']=='') $settings['url']='https://graph.facebook.com/v17.0/';
				error_log('POST '.$settings['url'].$settings['phone'].'/messages < '.$body.' (Token: '.$settings['token'].')');
				$response = $client->request('POST', $settings['url'].$settings['phone'].'/messages', ['body' => $body]);
				$statusCode = $response->getStatusCode();
				$content = $response->getBody();
				error_log('Code = '.$statusCode.', content='.$content);
			}
        }, 20, 3);
    }

	public static function processIncomingMessage($from_id, $from_name, $text, $mailbox, $files = [])
    {
		error_log('FROMID = '.json_encode($from_id).' FROM_NAME = '.json_encode($from_name).' TEXT = '.json_encode($text));
        // if ($bot->isBot()) {
        //     return false;
        // }

        // if (in_array($text, self::$skip_messages) && empty($files)) {
        //     return false;
        // }

        // $messenger_user = $bot->getUser();

        // // Skip user agent message.
        // if (!$messenger_user) {
        //     \TelegramIntegration::log('Empty user.', $mailbox, true);
        //     return;
        // }

        // // Get or creaate a customer.
        // $channel_id = $messenger_user->getId();
        // if (!$channel_id) {
        //     \TelegramIntegration::log('User has no ID: '.json_encode($messenger_user->getInfo()).'. Check App Logs', $mailbox, true);
        //     return;
        // }
		// 2023/11/24 13:23:10 [error] 3396575#3396575: *3578 FastCGI sent in stderr: "PHP message: hub.challenge = PHP message: JSON DATA = {"object":"whatsapp_business_account","entry":[{"id":"113648304890630","changes":[{"value":{"messaging_product":"whatsapp","metadata":{"display_phone_number":"15550483640","phone_number_id":"100417626233814"},"contacts":[{"profile":{"name":"Roman Apanovici"},"wa_id":"37369799766"}],"messages":[{"from":"37369799766","id":"wamid.HBgLMzczNjk3OTk3NjYVAgASGBQzQURBNDFDNTM3RDNGMUQ0MjFGRgA=","timestamp":"1700832189","text":{"body":"\u0438"},"type":"text"}]},"field":"messages"}]}]}" while reading response header from upstream, client: 173.252.127.21, server: fsupport.voipe.cc, request: "POST /voipewhatsapp/webhook/1 HTTP/1.1", upstream: "fastcgi://unix:/run/php/php8.1-fpm.sock:", host: "fsupport.voipe.cc"
        $channel = \VoipeWhatsapp::CHANNEL;

        $customer_info = null;
		$channel_id = $from_id;
        $customer = Customer::getCustomerByChannel($channel, $channel_id);

        $matched_by_social_profile = false;
        $new = false;

        // // Telegram Bot API allows to get phone number only via special button,
        // // so we can't search customers by phone number here.
        // // Try to find customer by username.
        // if (!$customer) {
        //     $customer_info = $messenger_user->getInfo();

        //     if (!empty($customer_info['user']['username'])) {
        //         $customer = Customer::findCustomersBySocialProfile(
        //             Customer::SOCIAL_TYPE_TELEGRAM,
        //             $customer_info['user']['username'],
        //             self::CHANNEL
        //         )->first();
                
        //         if ($customer) {
        //             $customer->addChannel($channel, $channel_id);
        //             $matched_by_social_profile = true;
        //         }
        //     }
        // }

        if (!$customer) {
            $customer_data = [
                // These two lines will add a record to customer_channel via observer.
                'channel' => $channel,
                'channel_id' => $channel_id,
				'phones'=>[
					[
						'type'=>0,
						'value'=>$channel_id,
					]
				],
                'first_name' => $from_name,
                'last_name' => '',
                // 'social_profiles' => Customer::formatSocialProfiles([[
                //     'type' => Customer::SOCIAL_TYPE_VOIPEWHATSAPP,
                //     'value' => $channel_id,
                // ]])
            ];

            // // Social networks.
            // $email = $customer_info['user']['email'] ?? $customer_info['user']['mail'] ?? '';
            // if ($email) {
            //     $customer = Customer::create($email, $customer_data);
            // } else {
            //     $customer = Customer::createWithoutEmail($customer_data);
            // }
            // if (!$customer) {
            //     \TelegramIntegration::log('Could not create a customer.', $mailbox, true);
            //     return;
            // }
			$customer = Customer::createWithoutEmail($customer_data);
            $new = true;
        }
		// // Get Telegram user photo.
        // if ($matched_by_social_profile || $new) {
        //     $photo_url = '';
        //     try {
        //         $photo_url = $bot->getUserPhoto($messenger_user->getId());
        //     } catch (\Exception $e) {
        //         // Do nothing.
        //     }
            
        //     if ($photo_url) {
        //         if ($customer->setPhotoFromRemoteFile($photo_url)) {
        //             $customer->save();
        //         }
        //     }
        // }
        //$bot->reply('Customer ID:'.$customer->id);

        // Get last customer conversation or create a new one.
        $conversation = Conversation::where('mailbox_id', $mailbox->id)
            ->where('customer_id', $customer->id)
            ->where('channel', $channel)
            ->orderBy('created_at', 'desc')
            ->first();

        $attachments = [];

        if (count($files)) {
            
            foreach ($files as $file) {
                // https://github.com/botman/driver-telegram/issues/102
                // if (method_exists($file, 'getTitle') && $file->getTitle()) {
                //     if ($text == __('Image(s)')) {
                //         $text = '';
                //     } else {
                //         $text .= "\n\n";
                //     }
                //     $text .= $file->getTitle();
                // }
                // if ($file->getPayload()) {
                //     $text .= ": ".json_encode($file->getPayload());
                // }
                // $file_url = $file->getUrl();
                // if (!$file_url) {
                //     continue;
                // }
				if (isset($file['url']))
				{
					$attachments[] = [
						'file_name' => $file['name'],
						'file_url' => $file['url'],
					];
				}
				else if (isset($file['data']))
				{
					$attachments[] = [
						'file_name' => $file['name'],
						'data' => $file['data'],
					];
				}
            }
        }

        $text = nl2br($text);
		error_log('ATTACHMENTS = '.json_encode($attachments));
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

        // // Auto reply to /start.
        // if ($text == '/start' && !empty($mailbox->meta[\TelegramIntegration::DRIVER]['auto_reply'])) {
        //     $bot->reply($mailbox->meta[\TelegramIntegration::DRIVER]['auto_reply']);
        // }
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
            __DIR__.'/../Config/config.php' => config_path('voipewhatsapp.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'voipewhatsapp'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/voipewhatsapp');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/voipewhatsapp';
        }, \Config::get('view.paths')), [$sourcePath]), 'voipewhatsapp');
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
