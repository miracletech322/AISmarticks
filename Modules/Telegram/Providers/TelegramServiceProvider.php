<?php

namespace Modules\Telegram\Providers;

use App\Mailbox;
use App\Thread;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;

// It has to be included here to require vendor service providers in module.json
require_once __DIR__.'/../vendor/autoload.php';

define('TELEGRAM_MODULE', 'telegram');

class TelegramServiceProvider extends ServiceProvider
{
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
        // Add item to settings sections.
        \Eventy::addFilter('settings.sections', function($sections) {
            $sections['telegram'] = ['title' => __('Telegram'), 'icon' => 'send', 'order' => 600];

            return $sections;
        }, 30);

        // Section settings
        \Eventy::addFilter('settings.section_settings', function($settings, $section) {
           
            if ($section != 'telegram') {
                return $settings;
            }

            $settings = \Option::getOptions([
                'telegram.events',
                'telegram.channels_mapping',
            ]);

            $settings['telegram.bot_token'] = config('telegram.bots.main.token');

            return $settings;
        }, 20, 2);

        // Section parameters.
        \Eventy::addFilter('settings.section_params', function($params, $section) {
           
            if ($section != 'telegram') {
                return $params;
            }
            
            $channels_mapping = [];
            $prev_channels_mapping = \Option::get('telegram.channels_mapping', []);

            $channels_error = false;
            $channels_result = [];
            $channels = [];
            $token_error = '';

            if (config('telegram.bots.main.token')) {
                try {
                    $channels_result = self::getChannels();
                    \Option::set('telegram.active', true);

                    $channels = $channels_result['channels'];

                    if (!$channels_result['fresh']) {
                        $channels_error = true;
                    }
                } catch (\Exception $e) {
                    \Option::set('telegram.active', false);
                    $token_error = $e->getMessage();
                }
            } elseif (\Option::get('telegram.active')) {
                \Option::set('telegram.active', false);
            }
            $mailboxes = Mailbox::select(['id', 'name'])->get();

            foreach ($mailboxes as $mailbox) {
                $mapped = false;
                foreach ($prev_channels_mapping as $mailbox_id => $channel_mapping) {
                    if ($mailbox_id == $mailbox->id) {
                        $mapped = true;
                        break;
                    }
                }
                if (!$mapped) {
                    // Mailbox not mapped to channel yet.
                    $channel_mapping = null;
                }
                $channels_mapping[$mailbox->id] = [
                    'mailbox' => $mailbox,
                    'mapping' => $channel_mapping
                ];
            }

            $params = [
                'template_vars' => [
                    'events' => [
                        'conversation.created'        => __('Conversation Created'),
                        'conversation.assigned'       => __('Conversation Assigned'),
                        'conversation.note_added'     => __('Conversation Note Added'),
                        'conversation.customer_replied' => __('Conversation Customer Reply'),
                        'conversation.user_replied'    => __('Conversation Agent Reply'),
                        //'conversation.merged' => __('Conversation Merged'),
                        //'conversation.moved' => __('Conversation Moved'),
                        'conversation.status_changed'  => __('Conversation Status Updated'),
                    ],
                    'channels_mapping' => $channels_mapping,
                    'channels'         => $channels,
                    'channels_error'   => $channels_error,
                    'token_error'      => $token_error,
                    'active'           => \Option::get('telegram.active'),
                ]
            ];

            // Allow to add extra events
            $params['template_vars']['events'] = \Eventy::filter('telegram.events', $params['template_vars']['events']);

            $params['settings'] = [
                'telegram.bot_token' => [
                    'env' => 'TELEGRAM_BOT_TOKEN',
                ]
            ];

            return $params;
        }, 20, 2);


        // Settings view name
        \Eventy::addFilter('settings.view', function($view, $section) {
            if ($section != 'telegram') {
                return $view;
            } else {
                return 'telegram::settings';
            }
        }, 20, 2);

