<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\MailSigning\Http\Controllers'], function()
{
    Route::get('/mailbox/{mailbox_id}/mail-signing', ['uses' => 'MailSigningController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.mailsigning.settings');
    Route::post('/mailbox/{mailbox_id}/mail-signing', ['uses' => 'MailSigningController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
});
