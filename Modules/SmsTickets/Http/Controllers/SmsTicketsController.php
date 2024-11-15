<?php

namespace Modules\SmsTickets\Http\Controllers;

use App\Conversation;
use App\Customer;
use App\Mailbox;
use App\Thread;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

class SmsTicketsController extends Controller
{
    public function webhooks(Request $request, $mailbox_id, $mailbox_secret)
    {
        if (class_exists('Debugbar')) {
            \Debugbar::disable();
        }

        //\Log::error('webhook'.json_encode($request->all()));

        $mailbox = Mailbox::find($mailbox_id);

        if (!$mailbox || \SmsTickets::getMailboxSecret($mailbox_id) != $request->mailbox_secret
        ) {
            \SmsTickets::log('Incorrect webhook URL: '.url()->current(), $mailbox ?? null, true);
            abort(404);
        }

        // Try to get a client.
        $twilio_client = \SmsTickets::getTwilioClient($mailbox, true);
        if (!$twilio_client) {
            abort(404);
        }

        // Check SID.
        if ($mailbox->meta[\SmsTickets::DRIVER]['sid'] != $request->input('AccountSid')) {
            \SmsTickets::log('Incorrect Account SID received in webhook: '.$request->input('AccountSid'), $mailbox, true);
            abort(404);
        }
        $customer = [
            'phone' => $request->input('From') ?? '',
            'zip' => $request->input('FromZip') ?? '',
            'country' => $request->input('FromCountry') ?? '',
            'state' => $request->input('FromState') ?? '',
            'city' => $request->input('FromCity') ?? '',
        ];

        // Build files array.
        $files = [];
        $files_count = (int)$request->input('NumMedia');

        for ($i = 0; $i < $files_count; $i++) {
            $files[] = [
                'url' => $request->input("MediaUrl".$i) ?? '',
                'mime_type' => $request->input("MediaContentType".$i) ?? '',
            ];
        }

        \SmsTickets::processIncomingMessage($customer, $request->input('Body'), $mailbox, $files);
    }

    /**
     * Settings.
     */
    public function settings($mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);
        
        if (!auth()->user()->isAdmin()) {
            \Helper::denyAccess();
        }

        $settings = $mailbox->meta[\SmsTickets::DRIVER] ?? [];

        return view('smstickets::settings', [
            'mailbox'   => $mailbox,
            'settings'   => $settings,
        ]);
    }

    /**
     * Settings save.
     */
    public function settingsSave(Request $request, $mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);
        
        $settings = $request->settings;

        $settings['enabled'] = (int)($settings['enabled'] ?? 0);

        $mailbox->setMetaParam(\SmsTickets::DRIVER, $settings);
        $mailbox->save();

        \Session::flash('flash_success_floating', __('Settings updated'));

        return redirect()->route('mailboxes.sms.settings', ['mailbox_id' => $mailbox_id]);
    }
}