        // Telegram slack notification.
        // https://telegram-bot-sdk.readme.io/v2.0/reference
        \Eventy::addAction('telegram.post', function($conversation, $pretext, $fields = []) {
            if (!\Option::get('telegram.active') || !config('telegram.bots.main.token')) {
                return false;
            }
            // Detect channel by mailbox.
            $chat_id = '';
            $mailbox_id = $conversation->mailbox_id;
            
            $channels_mapping = \Option::get('telegram.channels_mapping');
            if (!$mailbox_id || empty($channels_mapping) || empty($channels_mapping[$mailbox_id])) {
                return false;
            } else {
                $chat_id = $channels_mapping[$mailbox_id];
            }

            // Count mailboxes.

            // Default fields.
            $default_fields = [
                'conversation' => [
                    'title' => self::telegramEscape($conversation->getSubject()),
                ],
                'customer' => [
                    'title' => __('Customer'),
                    'short' => true,
                ],
                'mailbox' => [
                    'title' => __('Mailbox'),
                    'short' => true,
                ],
            ];

            // Remove mailbox if there is only one active mailbox.
            $mailboxes = \App\Mailbox::getActiveMailboxes();
            if (count($mailboxes) == 1) {
                unset($default_fields['mailbox']);
            }

            if (!is_array($fields)) {
                $fields = [];
            }
            $fields = array_merge($default_fields, $fields);

            $formatted_fields = [];
            foreach ($fields as $name => $field) {
                if (!$field) {
                    continue;
                }
                if (empty($field['value'])) {
                    $value = '';
                    switch ($name) {
                        case 'conversation':
                            $last_reply = null;
                            if (!$conversation->isPhone()) {
                                $last_reply = $conversation->getLastReply();
                            }
                            if (!$last_reply) {
                                $last_reply = $conversation->getLastThread([Thread::TYPE_NOTE]);
                            }
                            if ($last_reply) {
                                $value = $last_reply->body;
                            }
                            $value = \Helper::htmlToText($value);
                            break;
                        case 'customer':
                            $customer = $conversation->customer;
                            $email_markup = '';
                            if ($customer) {
                                $email = $customer->getMainEmail();
                                $email_markup = '<a href="mailto:'.$email.'">'.$email.'</a>';
                            }
                            if ($customer && $customer->getFullName()) {
                                $value = $customer->getFullName().' '.$email_markup;
                            } else {
                                $value = $email_markup;
                            }
                            break;
                        case 'mailbox':
                            $mailbox = $conversation->mailbox;
                            if ($mailbox) {
                                $value = $mailbox->name;
                            }
                            break;
                    }

                    $field['value'] = $value;
                    $fields[$name]['value'] = $value;
                }
                if ($name != 'conversation') {
                    $formatted_fields[] = $field;
                }
            }
            $pretext = $pretext.' <a href="'.$conversation->url().'">#'.$conversation->number.'</a>';

            // if (empty($color)) {
            //     $color = config('app.colors')['main_light'];
            // }

            // Conversation field becomes a text.
            $text = '';
            if ($fields['conversation']) {
                $text = '<b>'.$fields['conversation']['title']."</b>\n";
                $text .= self::prepareValue($fields['conversation']['value'], true);
            }

            $message = $pretext."\n\n".$text;

            // Add fields;
            foreach ($fields as $key => $field) {
                if ($key == 'conversation') {
                    continue;
                }
                $message .= "\n\n<b>".$field['title']."</b>\n".self::prepareValue($field['value']);
            }

            try {
                \TelegramBot::sendMessage([
                    'chat_id' => $chat_id,
                    'parse_mode' => 'HTML',
                    'text' => $message,
                    'disable_web_page_preview' => true
                ]);
            } catch (\Exception $e) {
                \Helper::log('telegram', 'API error: '.$e->getMessage());
            }

            // self::apiCall('chat.postMessage', [
            //     'channel' => $channel,
            //     'attachments' => json_encode([[
            //         'pretext' => $pretext,
            //         'text'    => $text,
            //         'color'   => $color,
            //         "mrkdwn_in" => ["pretext", "text"],
            //         'fields'  => $formatted_fields
            //     ]])
            // ]);
        }, 20, 4);

        // Listeners
        
