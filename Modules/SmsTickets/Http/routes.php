<?php

// Webhook.
Route::group([/*'middleware' => 'web', */'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\SmsTickets\Http\Controllers'], function()
{
    Route::match(['get', 'post'], '/sms/webhook/{mailbox_id}/{mailbox_secret}', 'SmsTicketsController@webhooks')->name('sms_tickets.webhook');
});

// Admin.
Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\SmsTickets\Http\Controllers'], function()
{
    Route::get('/mailbox/{mailbox_id}/sms', ['uses' => 'SmsTicketsController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.sms.settings');
    Route::post('/mailbox/{mailbox_id}/sms', ['uses' => 'SmsTicketsController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
});