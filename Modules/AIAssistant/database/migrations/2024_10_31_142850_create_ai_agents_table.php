<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateAIAgentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ai_agents', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('openai_api_key'); // Encrypted
            $table->string('model'); // e.g., 'gpt-3.5-turbo', 'gpt-4'
            $table->text('system_prompt')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ai_agents');
    }
}



