<?php

// Webhook.
Route::group([/*'middleware' => 'web', */'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\TelegramIntegration\Http\Controllers'], function()
{
    //Route::get('/', 'TelegramIntegrationController@index');
    Route::match(['get', 'post'], '/telegram/webhook/{mailbox_id}/{mailbox_secret}', 'TelegramIntegrationController@webhooks')->name('telegram.webhook');
});

// Admin.
Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\TelegramIntegration\Http\Controllers'], function()
{
    Route::get('/mailbox/{mailbox_id}/telegram', ['uses' => 'TelegramIntegrationController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.telegram.settings');
    Route::post('/mailbox/{mailbox_id}/telegram', ['uses' => 'TelegramIntegrationController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
});