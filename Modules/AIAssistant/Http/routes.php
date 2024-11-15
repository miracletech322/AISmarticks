<?php

Route::group(['middleware' => 'web', 'prefix' => \Helper::getSubdirectory(), 'namespace' => 'Modules\AIAssistant\Http\Controllers'], function()
{
    Route::get('/', 'AIAssistantController@index');
});
