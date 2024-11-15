<?php

namespace Modules\VoipeIntegration\Providers;

use App\Attachment;
use App\Conversation;
use App\Customer;
use App\CustomerChannel;
use App\Mailbox;
use App\Thread;
use App\User;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;
use Illuminate\Support\Facades\DB;

class VoipeIntegrationServiceProvider extends ServiceProvider
{
	const DRIVER = 'voipeintegration';
	const CHANNEL = 19;
    const CHANNEL_NAME = 'Voipe call';
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
                echo \View::make('voipeintegration::partials/settings_menu', ['mailbox' => $mailbox])->render();
            }
        }, 35);

        \Eventy::addFilter('menu.selected', function($menu) {
            $menu['voipeintegration'] = [
                'mailboxes.voipeintegration.settings',
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

		// Sidebar.
        \Eventy::addAction('conversation.after_prev_convs', function($customer, $conversation, $mailbox) {
			$last_5_conv = [-1];
			$calls = DB::select("SELECT * FROM `voipe_calls` WHERE `callerid`=? AND `conversation_id`<>? AND `conversation_id` IS NOT NULL AND `event` IN ('Incoming','Abandoned') ORDER BY id DESC LIMIT 5", [$customer->channel_id, $conversation->id]);
            foreach ($calls as $ck=>$cv) 
			{
				$calls[$ck]->data=json_decode($cv->data,true);
				if (!in_array($calls[$ck]->conversation_id,$last_5_conv)) $last_5_conv[] = (int)$calls[$ck]->conversation_id;
			}

			$prev_conversations = [];
			$pc = Conversation::where('mailbox_id', $mailbox->id)
								->where('customer_id', $customer->id)
								->whereIn('id', $last_5_conv)
								->where('status', '!=', Conversation::STATUS_SPAM)
								->where('state', Conversation::STATE_PUBLISHED)
								->orderBy('created_at', 'desc')
								->get();

			foreach ($pc as $c) $prev_conversations[$c->number] = $c;

			echo \View::make('voipeintegration::partials/sidebar', [
				'calls'=>$calls,
				'prev_conversations'=>$prev_conversations
			])->render();
        }, 12, 3);

		// \Eventy::addAction('chat_conversation.send_reply', function($conversation, $replies, $customer) {

		// 	if ($conversation->channel != self::CHANNEL) {
        //         return;
        //     }

		// 	$mailbox = $conversation->mailbox;

		// 	// channel_id - is a custumer's number
		// 	$channel_id = $customer->getChannelId(self::CHANNEL);

        //     if (!$channel_id) {
        //         \VoipeIntegration::log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'): customer has no phone number.', $conversation->mailbox);
        //         return;
        //     }

		// 	$voipesms_settings = $mailbox->meta[\VoipeSmsTickets::DRIVER] ?? [];

		// 	if (!@$voipesms_settings['sender']) {
        //         \VoipeIntegration::log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'). Enter sender in VoipeSmsTickets settings.', $conversation->mailbox);
        //         return;
        //     }

		// 	if (!@$voipesms_settings['organisation']) {
        //         \VoipeIntegration::log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'). Enter organisation in VoipeSmsTickets settings.', $conversation->mailbox);
        //         return;
        //     }

		// 	if (!@$voipesms_settings['token']) {
        //         \VoipeIntegration::log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'). Enter token in VoipeSmsTickets settings.', $conversation->mailbox);
        //         return;
        //     }

		// 	// We send only the last reply.
        //     $replies = $replies->sortByDesc(function ($item, $key) {
        //         return $item->id;
        //     });
        //     $thread = $replies[0];

        //     // If thread is draft, it means it has been undone
        //     $thread = $thread->fresh();
            
        //     if ($thread->isDraft()) {
        //         return;
        //     }

		// 	$body=json_encode([
		// 		'app'=>'ws',
		// 		'user'=>$voipesms_settings['organisation'],
		// 		'token'=>$voipesms_settings['token'],
		// 		'op'=>'pv',
		// 		'to'=>$channel_id,
		// 		'msg'=>$thread->getBodyAsText(),
		// 		'from'=>$voipesms_settings['sender']
		// 	]);

		// 	$client = new \GuzzleHttp\Client([
		// 		'headers'=>[
		// 			'Content-Length: '.strlen($body),
		// 			'Content-Type'=>'application/json'
		// 		]
		// 	]);
			
		// 	$response = $client->request('POST', 'https://sms.voipe.co.il/playsms/api.php', ['body' => $body]);
		// 	$statusCode = $response->getStatusCode();
		// 	$content = $response->getBody();
		// 	error_log('VoipeIntegration reply Code = '.$statusCode.', content='.$content);
        // }, 20, 3);

		\Eventy::addAction('conversation.created_by_user', function($conversation, $thread) {
			$thread = $thread->fresh();
            if ($thread->type!=Thread::TYPE_MESSAGE) return;
			$mailbox = $conversation->mailbox;
			$customer=$conversation->customer;
			$voipe_settings = $mailbox->meta[\VoipeIntegration::DRIVER] ?? [];
			if (isset($voipe_settings['joinconversations']))
			{
				if (!in_array($conversation->channel,[self::CHANNEL,\WhatsApp::CHANNEL,\VoipeSmsTickets::CHANNEL])) return;
				
				if (isset($customer->meta['wlastdate'])) if (microtime(true)-$customer->meta['wlastdate']<86000)
				{
					error_log('Lets use whatsapp!');
					\Eventy::action('voipeintegration.sendwhatsapp', $conversation, $thread);
                	return;
				}
				if (@$thread->meta['wtemplate']!='')
				{
					error_log('Lets use whatsapp Template '.$thread->meta['wtemplate'].'!');
					error_log('example');
					error_log('blabla');
					\Eventy::action('voipeintegration.sendwhatsapptemplate', $conversation, $thread);
                	return;
				}
				error_log('No whatsapp session...');
			}
			else
			{
				if ($conversation->channel != self::CHANNEL) {
					return;
				}
			}

			// channel_id - is a custumer's number
			$channel_id = $customer->getChannelId(self::CHANNEL);
			if (!$channel_id) $channel_id=$customer->getChannelId(\WhatsApp::CHANNEL);
			if (!$channel_id) $channel_id=$customer->getChannelId(\VoipeSmsTickets::CHANNEL);
			
            if (!$channel_id) {
                error_log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'): customer has no phone number.');
                return;
            }

            if ($thread->isDraft()) {
                return;
            }
			
			if (!\VoipeSmsTickets::sendSms($mailbox,$channel_id,$thread->getBodyAsText())) return;
			$thread->setMeta('channel','voipesms');
			$thread->save();
			
		}, 20, 3);

		\Eventy::addAction('conversation.user_forwarded', function($conversation, $thread, $forwarded_conversation, $forwarded_thread) {
			$thread = $thread->fresh();
            if ($thread->type!=Thread::TYPE_MESSAGE) return;
			$mailbox = $conversation->mailbox;
			$customer=$conversation->customer;
			$voipe_settings = $mailbox->meta[\VoipeIntegration::DRIVER] ?? [];
			if (isset($voipe_settings['joinconversations']))
			{
				if (!in_array($conversation->channel,[self::CHANNEL,\WhatsApp::CHANNEL,\VoipeSmsTickets::CHANNEL])) return;
				error_log('CUSTOMER = '.json_encode($customer));
			
				if (isset($customer->meta['wlastdate'])) if (microtime(true)-$customer->meta['wlastdate']<86000)
				{
					error_log('Lets use whatsapp!');
					\Eventy::action('voipeintegration.sendwhatsapp', $conversation, $thread);
                	return;
				}
				error_log('No whatsapp session...');
			}
			else
			{
				if ($conversation->channel != self::CHANNEL) {
					return;
				}
			}

			// channel_id - is a custumer's number
			$channel_id = $customer->getChannelId(self::CHANNEL);
			if (!$channel_id) $channel_id=$customer->getChannelId(\WhatsApp::CHANNEL);
			if (!$channel_id) $channel_id=$customer->getChannelId(\VoipeSmsTickets::CHANNEL);
			
            if (!$channel_id) {
                error_log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'): customer has no phone number.');
                return;
            }

			if ($thread->isDraft()) {
                return;
            }

			if (!\VoipeSmsTickets::sendSms($mailbox,$channel_id,$thread->getBodyAsText())) return;
			$thread->setMeta('channel','voipesms');
			$thread->save();
			
		}, 20, 3);

		\Eventy::addAction('conversation.user_replied', function($conversation, $thread) {
			$thread = $thread->fresh();
            if ($thread->type!=Thread::TYPE_MESSAGE) return;
			$mailbox = $conversation->mailbox;
			$customer=$conversation->customer;
			$voipe_settings = $mailbox->meta[\VoipeIntegration::DRIVER] ?? [];
			if (isset($voipe_settings['joinconversations']))
			{
				if (!in_array($conversation->channel,[self::CHANNEL,\WhatsApp::CHANNEL,\VoipeSmsTickets::CHANNEL])) return;
				error_log('CUSTOMER = '.json_encode($customer));
			
				if (isset($customer->meta['wlastdate'])) if (microtime(true)-$customer->meta['wlastdate']<86000)
				{
					error_log('Lets use whatsapp!');
					\Eventy::action('voipeintegration.sendwhatsapp', $conversation, $thread);
                	return;
				}
				error_log('No whatsapp session...');
			}
			else
			{
				if ($conversation->channel != self::CHANNEL) {
					return;
				}
			}

			// channel_id - is a custumer's number
			$channel_id = $customer->getChannelId(self::CHANNEL);
			if (!$channel_id) $channel_id=$customer->getChannelId(\WhatsApp::CHANNEL);
			if (!$channel_id) $channel_id=$customer->getChannelId(\VoipeSmsTickets::CHANNEL);
			
            if (!$channel_id) {
                error_log('Conversation #'.$conversation->number.'. Can not send a reply to the customer (ID '.$customer->id.'; Phone '.$customer->getMainPhoneValue().'): customer has no phone number.');
                return;
            }

            if ($thread->isDraft()) {
                return;
            }
			
			if (!\VoipeSmsTickets::sendSms($mailbox,$channel_id,$thread->getBodyAsText())) return;
			$thread->setMeta('channel','voipesms');
			$thread->save();
			
		}, 20, 3);
    }

	public static function processCallsEvents($from_id, $from_name, $event_data, $mailbox, $files=[], $additional_data=[])
    {
		// error_log('FROMID = '.json_encode($from_id).' FROM_NAME = '.json_encode($from_name).' TEXT = '.json_encode($event_data));
        $channel = \VoipeIntegration::CHANNEL;

		$settings = $mailbox->meta[\VoipeIntegration::DRIVER] ?? [];
		
        $customer_info = null;
		$channel_id = $from_id;
        $customer = Customer::getCustomerByChannel($channel, $channel_id);

		 // Try to find by phone number.
		 if (!$customer) {
            // Get first customer by phone number.
            $customer = Customer::findByPhone($channel_id);
            if ($customer) {
                $customer->addChannel($channel, $channel_id);
            }
        }

        $matched_by_social_profile = false;
        $new = false;

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
                'last_name' => ''
            ];

			$customer = Customer::createWithoutEmail($customer_data);
            $new = true;
        }
		error_log(json_encode(@$settings['joinconversations']));
		if (isset($settings['joinconversations']))
		{
			// Get last customer conversation or create a new one.
			$conversation = Conversation::where('mailbox_id', $mailbox->id)
				->where('customer_id', $customer->id);
			if (!isset($settings['reopenconversations']))
			{
				$conversation=$conversation->where('status','<>',Conversation::STATUS_CLOSED);
			}
			$conversation=$conversation->orderBy('created_at', 'desc')->first();
			error_log('Conversation search');
			// error_log(json_encode($conversation));
		}
		else
		{
			$conversation = Conversation::where('mailbox_id', $mailbox->id)
				->where('customer_id', $customer->id)
				->where('channel', $channel);
			if (!isset($settings['reopenconversations']))
			{
				$conversation=$conversation->where('status','<>',Conversation::STATUS_CLOSED);
			}
			$conversation=$conversation->orderBy('created_at', 'desc')->first();
		}

        $attachments = [];

        if (count($files)) {
            
            foreach ($files as $file) {
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

		if (!isset($settings['event_user'])) return;

		$event_user = User::where('id', $settings['event_user'])->first();
		if (!$event_user || !isset($event_user->id)) return;

		$subject = '';
		$body = '';
		if ($event_data['event']=='Incoming')
		{
			$subject = $settings['templates']['incoming']['subject'];
			$body = $settings['templates']['incoming']['body'];
		}	
		else if ($event_data['event']=='Abandoned')
		{
			$subject = $settings['templates']['abandoned']['subject'];
			$body = $settings['templates']['abandoned']['body'];
		}	
		else if ($event_data['event']=='Abandoned IVR')
		{
			$subject = $settings['templates']['abandonedivr']['subject'];
			$body = $settings['templates']['abandonedivr']['body'];
		}
		else if ($event_data['event']=='Failover')
		{
			$subject = $settings['templates']['failover']['subject'];
			$body = $settings['templates']['failover']['body'];
		}
		else if ($event_data['event']=='Responder sms sent')
		{
			$subject = $settings['templates']['responder']['subject'];
			$body = $settings['templates']['responder']['body'];
		}

		foreach ($event_data as $ek=>$ev) if (!is_null($ev))
		{
			$subject = str_replace('%'.$ek.'%',$ev,$subject);
			$body = str_replace('%'.$ek.'%',$ev,$body);
		}
		
		if (strpos($event_data['callerid'],'05')!==0 && strpos($event_data['callerid'],'9725')!==0 && strpos($event_data['callerid'],'+9725')!==0) 
		{
			// landline phone
			$body.="\r\n\r\n".$settings['landline_warning'];
		}

        $body = nl2br($body);
		$create_conversation=false;
		if ($event_data['event']==='Responder sms sent'&&!isset($settings['joinconversations'])) $create_conversation=true;
		if (!$conversation) $create_conversation=true;

		// error_log('ATTACHMENTS = '.json_encode($attachments));
        if (!$create_conversation) {
			$conversation->status=Conversation::STATUS_ACTIVE;
			$conversation->closed_at=null;
			$conversation->closed_by_user_id=null;
			$conversation->updateFolder();
			$conversation->save();
            // Create thread in existing conversation.
			error_log('Thread - customer_id='.$customer->id.', body='.$body.', userid='.$event_user->id.', conversation_id='.$conversation->id);
            $res = Thread::createExtended([
                    'type' => Thread::TYPE_NOTE,
                    'customer_id' => $customer->id,
                    'body' => $body,
					'created_by_user_id'=>$event_user->id,
                    'attachments' => $attachments,
                ],
                $conversation,
                $customer
            );
			error_log('Thread created');
            
			if (isset($additional_data['voipe_calls_row_id']))
			{
				DB::table('voipe_calls')->where('id',$additional_data['voipe_calls_row_id'])->update(['conversation_id'=>$conversation->id]);
			}
        } else {
			error_log('Create conversation');
            // Create conversation.
            $res = Conversation::create([
                    'type' => Conversation::TYPE_CHAT,
                    'subject' => Conversation::subjectFromText($subject),
                    'mailbox_id' => $mailbox->id,
                    'source_type' => Conversation::SOURCE_TYPE_WEB,
                    'channel' => $channel,
                ], [
					[
						'type' => Thread::TYPE_NOTE,
						'customer_id' => $customer->id,
						'body' => $body,
						'created_by_user_id'=>$event_user->id,
						'attachments' => $attachments,
					],
					[
						'type' => Thread::TYPE_CUSTOMER,
						'customer_id' => $customer->id,
						'body' => ' ',
						'attachments' => [],
					]
				],
                $customer
            );
			error_log('Created conversation');
            
			if (isset($additional_data['voipe_calls_row_id']))
			{
				DB::table('voipe_calls')->where('id',$additional_data['voipe_calls_row_id'])->update(['conversation_id'=>$res['conversation']->id]);
			}
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
            __DIR__.'/../Config/config.php' => config_path('voipeintegration.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'voipeintegration'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/voipeintegration');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/voipeintegration';
        }, \Config::get('view.paths')), [$sourcePath]), 'voipeintegration');
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
