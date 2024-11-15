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

class WhatsappBilling extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
		$whatsapp_in = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_in", date('Y-m'),$whatsapp_in,$whatsapp_in]);
		$whatsapp_out = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_out", date('Y-m'),$whatsapp_out,$whatsapp_out]);
		$whatsapp_marketing = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->where('threads.meta', 'like', '%wtcatmarketing%')
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_marketing", date('Y-m'),$whatsapp_marketing,$whatsapp_marketing]);
		$whatsapp_utility = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->where('threads.meta', 'like', '%wtcatutility%')
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_utility", date('Y-m'),$whatsapp_utility,$whatsapp_utility]);
		$whatsapp_authentication = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->where('threads.meta', 'like', '%wtcatauthentication%')
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00'), date('Y-m-01 00:00:00',(int)microtime(true)+(35-date('d'))*24*3600)])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_authentication", date('Y-m'),$whatsapp_authentication,$whatsapp_authentication]);

		$whatsapp_in = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_CUSTOMER])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count(); 
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_in", date('Y-m',(int)microtime(true)-date('d')*24*3600),$whatsapp_in,$whatsapp_in]);
		$whatsapp_out = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_out", date('Y-m',(int)microtime(true)-date('d')*24*3600),$whatsapp_out,$whatsapp_out]);
		$whatsapp_marketing = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->where('threads.meta', 'like', '%wtcatmarketing%')
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_marketing", date('Y-m',(int)microtime(true)-date('d')*24*3600),$whatsapp_marketing,$whatsapp_marketing]);
		$whatsapp_utility = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->where('threads.meta', 'like', '%wtcatutility%')
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_utility", date('Y-m',(int)microtime(true)-date('d')*24*3600),$whatsapp_utility,$whatsapp_utility]);
		$whatsapp_authentication = DB::table('threads')
			->join('conversations', 'threads.conversation_id', '=', 'conversations.id')
			->whereIn('conversations.channel', [WhatsAppServiceProvider::CHANNEL])
			->whereIn('threads.type', [Thread::TYPE_MESSAGE])
			->where('threads.meta', 'like', '%wtcatauthentication%')
			->whereBetween('threads.created_at', [date('Y-m-01 00:00:00',(int)microtime(true)-date('d')*24*3600), date('Y-m-01 00:00:00')])
			->count();
		DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=`cnt`+?', ["whatsapp_authentication", date('Y-m',(int)microtime(true)-date('d')*24*3600),$whatsapp_authentication,$whatsapp_authentication]);
	
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
