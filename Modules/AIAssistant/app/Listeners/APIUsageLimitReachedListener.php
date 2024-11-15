<?php

namespace Modules\AIAssistant\Listeners;

use Modules\AIAssistant\Events\APIUsageLimitReached;
use App\Models\User;
use App\Notifications\SystemAlert;

/**
 * API Usage Limit Reached Listener
 *
 * @author [Your Name]
 */
class APIUsageLimitReachedListener
{
    /**
     * Handle the event
     *
     * @param APIUsageLimitReached $event
     *
     * @return void
     */
    public function handle(APIUsageLimitReached $event)
    {
        // Notify administrators about reached usage limit
        $admins = User::role('admin')->get();
        foreach ($admins as $admin) {
            $admin->notify(new SystemAlert('API Usage Limit Reached', 'Usage limit for assignment ID ' . $event->assignment->id . 'has been reached.'));
        }
    }
}
