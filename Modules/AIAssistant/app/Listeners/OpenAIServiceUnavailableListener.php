<?php

namespace Modules\AIAssistant\Listeners;

use Modules\AIAssistant\Events\OpenAIServiceUnavailable;
use App\Models\User;
use App\Notifications\SystemAlert;

class OpenAIServiceUnavailableListener
{
    public function handle(OpenAIServiceUnavailable $event)
    {
        $message = "OpenAI Service Unavailable: " . $event->message;
        $admins = User::role('admin')->get();
        foreach ($admins as $admin) {
            $admin->notify(new SystemAlert('OpenAI Service Unavailable', $message));
        }
    }
}