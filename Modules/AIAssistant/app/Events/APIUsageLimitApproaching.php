<?php

namespace Modules\AIAssistant\Events;

use Illuminate\Queue\SerializesModels;
use Illuminate\Foundation\Events\Dispatchable;

/**
 * API Usage Limit Approaching Event
 *
 * @author [Your Name]
 */
class APIUsageLimitApproaching
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