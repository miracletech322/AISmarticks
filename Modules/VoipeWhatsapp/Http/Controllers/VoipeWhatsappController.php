<?php

namespace Modules\VoipeWhatsapp\Http\Controllers;

use App\Conversation;
use App\Customer;
use App\Mailbox;
use App\Thread;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;


class VoipeWhatsappController extends Controller
{
	public function webhooks(Request $request, $mailbox_id) // , $mailbox_secret)
    {
		// var_dump($request);
		// f11!-21`~~~
		error_log('hub.challenge = '.@$request->hub_challenge);
		if (@$request->hub_challenge!='') die($request->hub_challenge);

		// 2023/11/24 13:23:10 [error] 3396575#3396575: *3578 FastCGI sent in stderr: "PHP message: hub.challenge = PHP message: JSON DATA = {"object":"whatsapp_business_account","entry":[{"id":"113648304890630","changes":[{"value":{"messaging_product":"whatsapp","metadata":{"display_phone_number":"15550483640","phone_number_id":"100417626233814"},"contacts":[{"profile":{"name":"Roman Apanovici"},"wa_id":"37369799766"}],"messages":[{"from":"37369799766","id":"wamid.HBgLMzczNjk3OTk3NjYVAgASGBQzQURBNDFDNTM3RDNGMUQ0MjFGRgA=","timestamp":"1700832189","text":{"body":"\u0438"},"type":"text"}]},"field":"messages"}]}]}" while reading response header from upstream, client: 173.252.127.21, server: fsupport.voipe.cc, request: "POST /voipewhatsapp/webhook/1 HTTP/1.1", upstream: "fastcgi://unix:/run/php/php8.1-fpm.sock:", host: "fsupport.voipe.cc"
		$data = $request->json()->all();
		error_log('JSON DATA = '.json_encode($data));
		$mailbox = Mailbox::find($mailbox_id);
		if (!$mailbox) 
		{
            \VoipeWhatsapp::log('Incorrect webhook URL: '.url()->current(), $mailbox ?? null, true);
            abort(404);
        }
		$settings = $mailbox->meta[\VoipeWhatsapp::DRIVER] ?? [];
		
		if (isset($data['entry'])) foreach ($data['entry'] as $entry) if (isset($entry['changes'])) foreach ($entry['changes'] as $change) if (isset($change['value']['messages'])) foreach ($change['value']['messages'] as $message) 
		{
			if (isset($message['text']['body'])) \VoipeWhatsapp::processIncomingMessage($message['from'], $change['value']['contacts'][0]['profile']['name'], $message['text']['body'], $mailbox);
			if ($message['type']!='text')
			{
				if (isset($message[$message['type']]['id']))
				{
					$client = new \GuzzleHttp\Client([
						'headers'=>[
							'Authorization'=>'Bearer '.$settings['token'],
							'Content-Type'=>'application/json',
						]
					]);
					// $body=json_encode([
					// 	'messaging_product'=>'whatsapp',
					// 	'to'=>$channel_id,
					// 	'type'=>$type,
					// 	$type=>[
					// 		'link'=>$link,
					// 	],
					// ]);
					if (@$settings['url']=='') $settings['url']='https://graph.facebook.com/v17.0/';
					error_log('GET '.$settings['url'].$message[$message['type']]['id'].' (Token: '.$settings['token'].')');
					$response = $client->request('GET', $settings['url'].$message[$message['type']]['id']);
					$statusCode = $response->getStatusCode();
					$content = $response->getBody();
					error_log('Code = '.$statusCode.', content='.$content);
					if ($sa=json_decode($content,true)) if (isset($sa['url']))
					{
						//Downloading
						$client = new \GuzzleHttp\Client([
							'headers'=>[
								'Authorization'=>'Bearer '.$settings['token'],
								'Content-Type'=>'application/json',
							]
						]);
						if (@$settings['url']=='')
						{
							$url=$sa['url'];
						}
						else
						{
							$url=$settings['url'].'download_media.php?url='.urlencode($sa['url']);
						}
						error_log('GET '.$url.' (Token: '.$settings['token'].')');
						$response = $client->request('GET', $url);
						$statusCode = $response->getStatusCode();
						$content = $response->getBody();
						error_log('RECEIVED code '.$statusCode.', content size = '.strlen($content));
						if (isset($message[$message['type']]['filename']))
						{
							$filename=$message[$message['type']]['filename'];
							error_log('SET FILENAME '.$filename);
						}
						else if (isset($message[$message['type']]['mime_type']))
						{
							error_log('CHECK MIME '.$message[$message['type']]['mime_type']);
							switch ($message[$message['type']]['mime_type'])
							{
								case 'text/plain':
									$filename='somefile.txt';
									break;
								case 'application/vnd.ms-powerpoint':
									$filename='somefile.ppt';
									break;
								case 'application/msword':
									$filename='somefile.doc';
									break;
								case 'application/vnd.ms-excel':
									$filename='somefile.xls';
									break;
								case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
									$filename='somefile.docx';
									break;
								case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
									$filename='somefile.pptx';
									break;
								case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
									$filename='somefile.xlsx';
									break;
								default:
									$filename=preg_replace('/^.+\\//uis','somefile.',$message[$message['type']]['mime_type']);
									break;
							}
							error_log('SET FILENAME '.$filename);
						}
						else
						{
							$filename='somefile';
							error_log('SET FILENAME '.$filename);
						}
						if ($content!='') \VoipeWhatsapp::processIncomingMessage($message['from'], $change['value']['contacts'][0]['profile']['name'], $filename, $mailbox,[['name'=>$filename,'data'=>base64_encode($content)]]);
					}
					// \VoipeWhatsapp::processIncomingMessage($message['from'], $change['value']['contacts'][0]['profile']['name'], $message['text']['body'], $mailbox);
				}
			}
		}
		// error_log(json_encode(@$request->hub_challenge));
		// echo json_encode([
		// 	'hub.challenge'=>@$request->hub_challenge,
		// ]);
        // if (class_exists('Debugbar')) {
        //     \Debugbar::disable();
        // }

        // $mailbox = Mailbox::find($mailbox_id);

        // if (!$mailbox || \VoipeWhatsapp::getMailboxSecret($mailbox_id) != $request->mailbox_secret
        // ) {
        //     \VoipeWhatsapp::log('Incorrect webhook URL: '.url()->current(), $mailbox ?? null, true);
        //     abort(404);
        // }

        // $botman = \VoipeWhatsapp::getBotman($mailbox, $request, true);

        // if (!$botman) {
        //     abort(404);
        // }

        // $botman->hears('(.*)', function ($bot, $text) use ($mailbox) {
        //     // Text is obtained from the payload to prevent removal of newlines
        //     // in the message text.
        //     $data = $bot->getMessage()->getPayload();
        //     $text = $data['text'] ?? $text;

        //     \TelegramIntegration::processIncomingMessage($bot, $text, $mailbox);
        // });

        // $botman->receivesFiles(function($bot, $files) use ($mailbox) {

        //     \TelegramIntegration::processIncomingMessage($bot, __('File(s)'), $mailbox, $files);

        //     // foreach ($files as $file) {

        //     //     $url = $file->getUrl(); // The direct url
        //     //     $payload = $file->getPayload(); // The original payload
        //     // }
        // });

        // $botman->receivesImages(function($bot, $images) use ($mailbox) {
        //     \TelegramIntegration::processIncomingMessage($bot, __('Image(s)'), $mailbox, $images);

        //     // foreach ($images as $image) {

        //     //     $url = $image->getUrl(); // The direct url
        //     //     $title = $image->getTitle(); // The title, if available
        //     //     $payload = $image->getPayload(); // The original payload
        //     // }
        // });

        // $botman->receivesVideos(function($bot, $videos) use ($mailbox) {
        //     \TelegramIntegration::processIncomingMessage($bot, __('Video(s)'), $mailbox, $videos);
        //     // foreach ($videos as $video) {

        //     //     $url = $video->getUrl(); // The direct url
        //     //     $payload = $video->getPayload(); // The original payload
        //     // }
        // });

        // $botman->receivesAudio(function($bot, $audios) use ($mailbox) {
        //     \TelegramIntegration::processIncomingMessage($bot, __('Audio'), $mailbox, $audios);
        //     // foreach ($audios as $audio) {

        //     //     $url = $audio->getUrl(); // The direct url
        //     //     $payload = $audio->getPayload(); // The original payload
        //     // }
        // });

        // $botman->receivesLocation(function($bot, $location) use ($mailbox) {
        //     \TelegramIntegration::processIncomingMessage($bot, __('Location: '.$location->getLatitude().','.$location->getLongitude()), $mailbox);
        //     // $lat = $location->getLatitude();
        //     // $lng = $location->getLongitude();
        // });

        // $botman->listen();
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

		$settings = $mailbox->meta[\VoipeWhatsapp::DRIVER] ?? [];

        return view('voipewhatsapp::settings', [
            'mailbox'   => $mailbox,
            'settings'   => $settings,
			'webhookurl' => route('voipewhatsapp.webhook', ['mailbox_id' => $mailbox_id]),
		]);
    }
	/**
     * Settings save.
     */
    public function settingsSave(Request $request, $mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);
        
