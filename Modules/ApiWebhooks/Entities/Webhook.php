<?php

namespace App;

namespace Modules\ApiWebhooks\Entities;

use Modules\ApiWebhooks\Entities\WebhookLog;
use Illuminate\Database\Eloquent\Model;

class Webhook extends Model
{
    const MAX_ATTEMPTS = 10;

    public static $events = [
        'convo.assigned',
        'convo.created',
        'convo.deleted',
        'convo.deleted_forever',
        'convo.restored',
        //'convo.merged',
        'convo.moved',
        'convo.status',
        //'convo.tags',
        'convo.customer.reply.created',
        'convo.agent.reply.created',
        'convo.note.created',
        'customer.created',
        'customer.updated',
    ];

    public $timestamps = false;

    protected $casts = [
        'events' => 'array',
        'mailboxes' => 'array',
    ];

    public static function getAllEvents()
    {
        return \Eventy::filter('webhooks.events', self::$events);
    }

    public static function getSecretKey()
    {
        return md5(config('app.key').'webhook_key');
    }

    public function run($event, $data, $webhook_log_id = null)
    {
		error_log('Webhook data = '.json_encode($data));
        \Log::error('Webhook data = '.json_encode($data));
        $options = [
            'timeout' => 30, // seconds
        ];

        $options = \Helper::setGuzzleDefaultOptions($options);

        //foreach ($data as $key => $entity) {
        $params = \ApiWebhooks::formatEntity($data);
        //}

        $this->last_run_time = date('Y-m-d H:i:s');

        try {
			if ($this->headers)
			{
				$options['headers'] = [
					'Content-Type' => 'application/json',
				];
				$headers=explode("\n",$this->headers_text);
				foreach ($headers as $header)
				{
					$header=explode(':',$header,2);
					if (count($header)==2) 
					{
						$header[1]=str_replace('%event%',$event,$header[1]);
						$header[1]=str_replace('%signature%',self::sign(json_encode($params)),$header[1]);
						$options['headers'][$header[0]]=$header[1];
					}
				}
			}
			else
			{
				$options['headers'] = [
					'Content-Type' => 'application/json',
					'X-Smarticks-Event' => $event,
					'X-Smaritcks-Signature' => self::sign(json_encode($params)),
				];
			}
            $options['json'] = $params;
            $response = (new \GuzzleHttp\Client())->request('POST', $this->url, $options);
        } catch (\Exception $e) {
            
            //if (!$webhook_log_id) {
                $this->last_run_error = $e->getMessage();
                $this->save();
            //}

            WebhookLog::add($this, $event, 0, $params, $e->getMessage(), $webhook_log_id);
            return false;
        }

        // https://guzzle3.readthedocs.io/http-client/response.html
        if ($response->getStatusCode() >= 200 && $response->getStatusCode() <= 299) {

            $this->last_run_error = '';
            $this->save();
            
            return true;
        } else {
            $error = 'Response status code: '.$response->getStatusCode();
            //if (!$webhook_log_id) {
                $this->last_run_error = $error;
                $this->save();
            //}

            WebhookLog::add($this, $event, $response->getStatusCode(), $params, $error, $webhook_log_id);
            return false;
        }
    }

    public static function sign($data)
    {
        if (!function_exists('hash_hmac')) {
            \Log::error('Could not sign webhook request. Please install "hash" extension in your PHP.');
            return '';
        }
        
        return base64_encode(hash_hmac('sha1', $data, self::getSecretKey(), true));
    }

    public static function create($data)
    {
        $webhook = null;

        if (!empty($data['url']) && !empty($data['events'])) {

			error_log('WEBHOOK DATA = '.json_encode($data));
            $events = $data['events'];    
            if (!is_array($events)) {
                if (is_string($events)) {
                    $events = explode(',', $events);
                } else {
                    return null;
                }
            }

            // Remove non-existing events.
            foreach ($events as $i => $event) {
                if (!in_array($event, self::$events)) {
                    unset($events[$i]);
                }
            }
            if (!$events) {
                return null;
            }

            $webhook = new \Webhook();
            $webhook->url = $data['url'];
            $webhook->events = $events;
			$webhook->headers = (@$data['headers_type']=='custom');
			$webhook->headers = @$data['headers_text'];
			$webhook->save();

            \ApiWebhooks::clearWebhooksCache();
        }

        return $webhook;
    }
}
