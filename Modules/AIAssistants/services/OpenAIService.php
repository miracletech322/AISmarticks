<?php

namespace Modules\AIAssistants\Services;

use GuzzleHttp\Client;
use GuzzleHttp\Exception\RequestException;
use GuzzleHttp\Exception\ConnectException;
use Modules\AIAssistant\Events\OpenAIServiceUnavailable;
use Modules\AIAssistant\Events\OpenAIAuthenticationFailed;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;

/**
 * OpenAI Service Integration
 *
 * @author [Your Name]
 */

class OpenAIService
{
    protected $client;
    protected $apiKey;
    protected $model;
    protected $input_text;
    protected $output_text;
    protected $tokens_used;

    //    public function __construct($apiKey, $model)
    public function __construct()
    {
        //        $this->client = new Client(['base_uri' => 'https://api.openai.com/v1/']);
        //        $this->apiKey = $apiKey;
        //        $this->model = $model;
        $this->client = new Client(['base_uri' => 'https://api.openai.com/v1/']);
        $this->apiKey = "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";
        $this->model = "gpt-3.5-turbo";
    }

    public function generateResponse(array $messages)
    {
        try {
            $response = $this->client->post('chat/completions', [
                'headers' => [
                    'Authorization' => 'Bearer ' . $this->apiKey,
                    'Content-Type' => 'application/json',
                ],
                'json' => [
                    'model' => $this->model,
                    'messages' => $messages,
                ],
                'timeout' => 15,
            ]);

            $body = json_decode($response->getBody(), true);
            $aiResponse = $body['choices'][0]['message']['content'] ?? '';
            $tokensUsed = $body['usage']['total_tokens'] ?? 0;

            $this->input_text = $messages[0]['content'];
            $this->output_text = $aiResponse;
            $this->output_text = $aiResponse;
            $this->tokens_used = $tokensUsed;

            return ['content' => $aiResponse, 'tokens_used' => $tokensUsed];
        } catch (RequestException $e) {
        }
    }

    public function getConversationID()
    {
        $lastRow = DB::table('threads')->latest('id')->first();
        return $lastRow ? $lastRow->conversation_id : '0';
    }

    public function sendMessage($message, $conversation_id)
    {
        $data = [
            'ai_agent_id' => 1,
            'mailbox_id' => 1,
            'conversation_id' => $conversation_id,
            'input_text' => $this->input_text,
            'output_text' => $this->output_text,
            'tokens_used' => $this->tokens_used,
        ];

        DB::table('ai_interaction_logs')->insert($data);

        $client = new Client();
        $headers = [
            'Accept' => 'application/json, text/javascript, */*; q=0.01',
            'Accept-Language' => 'en-US,en;q=0.9',
            'Connection' => 'keep-alive',
            'Cookie' => 'dm_enabled=1; laravel_session=eyJpdiI6IkJ2UkxGeFZ3aGg0aHZUc0w3Z2lLWVE9PSIsInZhbHVlIjoiUHpEWjlmYkF3Zkw1d0dCZ2hlbUhHUVZPa0h5ZjJTOXA3ZlRGY0grQ1UwdXlHME0rb3k3TVpEckhvMThsSnFOSE52ZVNKVXNYVmNjZW42VDRjcHNmY3FQTFFmWnhEY0dkdlFZa0xjYVlNZ0VlYnd6OVpUV0RUdmlMXC92N3JKcmFKIiwibWFjIjoiNGI4OGI5MzhiOTU0ZjYzNmQ5NjdiNGQwODFlNjhkNzVkNWJiNzJkYzM0MmYwYzJhNzE3ZTQ3NzgxYzlmNGFlMyJ9',
            'Origin' => 'https://aitest.smarticks.com',
            'Referer' => 'https://aitest.smarticks.com/conversation/1?folder_id=11&chat_mode=1',
            'User-Agent' => 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36',
            'X-Requested-With' => 'XMLHttpRequest',
            'sec-ch-ua' => '"Chromium";v="130", "Google Chrome";v="130", "Not?A_Brand";v="99"',
            'sec-ch-ua-mobile' => '?0',
            'sec-ch-ua-platform' => '"Windows"',
        ];

        $body = [
            '_token' => 'JfNGrpcYUYZ2wEE7PAa1bzzc4gZPiBzqnNtRCrZc',
            'conversation_id' => $conversation_id,
            'mailbox_id' => '1',
            'saved_reply_id' => '',
            'thread_id' => '',
            'is_note' => '',
            'subtype' => '',
            'conv_history' => '',
            'body' => '<div>' . $message . '</div>',
            'status' => '2',
            'user_id' => '4',
            'after_send' => '2',
            'after_send_default' => '2',
            'action' => 'send_reply',
        ];
        $request = $client->request('POST', 'https://aitest.smarticks.com/conversation/ajax?folder_id=11', [
            'headers' => $headers,
            'json' => $body
        ]);
    }
}
