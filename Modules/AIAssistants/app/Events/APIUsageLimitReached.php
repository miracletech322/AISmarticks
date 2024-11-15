<?php

namespace Modules\AIAssistant\Events;

use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;

/**
 * API Usage Limit Reached Event
 *
 * @author [Your Name]
 */
class APIUsageLimitReached
{
    use Dispatchable, SerializesModels;

    public $assignment;

    /**
     * Constructor
     *
     * @param AIAgentAssignment $assignment
     */
    public function __construct(AIAgentAssignment $assignment)
    {
        $this->assignment = $assignment;
    }
}