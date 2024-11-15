<?php

// Admin
Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\VoipeWhatsapp\Http\Controllers'], function()
{
	Route::get('/mailbox/{mailbox_id}/voipewhatsapp', ['uses' => 'VoipeWhatsappController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.voipewhatsapp.settings');
    Route::post('/mailbox/{mailbox_id}/voipewhatsapp', ['uses' => 'VoipeWhatsappController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
    Route::get('/', 'VoipeWhatsappController@index');
});

//Webhook
Route::group([/*'middleware' => 'web', */'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\VoipeWhatsapp\Http\Controllers'], function()
{
	//Route::get('/', 'TelegramIntegrationController@index');
	Route::match(['get', 'post'], '/voipewhatsapp/webhook/{mailbox_id}', 'VoipeWhatsappController@webhooks')->name('voipewhatsapp.webhook');
});