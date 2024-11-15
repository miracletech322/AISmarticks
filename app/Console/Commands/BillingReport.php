<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\LicenseLimit;
use App\Mailbox;
use App\Mail\BillingReportMail;

class BillingReport extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'freescout:billing-report';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Save current billing report';

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
		$countWorkflows = \DB::table('workflows')
		->where('active',1)
		->where('mailbox_id','!=','1')
		->count();
		\DB::insert('insert into billing_statistics (type,month,cnt) values (?, ?, ?) ON DUPLICATE KEY UPDATE `cnt`=?', ["count_workflows", date('Y-m'),$countWorkflows,$countWorkflows]);
		
		if (date('d')==1)
		{
			$limits = LicenseLimit::getLimits();
			if ($limits['email']!='')
			{
				try {
					// $mailboxes = Mailbox::get();
					// error_log('Mailboxes = '.json_encode($mailboxes));
					// if (isset($mailboxes[0])) 
					// {
					// 	error_log('Setting mailbox = '.json_encode($mailboxes[0]));
					// 	\MailHelper::setMailDriver($mailboxes[0]);
					// }
					\MailHelper::setSystemMailDriver();
					$mail = new BillingReportMail();
					$mail->set_subject('Smarticks monthly report of '.date('Y-m',(int)microtime(true)-(date('d')+1)*24*3600).', server - '.config('app.url'));
					$mdata=[
						'whatsapp_in'=>0,
						'whatsapp_out'=>0,
						'wtcatmarketing'=>0,
						'wtcatutility'=>0,
						'wtcatauthentication'=>0,
						'sms_in'=>0,
						'sms_out'=>0,
						'count_workflows'=>0,
					];
					$qa = \DB::select('SELECT * FROM `billing_statistics` WHERE `month`=?', [date('Y-m',(int)microtime(true)-(date('d')+1)*24*3600)]);
					foreach ($qa as $q)
					{
						$mdata[$q->type]=$q->cnt;
					}
					$mail->set_csv('Number of total SMS messages,Number of incoming SMS messages,Number of outgoing SMS messages,Number of total WhatsApp messages,Number of incoming WhatsApp messages,Number of outgoing WhatsApp messages,Number of outgoing WhatsApp messages initiated by us (Authentication category),Number of outgoing WhatsApp messages initiated by us (Utility category),Number of outgoing WhatsApp messages initiated by us (Marketing category),Number of set workflows,'."\r\n".($mdata['sms_in'] + $mdata['sms_out']).','.$mdata['sms_in'].','.$mdata['sms_out'].','.($mdata['whatsapp_in'] + $mdata['whatsapp_out']).','.$mdata ['whatsapp_in'].','.$mdata['whatsapp_out'].','.$mdata['wtcatauthentication'].','.$mdata['wtcatutility'].','.$mdata['wtcatmarketing'].','.$mdata['count_workflows'].',');
					\Mail::to([['email' => $limits['email']]])->send($mail);
				} catch (\Exception $e) {
					// We come here in case SMTP server unavailable for example.
					// But Mail does not throw an exception if you specify incorrect SMTP details for example.
					error_log('EXCEPTION '.$e->getMessage());
				}
			}
		}
        $this->info('['.date('Y-m-d H:i:s').'] Billing report built');
    }
}
