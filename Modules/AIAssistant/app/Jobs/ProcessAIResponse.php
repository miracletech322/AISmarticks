<?php
namespace Modules\AIAssistant\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Modules\AIAssistant\Services\OpenAIService;
use Modules\AIAssistant\Models\AIAgentAssignment;
use Modules\AIAssistant\Events\APIUsageLimitApproaching;
use Modules\AIAssistant\Events\APIUsageLimitReached;

/**
 * Process AI Response Job
 *
 * @author [Your Name]
 */
class ProcessAIResponse implements ShouldQueue
{
    use Dispatchable, Queueable;

    protected $ticket;

    /**
     * Constructor
     *
     * @param mixed $ticket
     */
    public function __construct($ticket)
    {
        $this->ticket = $ticket;
    }

    /**
     * Handle the job
     *
     * @return void
     */
    public function handle()
    {
        $ticket = $this->ticket;
        $assignment = $this->getAIAgentAssignment($ticket);

        if ($assignment && $assignment->current_usage < $assignment->monthly_usage_limit) {
            $aiAgent = $assignment->aiAgent;
            $openAIService = new OpenAIService($aiAgent->openai_api_key, $aiAgent->model);
            $messages = $this->buildMessages($ticket, $aiAgent->system_prompt);
            $result = $openAIService->generateResponse($messages);

            $aiResponse = $result['content'];
            $tokensUsed = $result['tokens_used'];

            if ($aiResponse) {
                $this->handleAIResponse($aiResponse, $ticket, $assignment, $tokensUsed);
            }
        }
    }

    /**
     * Get AI Agent Assignment for the given ticket
     *
     * @param mixed $ticket
     *
     * @return AIAgentAssignment|null
     */
    private function getAIAgentAssignment($ticket)
    {
        // Retrieve assignment based on ticket (conversation or mailbox)
        // For demonstration purposes, assume we have a method to fetch the assignment
        return $ticket->getAIAgentAssignment();
    }

    /**
     * Build messages for the AI response generation
     *
     * @param mixed $ticket
     * @param string|null $systemPrompt
     *
     * @return array
     */
    private function buildMessages($ticket, $systemPrompt = null)
    {
        // Construct messages array for AI response generation
        // Include system prompt (if provided) and user input (from the ticket)
        $messages = [];

        if ($systemPrompt) {
            $messages[] = [
                'role' => 'system',
                'content' => $systemPrompt,
            ];
        }

        // Add user input from the ticket
        $messages[] = [
            'role' => 'user',
            'content' => $ticket->getUserInput(),
        ];

        return $messages;
    }

    /**
     * Handle AI Response
     *
     * @param string $aiResponse
     * @param mixed $ticket
     * @param AIAgentAssignment $assignment
     * @param int $tokensUsed
     *
     * @return void
     */
    private function handleAIResponse($aiResponse, $ticket, AIAgentAssignment $assignment, $tokensUsed)
    {
        // Update assignment usage
        $assignment->update([
            'current_usage' => $assignment->current_usage + $tokensUsed,
        ]);

        // Trigger usage alerts if necessary
        $this->checkUsageAlerts($assignment);

        // Respond to the user with the AI-generated response
        // For demonstration purposes, assume we have a method to respond to the user
        $ticket->respondToUser($aiResponse);
    }

    /**
     * Check if usage alerts should be triggered
     *
     * @param AIAgentAssignment $assignment
     *
     * @return void
     */
    private function checkUsageAlerts(AIAgentAssignment $assignment)
    {
        // Calculate usage percentage
        $usagePercentage = ($assignment->current_usage / $assignment->monthly_usage_limit) * 100;

        // Trigger alerts based on the usage threshold
        if ($usagePercentage >= $assignment->usage_alert_threshold) {
            event(new APIUsageLimitApproaching($assignment));
        } elseif ($usagePercentage >= 100) {
            event(new APIUsageLimitReached($assignment));
        }
    }
}