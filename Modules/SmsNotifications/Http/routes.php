<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\SmsNotifications\Http\Controllers'], function()
{
    Route::get('/', 'SmsNotificationsController@index');
});
