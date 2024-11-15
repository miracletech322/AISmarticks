<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class BillingReportMail extends Mailable
{
    use Queueable, SerializesModels;
	
	protected $report;
	
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
	public function set_csv($csv)
	{
		$this->report=$csv;
	}
	public function set_subject($subj)
	{
		$this->subject=$subj;
	}

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('billing-license/billing-report-mail')
					->subject($this->subject)
					->attachData($this->report, 'report.csv', [
						'mime'=>'application/csv',
					]);
    }
}
