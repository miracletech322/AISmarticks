<?php

namespace Modules\VoipeSmsTickets\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

use App\Conversation;
use App\Customer;
use App\Mailbox;
use App\Thread;

class VoipeSmsTicketsController extends Controller
{
	// public function webhooks(Request $request, $mailbox_id)//, $mailbox_secret)
    // {
	// 	// if (class_exists('Debugbar')) {
    //     //     \Debugbar::disable();
    //     // }

	// 	error_log('hub.challenge = '.@$request->hub_challenge);
	// 	if (@$request->hub_challenge!='') die($request->hub_challenge);

    //     $mailbox = Mailbox::find($mailbox_id);

    //     if (!$mailbox) {
    //         \VoipeSmsTickets::log('Incorrect webhook URL: '.url()->current(), $mailbox ?? null, true);
    //         abort(404);
    //     }

    //     // Try to get a client.
    //     // $twilio_client = \SmsTickets::getTwilioClient($mailbox, true);
    //     // if (!$twilio_client) {
    //     //     abort(404);
    //     // }

    //     // Check SID.
    //     // if ($mailbox->meta[\SmsTickets::DRIVER]['sid'] != $request->input('AccountSid')) {
    //     //     \SmsTickets::log('Incorrect Account SID received in webhook: '.$request->input('AccountSid'), $mailbox, true);
    //     //     abort(404);
    //     // }

    //     $customer = [
    //         'phone' => $request->input('From') ?? '',
    //         'zip' => $request->input('FromZip') ?? '',
    //         'country' => $request->input('FromCountry') ?? '',
    //         'state' => $request->input('FromState') ?? '',
    //         'city' => $request->input('FromCity') ?? '',
    //     ];

    //     // Build files array.
    //     $files = [];
    //     // $files_count = (int)$request->input('NumMedia');

    //     // for ($i = 0; $i < $files_count; $i++) {
    //     //     $files[] = [
    //     //         'url' => $request->input("MediaUrl".$i) ?? '',
    //     //         'mime_type' => $request->input("MediaContentType".$i) ?? '',
    //     //     ];
    //     // }

    //     \VoipeSmsTickets::processIncomingMessage($customer, $request->input('Body'), $mailbox, $files);
    // }

	/**
     * Settings.
     */
    public function settings($mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);
        
        if (!auth()->user()->isAdmin()) {
            \Helper::denyAccess();
        }

		$settings = $mailbox->meta[\VoipeSmsTickets::DRIVER] ?? [];

        return view('voipesmstickets::settings', [
            'mailbox'   => $mailbox,
            'settings'   => $settings
		]);
    }

	/**
     * Settings save.
     */
    public function settingsSave(Request $request, $mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);

		$current_settings = $mailbox->meta[\VoipeSmsTickets::DRIVER] ?? [];
        $new_settings = $request->settings;

		if (@$current_settings['organisation']===$new_settings['organisation'] && @$current_settings['token']===$new_settings['token'] && @$current_settings['sender']===$new_settings['sender'])
		{
			if (isset($current_settings['last'])) $new_settings['last'] = $current_settings['last'];
		}

        $mailbox->setMetaParam(\VoipeSmsTickets::DRIVER, $new_settings);
        $mailbox->save();

        \Session::flash('flash_success_floating', __('Settings updated'));

        return redirect()->route('mailboxes.voipesmstickets.settings', ['mailbox_id' => $mailbox_id]);
    }

    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        return view('voipesmstickets::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('voipesmstickets::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param  Request $request
     * @return Response
     */
    public function store(Request $request)
    {
    }

    /**
     * Show the specified resource.
     * @return Response
     */
    public function show()
    {
        return view('voipesmstickets::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @return Response
     */
    public function edit()
    {
        return view('voipesmstickets::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param  Request $request
     * @return Response
     */
    public function update(Request $request)
    {
    }

    /**
     * Remove the specified resource from storage.
     * @return Response
     */
    public function destroy()
    {
    }

	/**
     * Ajax controller.
     */
    public function ajaxHtml(Request $request)
    {
        $user = auth()->user();

        switch ($request->action) {
            case 'wf_voipe_sms':
                if (!\Workflow::canEditWorkflows()) {
                    \Helper::denyAccess();
                }
                $value = '';
				$phone = '';
                $mailbox = Mailbox::findOrFail($request->mailbox_id);
                if (!auth()->user()->can('view', $mailbox)) {
                    \Helper::denyAccess();
                }
                return view('voipesmstickets::partials/wf_voipe_sms', [
                    'value' => $value,
                    'mailbox' => $mailbox,
					'phone' => $phone,
                    // 'and_i' => $request->param1 ?? '',
                    // 'row_i' => $request->param2 ?? '',
                ]);
                break;
        }

        abort(404);
    }
}
