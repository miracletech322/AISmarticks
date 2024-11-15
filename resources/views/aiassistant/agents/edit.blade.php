@extends('layouts.app')

@section('title_full', "AIAssistant".' - '.$mailbox->name)

@section('sidebar')
@include('partials/sidebar_menu_toggle')
@include('mailboxes/sidebar_menu')
@endsection

@section('content')
<div class="section-heading margin-bottom">
    AI Assistant
</div>

<div class="col-xs-12">
    <form method="POST" action="{{ route('aiagents.update', ['mailbox_id'=>$mailbox->id, 'id' => $aiAgent->id]) }}">
        {{ csrf_field() }}
        <div class="form-group">
            <label for="name">Name</label>
            <input type="text" class="form-control" id="name" name="name" value="{{ $aiAgent->name }}" required>
        </div>
        <div class="form-group">
            <label for="openai_api_key">OpenAI API Key</label>
            <input type="text" class="form-control" id="openai_api_key" name="openai_api_key"
                value="{{ $aiAgent->openai_api_key }}" required>
        </div>
        <div class="form-group">
            <label for="model">Model</label>
            <input type="text" class="form-control" id="model" name="model" value="{{ $aiAgent->model }}" required>
        </div>
        <div class="form-group">
            <label for="system_prompt">System Prompt</label>
            <textarea class="form-control" id="system_prompt" name="system_prompt">{{ $aiAgent->system_prompt }}</textarea>
        </div>
        <button type="submit" class="btn btn-primary">Update AI Agent</button>
    </form>
</div>
@endsection