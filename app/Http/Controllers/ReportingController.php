<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AIAgent;
use App\AIInteractionLog;
use DB;

class ReportingController extends Controller
{
    public function index()
    {
        $aiAgents = AIAgent::all();
        $interactionLogs = AIInteractionLog::all();
        $tokens = AIInteractionLog::select(DB::raw("SUM(tokens_used) as total_tokens"), DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month"))
            ->groupBy('month')
            ->get();

        $monthlyTokens = array_fill(0, 12, 0);
        foreach ($tokens as $item) {
            $monthIndex = (int)substr($item['month'], 5) - 1;
            $monthlyTokens[$monthIndex] = (int)$item['total_tokens'];
        }

        return view('aiassistant.reporting', compact('aiAgents', 'monthlyTokens'));
    }

    public function show()
    {
        $id = request()->query('id');
        $aiAgent = AIAgent::find($id);
        $interactionLogs = AIInteractionLog::where('ai_agent_id', $id)->get();

        $tokens = AIInteractionLog::select(DB::raw("SUM(tokens_used) as total_tokens"), DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month"))
            ->where('ai_agent_id', $id)
            ->groupBy('month')
            ->get();

        $monthlyTokens = array_fill(0, 12, 0);
        foreach ($tokens as $item) {
            $monthIndex = (int)substr($item['month'], 5) - 1;
            $monthlyTokens[$monthIndex] = (int)$item['total_tokens'];
        }

        return view('aiassistant.agent-report', compact('aiAgent', 'interactionLogs', 'monthlyTokens'));
    }
}
