<?php

namespace App\Console\Commands;
use App\Attachment;
use App\Conversation;
use App\Customer;
use App\Email;
use App\Events\ConversationCustomerChanged;
use App\Events\CustomerCreatedConversation;
use App\Events\CustomerReplied;
use App\Events\UserReplied;
use App\Mailbox;
use App\Misc\Mail;
use App\Option;
use App\SendLog;
use App\Subscription;
use App\Thread;
use App\User;
use Illuminate\Console\Command;
use Webklex\IMAP\Client;

class UpdateCurrentFolderCounters extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'freescout:update-current-folder-counters';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Update counters for current marked folders';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        foreach (\App\Folder::where('update_counters',1)->get() as $folder) {
            $folder->updateCounters();
			$folder->update_counters=0;
			$folder->save();
            $this->line('Updated counters for folder: '.$folder->id);
        }
        // error_log('Updating finished');
    }
}