        $settings = $request->settings;

        // $webhooks_enabled = (int)($mailbox->meta[\VoipeWhatsapp::DRIVER]['enabled'] ?? 0);

        // $settings['enabled'] = (int)($settings['enabled'] ?? 0);

        // // Try to add a webhook.
        // if (!$webhooks_enabled && (int)$settings['enabled']) {
        //     $result = \VoipeWhatsapp::setWebhook($settings['token'] ?? '', $mailbox->id);

        //     if (!$result['result']) {
        //         $settings['enabled'] = false;
        //         \Session::flash('flash_error', __('Error occurred setting up a Whatsapp webhook').': '.$result['msg']);
        //     }
        // }
        // // Remove webhook.
        // if ($webhooks_enabled && !(int)$settings['enabled']) {
        //     $result = \VoipeWhatsapp::setWebhook($settings['token'] ?? '', $mailbox->id, true);

        //     if (!$result['result'] && !strstr($result['msg'], 'Unauthorized')) {
        //         $settings['enabled'] = true;
        //         \Session::flash('flash_error', __('Error occurred removing a Whatsapp webhook').': '.$result['msg']);
        //     }
        // }

        $mailbox->setMetaParam(\VoipeWhatsapp::DRIVER, $settings);
        $mailbox->save();

        \Session::flash('flash_success_floating', __('Settings updated'));

        return redirect()->route('mailboxes.voipewhatsapp.settings', ['mailbox_id' => $mailbox_id]);
    }

    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        return view('voipewhatsapp::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('voipewhatsapp::create');
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
        return view('voipewhatsapp::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @return Response
     */
    public function edit()
    {
        return view('voipewhatsapp::edit');
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
}
