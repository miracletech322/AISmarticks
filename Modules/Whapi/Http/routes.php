<?php

// Webhook.
Route::group([/*'middleware' => 'web', */'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\Whapi\Http\Controllers'], function()
{
	//Route::get('/', 'WhapiController@index');
	Route::match(['get', 'post'], '/whapi/webhook/{mailbox_id}/{mailbox_secret}', 'WhapiController@webhooks')->name('whapi.webhook');
});

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\Whapi\Http\Controllers'], function()
{
    Route::get('/mailbox/{mailbox_id}/whapi', ['uses' => 'WhapiController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whapi.settings');
    Route::post('/mailbox/{mailbox_id}/whapi', ['uses' => 'WhapiController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
    Route::get('/mailbox/{mailbox_id}/dashboard', ['uses' => 'WhapiController@dashboard', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whapi.dashboard');
	Route::get('/mailbox/{mailbox_id}/channels', ['uses' => 'WhapiController@channels', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whapi.channels');
	Route::get('/mailbox/{mailbox_id}/channelsqr/{mailbox_secret}', ['uses' => 'WhapiController@channelsqr', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whapi.channelsqr');
	Route::get('/mailbox/{mailbox_id}/channelslogout/{mailbox_secret}', ['uses' => 'WhapiController@channelslogout', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whapi.channelslogout');
	Route::get('/mailbox/whapi/ajax-html/{action}/{mailbox_id}', ['uses' => 'WhapiController@ajaxHtml'])->name('mailboxes.whapi.ajax_html');
	Route::get('/mailbox/whapi/simulate', ['uses' => 'WhapiController@cronMetricsSimulate'])->name('mailboxes.whapi.simulate');
	Route::get('/whapi/report_conversationvolume', ['uses' => 'WhapiController@reportConversationvolume', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_conversationvolume');
    Route::get('/whapi/report_responsetime', ['uses' => 'WhapiController@reportResponsetime', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_responsetime');
    Route::get('/whapi/report_customerengagement', ['uses' => 'WhapiController@reportCustomerengagement', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_customerengagement');
    Route::get('/whapi/report_messagetype', ['uses' => 'WhapiController@reportMessagetype', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_messagetype');
    Route::get('/whapi/report_contentanalysis', ['uses' => 'WhapiController@reportContentanalysis', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_contentanalysis');
    Route::get('/whapi/report_agentperformance', ['uses' => 'WhapiController@reportAgentperformance', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_agentperformance');
    Route::get('/whapi/report_campaigneffectiveness', ['uses' => 'WhapiController@reportCampaigneffectiveness', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whapi.report_campaigneffectiveness');
    
});
