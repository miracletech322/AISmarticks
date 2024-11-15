<?php

namespace Modules\AIAssistant\Listeners;

use Modules\AIAssistant\Events\APIUsageLimitApproaching;
use App\Models\User;
use App\Notifications\SystemAlert;

/**
 * API Usage Limit Approaching Listener
 *
 * @author [Your Name]
 */
class APIUsageLimitApproachingListener
{
    /**
     * Handle the event
     *
     * @param APIUsageLimitApproaching $event
     *
     * @return void
     */
    public function handle(APIUsageLimitApproaching $event)
    {
        // Notify administrators about approaching usage limit
        $admins = User::role('admin')->get();
        foreach ($admins as $admin) {
            $admin->notify(new SystemAlert('API Usage Limit Approaching', 'Usage limit for assignment ID ' . $event->assignment->id . 'is approaching.'));
        }
    }
}