<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\AIAgent;
use App\Mailbox;

class AIAgentController extends Controller
{
    public function __construct()
    {
        // $this->middleware('can:manage_ai_agents');
    }

    public function index($mailbox_id)
    {
        $aiAgents = AIAgent::all();
        $mailbox = Mailbox::findOrFail($mailbox_id);

        return view('aiassistant.agents.index', [
            'mailbox'   => $mailbox,
            'aiAgents' => $aiAgents
        ]);
    }

    public function create($mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);
        return view('aiassistant.agents.create', ['mailbox'   => $mailbox]);
    }

    public function store(Request $request, $mailbox_id)
    {
        AIAgent::create($request->all());
        return redirect()->route('aiagents.index', ['mailbox_id' => $mailbox_id])->with('success', 'AI Agent created successfully!');
    }

    public function edit($mailbox_id)
    {
        $id = request()->query('id');
        $aiAgent = AIAgent::find($id);
        $mailbox = Mailbox::findOrFail($mailbox_id);

        return view('aiassistant.agents.edit',  [
            'mailbox'   => $mailbox,
            'aiAgent' => $aiAgent
        ]);
    }

    public function update(Request $request, $mailbox_id, $id)
    {
        $aiAgent = AIAgent::find($id);
        $aiAgent->update($request->all());

        return redirect()->route('aiagents.index', ['mailbox_id' => $mailbox_id])->with('success', 'AI Agent updated successfully!');
    }

    public function destroy($mailbox_id, $id)
    {
        $aiAgent = AIAgent::find($id);
        $aiAgent->delete();
        return redirect()->route('aiagents.index', ['mailbox_id' => $mailbox_id])->with('success', 'AI Agent deleted successfully!');
    }
}