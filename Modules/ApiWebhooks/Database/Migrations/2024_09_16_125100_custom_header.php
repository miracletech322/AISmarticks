<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CustomHeader extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('webhooks', function (Blueprint $table) {
            // Mailbox IDs in JSON format.
            $table->boolean('headers')->default(false);
            $table->text('headers_text')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('webhooks', function (Blueprint $table) {
            $table->dropColumn('headers');
            $table->dropColumn('headers_text');
        });
    }
}
