<?php

namespace Modules\AIAssistant\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Http\Request;
use Modules\AIAssistant\Http\Requests\AIAgentRequest;
use Modules\AIAssistant\Models\AIAgent;
use App\Http\Controllers\Controller;

/**
 * AI Agent Controller
 *
 * @author [Your Name]
 */
class AIAgentController extends Controller
{
    public function __construct()
    {
        // Apply authorization middleware
        // $this->middleware('can:manage_ai_agents');
    }

    /**
     * Display a listing of the AI agents.
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $aiAgents = AIAgent::all();

        return view('aiassistant::aiassistant.agents.index', compact('aiAgents'));
    }

    /**
     * Show the form for creating a new AI agent.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('aiassistant::aiassistant.agents.create');
    }

    /**
     * Store a newly created AI agent in storage.
     *
     * @param AIAgentRequest $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        // CSRF protection is automatically handled by Laravel for POST requests
        // $validatedInputs = $request->validated();

        $aiAgent = AIAgent::create(attributes: $request->all());

        return redirect()->route('aiagents.index')->with('success', 'AI Agent created successfully!');
    }

    /**
     * Display the specified AI agent.
     *
     * @param int $id
     *
     * @return \Illuminate\View\View
     */
    public function show($id)
    {
        $aiAgent = AIAgent::find($id);

        return view('aiassistant::aiassistant.agents.show', compact('aiAgent'));
    }

    /**
     * Show the form for editing the specified AI agent.
     *
     * @param int $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id)
    {
        $aiAgent = AIAgent::find($id);

        return view('aiassistant::aiassistant.agents.edit', compact('aiAgent'));
    }

    /**
     * Update the specified AI agent in storage.
     *
     * @param AIAgentRequest $request
     * @param int            $id
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {
        // $validatedInputs = $request->validated();

        $aiAgent = AIAgent::find($id);
        $aiAgent->update($request->all());

        return redirect()->route('aiagents.index')->with('success', 'AI Agent updated successfully!');
    }

    /**
     * Remove the specified AI agent from storage.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $aiAgent = AIAgent::find($id);
        $aiAgent->delete();

        return redirect()->route('aiagents.index')->with('success', 'AI Agent deleted successfully!');
    }
}