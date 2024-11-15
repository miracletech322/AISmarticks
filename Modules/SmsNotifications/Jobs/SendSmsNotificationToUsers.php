<?php

namespace Modules\SmsNotifications\Jobs;

use App\Thread;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class SendSmsNotificationToUsers implements ShouldQueue
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
        $phone_numbers = [];

        foreach ($this->users as $user) {
            $phone = \SmsNotifications::sanitizePhone($user->phone);
            if ($phone) {
                $phone_numbers[] = $phone;
            }
        }

        if (empty($phone_numbers)) {
            return;
        }

        // Threads has to be sorted here, if sorted before, they come here in wrong order
        $this->threads = $this->threads->sortByDesc(function ($item, $key) {
            return $item->created_at;
        });

        $last_thread = $this->threads->first();

        // If thread is draft, it means it has been undone
        if (!$last_thread || $last_thread->isDraft()) {
            return;
        }

        // To send URL in some countries whitelisting is requred: https://support.messagebird.com/hc/en-us/articles/360017673738-Complete-list-of-sender-ID-availability-and-restrictions
        //$title = strip_tags($last_thread->getActionPerson($this->conversation->number));
        $body = strip_tags($last_thread->getActionDescription($this->conversation->number.' ('.$this->conversation->subject.')'));
        //$url = $last_thread->conversation->url(null, $last_thread->id, ['mark_as_read' => null]);

        for ($i=0; $i < ceil(count($phone_numbers) / \SmsNotifications::API_RECIPIENTS_LIMIT); $i++) { 
            $phone_numbers_bunch = array_slice($phone_numbers, $i*\SmsNotifications::API_RECIPIENTS_LIMIT, \SmsNotifications::API_RECIPIENTS_LIMIT);
            try {
                \SmsNotifications::sendSmsNotification($phone_numbers_bunch, $body);
            } catch (\Exception $e) {
                \SmsNotifications::log('Error sending SMS: '.$e->getMessage());
            }
        }
    }
}
