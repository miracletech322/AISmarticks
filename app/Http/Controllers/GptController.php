<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
include_once base_path('Modules/AIAssistant/services/OpenAIService.php');
use Modules\AIAssistant\Services\OpenAIService;

class GptController extends Controller
{
    protected $openAIService;

    public function __construct() {
        $this->openAIService = new OpenAIService("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", "gpt-3.5-turbo");
    }
    public function showIndexPage(): string {
        $messages = [
            ['role' => 'user', 'content' => "Hello. This is Petro from Ukraine"],
        ];
        $res = $this->openAIService->generateResponse($messages);
        var_dump($res);
        exit();
    }
}
