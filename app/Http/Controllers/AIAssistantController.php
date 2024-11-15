<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class AIAssistantController extends Controller
{
    public function showLimits()
    {
        $settings = [
            'daily_limit' => config('ai-assistant.daily_limit'),
            'monthly_limit' => config('ai-assistant.monthly_limit'),
        ];
        return view('aiassistant.limits', compact('settings'));
    }

    public function saveLimits(Request $request)
    {
        $request->validate([
            'daily_limit' => 'required|integer|min:0',
            'monthly_limit' => 'required|integer|min:0',
        ]);

        config(['ai-assistant.daily_limit' => $request->input('daily_limit')]);
        config(['ai-assistant.monthly_limit' => $request->input('monthly_limit')]);

        return redirect()->back()->with('success', 'Limits updated successfully.');
    }
}
