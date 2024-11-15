<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateMailboxUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('mailbox_user', function (Blueprint $table) {
            // Hide admin from Assign list.
			$table->boolean('only_team')->default(false);
        	$table->boolean('only_unassigned')->default(false);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('mailbox_user', function (Blueprint $table) {
            $table->dropColumn('only_team'); 
			$table->dropColumn('only_unassigned'); 
        });
    }
}
