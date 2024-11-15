<?php

namespace Modules\AIAssistant\Http\Controllers;

use App\Http\Controllers\Controller;
use Modules\AIAssistant\Models\AIAgent;
use Modules\AIAssistant\Models\AIInteractionLog;
// use Chartjs\Chartjs\Chart;

/**
 * Reporting Controller
 *
 * @author [Your Name]
 */
class ReportingController extends Controller
{
    /**
     * Display the reporting dashboard.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $aiAgents = AIAgent::all();
        $interactionLogs = AIInteractionLog::all();

        // $chart = new Chart();
        // // Setup chart (e.g., Bar Chart)
        // $chart->type('bar');
        // $chart->size(['width' => 400, 'height' => 200]);
        // $chart->labels(['January', 'February', 'March']); // Example labels
        // $chart->datasets([
        //     [
        //         'label' => 'Tokens Used',
        //         'data' => [65, 59, 80], // Example data
        //         'backgroundColor' => [
        //             'rgba(255, 99, 132, 0.2)',
        //             'rgba(54, 162, 235, 0.2)',
        //             'rgba(255, 206, 86, 0.2)',
        //         ],
        //         'borderColor' => [
        //             'rgba(255, 99, 132, 1)',
        //             'rgba(54, 162, 235, 1)',
        //             'rgba(255, 206, 86, 1)',
        //         ],
        //         'borderWidth' => 1,
        //     ],
        // ]);
        // $chart->options([
        //     'title' => [
        //         'display' => true,
        //         'text' => 'AI Agent Token Usage'
        //     ],
        // ]);

        return view('aiassistant::aiassistant.reporting', compact('aiAgents', 'interactionLogs'));
        // return view('aiassistant::aiassistant.reporting', compact('aiAgents', 'interactionLogs', 'chart'));
    }

    /**
     * Display the AI agent usage report.
     *
     * @param int $id
     *
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $aiAgent = AIAgent::find($id);
        $interactionLogs = $aiAgent->interactionLogs;

        // $chart = new Chart();
        // // Setup chart (e.g., Line Chart)
        // $chart->type('line');
        // $chart->size(['width' => 400, 'height' => 200]);
        // $chart->labels(['Day 1', 'Day 2', 'Day 3']); // Example labels
        // $chart->datasets([
        //     [
        //         'label' => 'Tokens Used',
        //         'data' => [10, 20, 30], // Example data
        //         'backgroundColor' => [
        //             'rgba(255, 99, 132, 0.2)',
        //         ],
        //         'borderColor' => [
        //             'rgba(255, 99, 132, 1)',
        //         ],
        //         'borderWidth' => 1,
        //     ],
        // ]);
        // $chart->options([
        //     'title' => [
        //         'display' => true,
        //         'text' => 'AI Agent Token Usage Over Time'
        //     ],
        // ]);

        return view('aiassistant::aiassistant.agent-report', compact('aiAgent', 'interactionLogs'));
        // return view('aiassistant::aiassistant.agent-report', compact('aiAgent', 'interactionLogs', 'chart'));
    }
}