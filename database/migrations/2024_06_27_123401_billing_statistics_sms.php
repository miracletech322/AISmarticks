<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Mailbox;
use App\LicenseLimit;
use App\User;
use App\Thread;
use App\Conversation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Modules\WhatsApp\Providers\WhatsAppServiceProvider;
use Modules\VoipeSmsTickets\Providers\VoipeSmsTicketsServiceProvider;

class BillingStatisticsSms extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
		$sms_in = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [VoipeSmsTicketsServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_CUSTOMER])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count(); 
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["sms_in", date('Y-m'),$sms_in,$sms_in]);
		$sms_out = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [VoipeSmsTicketsServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["sms_out", date('Y-m'),$sms_out,$sms_out]);
	
		$sms_in = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [VoipeSmsTicketsServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_CUSTOMER])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count(); 
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["sms_in", date('Y-m',(int)microtime(true)-date('d')*24*3600),$sms_in,$sms_in]);
		$sms_out = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [VoipeSmsTicketsServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["sms_out", date('Y-m',(int)microtime(true)-date('d')*24*3600),$sms_out,$sms_out]);
	}

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        
    }
}