        // Conversation Created.
        \Eventy::addAction('conversation.created_by_user', function($conversation, $thread) {
            if (!self::isEventEnabled('conversation.created')) {
                return false;
            }
            $user_name = '';
            if ($conversation->created_by_user) {
                $user_name = $conversation->created_by_user->getFullName();
            }
            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __('A <b>New Conversation</b> was created by :user_name', [
                    'user_name'   => self::telegramEscape($user_name),
                ]),
            ]);
        }, 20, 2);

        \Eventy::addAction('conversation.created_by_customer', function($conversation, $thread) {
            if (!self::isEventEnabled('conversation.created')) {
                return false;
            }
            if ($conversation->isSpam()) {
                return false;
            }
            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __('A <b>New Conversation</b> was created'),
            ]);
        }, 20, 2);

        // Conversation assigned
        \Eventy::addAction('conversation.user_changed', function($conversation, $by_user) {
            error_log('conversation.user_changed Telegram start');
			if (!self::isEventEnabled('conversation.assigned')) {
				error_log('conversation.user_changed Telegram stop');
			    return false;
            }
            $assignee_name = '';
            if ($conversation->user_id && $conversation->user) {
                $assignee_name = $conversation->user->getFullName();
            }
            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __('Conversation <b>assigned</b> to <b>:assignee_name</b> by :user_name', [
                    'assignee_name' => self::telegramEscape($assignee_name),
                    'user_name'     => self::telegramEscape($by_user->getFullName()),
                ]),
            ]);
			error_log('conversation.user_changed Telegram stop');
		}, 20, 2);

        // Note added.
        \Eventy::addAction('conversation.note_added', function($conversation, $thread) {
            if (!self::isEventEnabled('conversation.note_added')) {
                return false;
            }
            $note_text = $thread->body;
            $note_text = \Helper::htmlToText($note_text);
            $note_text = self::telegramEscape($note_text);

            $fields['conversation'] = [
                'title' => $conversation->getSubject(),
                'value' => $note_text,
            ];

            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __('A <b>note was added</b> by :user_name', [
                    'user_name'     => self::telegramEscape($thread->created_by_user->getFullName()),
                ]),
                $fields
            ]);
        }, 20, 2);

        // Conversation Customer Reply.
        \Eventy::addAction('conversation.customer_replied', function($conversation, $thread) {
            if (!self::isEventEnabled('conversation.customer_replied')) {
                return false;
            }
            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __('A customer <b>replied</b> to a conversation'),
            ]);
        }, 20, 2);

        // Conversation Agent Reply.
        \Eventy::addAction('conversation.user_replied', function($conversation, $thread) {
            if (!self::isEventEnabled('conversation.user_replied')) {
                return false;
            }
            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __(':user_name <b>replied</b>', [
                    'user_name' => self::telegramEscape($thread->created_by_user->getFullName()),
                ]),
            ]);
        }, 20, 2);

        // Conversation Status Updated
        \Eventy::addAction('conversation.status_changed', function($conversation, $user, $changed_on_reply) {
            error_log('conversation.status_changed Telegram start');
			if ($changed_on_reply || !self::isEventEnabled('conversation.status_changed')) {
				error_log('conversation.status_changed Telegram stop');
			    return false;
            }
            // Create a background job for posting a message.
            \Helper::backgroundAction('telegram.post', [
                $conversation,
                __('Conversation <b>status changed</b> to <b>:status</b> by :user_name', [
                    'status'    => $conversation->getStatusName(),
                    'user_name' => $user->getFullName(),
                ]),
            ]);
			error_log('conversation.status_changed Telegram stop');
		}, 20, 3);
    }

    // To avoid Bad Request: message is too long.
    public static function prepareValue($value, $escape = false)
    {
        if (mb_strlen($value) > 2000) {
            $value = mb_substr($value, 0, 2000).'...';
        } else {
            $value = $value;
        }

        if ($escape) {
            $value = strtr($value, [
                '<' => '&lt;',
                '>' => '&gt;',
            ]);
        }

        return $value;
    }

    public static function isEventEnabled($event)
    {
        $events = \Option::get('telegram.events');
        if (empty($events) || !is_array($events) || !in_array($event, $events)) {
            return false;
        } else {
            return true;
        }
    }

    public static function telegramEscape($text)
    {
        return strtr($text, [
            '&' => '&amp;',
            '<' => '&lt;',
            '>' => '&gt;',
        ]);
    }

    public static function getChannels()
    {
        $fresh = true;
        $channels = \Option::get('telegram_channels', []);
        $updates = [];

        try {
            $updates = \TelegramBot::getUpdates();
        } catch (\Exception $e) {
            if (stristr($e->getMessage(), 'use getUpdates method while webhook is active')) {
                $fresh = false;
            } else {
                throw $e;
            }
        }
// echo "<pre>";
// print_r($updates);
// exit();
        $need_save = false;
        if (!empty($updates)) {
            //$channels = [];
            foreach ($updates as $update) {
                $chat = $update->getChat();
                if (!empty($chat['id'])) {
                    $chat_title = $chat['id'];
                    if (!empty($chat['title'])) {
                        $chat_title = $chat['title'];
                    } elseif (!empty($chat['first_name'])) {
                        $chat_title = $chat['first_name'];
                    }
                    if (!array_key_exists($chat['id'], $channels) || $chat_title != $channels[$chat['id']]) {
                        $channels[$chat['id']] = $chat_title;
                        $need_save = true;
                    }
                }
            }
        } else {
            $channels = [];
        }

        if ($need_save) {
            \Option::set('telegram_channels', $channels);
        }

        return [
            'channels' => $channels,
            'fresh' => $fresh,
        ];
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
        // $this->publishes([
        //     __DIR__.'/../Config/config.php' => config_path('telegram.php'),
        // ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'telegram'
        );
        $this->mergeConfigFrom(
            __DIR__.'/../Config/telegram.php', 'telegram'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/telegram');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/telegram';
        }, \Config::get('view.paths')), [$sourcePath]), 'telegram');
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
