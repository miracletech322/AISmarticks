<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTableVoipeIntegrationEventsTemplates extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // Schema::create('voipe_events_templates', function (Blueprint $table) {
        //     $table->increments('id');
        //     $table->string('event');
        //     $table->text('subject');
		// 	$table->text('body');
        // });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // Schema::dropIfExists('voipe_events_templates');
    }
}
