<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\Edd\Http\Controllers'], function()
{
    Route::post('/edd/ajax', ['uses' => 'EddController@ajax', 'laroute' => true])->name('edd.ajax');

    Route::get('/mailbox/edd/{id}', ['uses' => 'EddController@mailboxSettings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.edd');
    Route::post('/mailbox/edd/{id}', ['uses' => 'EddController@mailboxSettingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.edd.save');
});
