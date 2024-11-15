<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\Telegram\Http\Controllers'], function()
{
    Route::get('/', 'TelegramController@index');
});
