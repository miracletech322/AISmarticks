<?php

// Webhook.
Route::group([/*'middleware' => 'web', */'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\WhatsApp\Http\Controllers'], function()
{
    //Route::get('/', 'WhatsAppController@index');
    Route::match(['get', 'post'], '/whatsapp/webhook/{mailbox_id}/{mailbox_secret}/{system?}', 'WhatsAppController@webhooks')->name('whatsapp.webhook');
});

// Admin.
Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\WhatsApp\Http\Controllers'], function()
{
    Route::get('/mailbox/{mailbox_id}/whatsapp', ['uses' => 'WhatsAppController@settings', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whatsapp.settings');
    Route::post('/mailbox/{mailbox_id}/whatsapp', ['uses' => 'WhatsAppController@settingsSave', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']]);
    Route::get('/mailboxes/{mailbox_id}/whatsapp/templates', ['uses' => 'WhatsAppController@templates', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('mailboxes.whatsapp.templates');
    Route::get('/whatsapp/template/new', 'WhatsAppController@createTemplate')->name('whatsapp.create_template');
    Route::post('/whatsapp/template/new', 'WhatsAppController@createTemplateSave')->name('whatsapp.create_template.save');
    Route::post('/whatsapp/remove-template', ['uses' => 'WhatsAppController@removeTemplate', 'middleware' => ['auth', 'roles'], 'roles' => ['admin']])->name('whatsapp.remove_template');
    Route::get('/whatsapp/template/{template_id}', 'WhatsAppController@viewTemplate')->name('whatsapp.view_template');
	Route::get('/mailbox/whatsapp/ajax-html/{action}/{mailbox_id}', ['uses' => 'WhatsAppController@ajaxHtml'])->name('mailboxes.whatsapp.ajax_html');
	Route::post('/whatsapp/get-template', ['uses' => 'WhatsAppController@getWhatsappTemplate', 'laroute' => true])->name('whatsapp.get_whatsapp_template');
});