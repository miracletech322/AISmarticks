<?php

// Admin
Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\VoipeSmsTickets\Http\Controllers'], function()
{
	Route::get('/mailbox/{mailbox_id}/voipesmstickets', ['uses' => 'VoipeSmsTicketsController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.voipesmstickets.settings');
    Route::post('/mailbox/{mailbox_id}/voipesmstickets', ['uses' => 'VoipeSmsTicketsController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
    Route::get('/', 'VoipeSmsTicketsController@index');
	Route::get('/mailbox/voipesmstickets/ajax-html/{action}/{mailbox_id}', ['uses' => 'VoipeSmsTicketsController@ajaxHtml'])->name('mailboxes.voipesmstickets.ajax_html');
});

//Webhook
Route::group(['prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\VoipeSmsTickets\Http\Controllers'], function()
{
	Route::match(['get', 'post'], '/voipesmstickets/webhook/{mailbox_id}', 'VoipeSmsTicketsController@webhooks')->name('voipesmstickets.webhook');
});
