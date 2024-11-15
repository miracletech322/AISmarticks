<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateLicenseLimitsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('license_limits', function (Blueprint $table) {
            $table->renameColumn('inbox', 'mailbox');
            $table->renameColumn('users', 'max_admin');
            $table->unsignedTinyInteger('max_user')->nullable()->index();
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
            $table->renameColumn('max_admin', 'users');
            $table->dropColumn('max_user');
        });
    }
}
