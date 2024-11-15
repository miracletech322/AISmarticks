<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\MobileNotifications\Http\Controllers'], function()
{
    Route::get('/', 'MobileNotificationsController@index');
});
