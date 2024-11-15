<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class AIInteractionLog extends Model
{
    protected $fillable = [
        'ai_agent_id',
        'mailbox_id',
        'conversation_id',
        'input_text',
        'output_text',
        'tokens_used',
    ];

    protected $table = 'ai_interaction_logs';

    public function aiAgent()
    {
        return $this->belongsTo(AIAgent::class);
    }

    /**
     * Relationship: Mailbox
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function mailbox()
    {
        return $this->belongsTo(Mailbox::class);
    }

    /**
     * Relationship: Conversation
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function conversation()
    {
        return $this->belongsTo(Conversation::class);
    }
}
