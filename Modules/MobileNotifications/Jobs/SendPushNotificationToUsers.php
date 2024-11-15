<?php

namespace Modules\MobileNotifications\Jobs;

use App\Thread;
use Modules\MobileNotifications\Providers\MobileNotificationsServiceProvider;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendPushNotificationToUsers implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $users;

    public $conversation;

    public $threads;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($users, $conversation, $threads)
    {
        $this->users = $users;
        $this->conversation = $conversation;
        $this->threads = $threads;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        // Threads has to be sorted here, if sorted before, they come here in wrong order
        $this->threads = $this->threads->sortByDesc(function ($item, $key) {
            return $item->created_at;
        });

        $last_thread = $this->threads->first();

        // If thread is draft, it means it has been undone
        if (!$last_thread || $last_thread->isDraft()) {
            return;
        }

        $title = strip_tags($last_thread->getActionPerson($this->conversation->number));
        $body = strip_tags($last_thread->getActionDescription($this->conversation->number));
        $url = $last_thread->conversation->url(null, $last_thread->id, ['mark_as_read' => null]);
        $topics = [];

        foreach ($this->users as $user) {
            $topics[] = MobileNotificationsServiceProvider::getUserTopic($user);
        }
        try {
            $result = MobileNotificationsServiceProvider::sendPushNotification($title, $body, $url, $topics);
            if (!$result || empty($result['result']) || $result['result'] == 'error') {
                if (!empty($result['error'])) {
                    \Log::error('[Mobile Notifications] '.$result['error']);
                }
            }
        } catch (\Eception $e) {
            \Log::error('[Mobile Notifications] '.$e->getMessage());
        }
    }
}
