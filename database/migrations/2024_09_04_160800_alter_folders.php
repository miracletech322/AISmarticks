<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterFolders extends Migration
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
        Schema::table('folders', function (Blueprint $table) {
            $table->boolean('update_counters')->default(false); 
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('license_limits', function (Blueprint $table) {
            $table->dropColumn('update_counters'); 
        });
    }
}
