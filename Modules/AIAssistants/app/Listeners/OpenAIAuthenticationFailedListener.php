<?php

namespace Modules\AIAssistant\Listeners;

use Modules\AIAssistant\Events\OpenAIAuthenticationFailed;
use App\Models\User;
use App\Notifications\SystemAlert;

class OpenAIAuthenticationFailedListener
{
    public function handle(OpenAIAuthenticationFailed $event)
    {
        $message = "Authentication failed for OpenAI API Key ending with: " . substr($event->apiKey, -4);
        $admins = User::role('admin')->get();
        foreach ($admins as $admin) {
            $admin->notify(new SystemAlert('OpenAI Authentication Failed', $message));
        }
    }
}
