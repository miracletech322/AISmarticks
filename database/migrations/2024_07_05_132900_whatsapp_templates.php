<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class WhatsappTemplates extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('whatsapp_templates', function (Blueprint $table) {
            $table->increments('id');
			$table->string('wid',256)->index();
			$table->string('name',256);
			$table->string('namespace',256);
			$table->string('language',20);
			$table->string('components',6000);
			$table->string('full',50000);
		});
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('whatsapp_templates');
    }
}
