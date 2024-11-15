<?php

use Illuminate\Support\Facades\Route;
use Modules\AIAssistant\Http\Controllers\AIAssistantController;
use Modules\AIAssistant\Http\Controllers\AIAgentController;
use Modules\AIAssistant\Http\Controllers\ReportingController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group([], function () {
    Route::resource('aiassistant', AIAssistantController::class)->names('aiassistant');
    Route::resource("ai-agents", AIAgentController::class)->names("aiagents");
    Route::resource("ai-report", ReportingController::class)->names("aireports");
});

// Route::get("ai-assistant", function () {
//     return view("aiassistant::aiagents.create");
// });

