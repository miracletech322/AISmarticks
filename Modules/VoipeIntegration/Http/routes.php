<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\VoipeIntegration\Http\Controllers'], function()
{
	Route::get('/mailbox/{mailbox_id}/voipeintegration', ['uses' => 'VoipeIntegrationController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.voipeintegration.settings');
    Route::post('/mailbox/{mailbox_id}/voipeintegration', ['uses' => 'VoipeIntegrationController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
    Route::get('/mailbox/{mailbox_id}/voipesettings', ['uses' => 'VoipeIntegrationController@settingscommon', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.voipeintegration.settingscommon');
    Route::post('/mailbox/{mailbox_id}/voipesettings', ['uses' => 'VoipeIntegrationController@settingscommonSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
    Route::get('/', 'VoipeIntegrationController@index');
});

//Webhook
Route::group(['prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\VoipeIntegration\Http\Controllers'], function()
{
	Route::match(['get','post'], '/voipeintegration/webhook/{mailbox_id}', 'VoipeIntegrationController@webhooks')->name('voipeintegration.webhook');
});