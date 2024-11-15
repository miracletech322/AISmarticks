<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class BillingTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // We preserve "channel" and "channel_id" fields in "customers" table.
        // They allow to figure out that there is a record in customer_channel table.
        Schema::create('billing_statistics', function (Blueprint $table) {
            $table->increments('id');
            $table->string('type', 256);
            $table->string('month', 256);
			$table->integer('cnt');
			$table->unique(['type', 'month']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('billing_statistics');
    }
}
