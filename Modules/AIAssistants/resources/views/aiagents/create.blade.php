<form method="POST" action="{{ route('aiagents.store') }}">
    @csrf
    <!-- Form Fields -->
    <div class="form-group">
        <label for="name">Name</label>
        <input type="text" class="form-control" id="name" name="name" required>
    </div>
    <div class="form-group">
        <label for="openai_api_key">OpenAI API Key</label>
        <input type="text" class="form-control" id="openai_api_key" name="openai_api_key" required>
    </div>
    <div class="form-group">
        <label for="model">Model</label>
        <input type="text" class="form-control" id="model" name="model" required>
    </div>
    <div class="form-group">
        <label for="system_prompt">System Prompt</label>
        <textarea class="form-control" id="system_prompt" name="system_prompt"></textarea>
    </div>
    <button type="submit" class="btn btn-primary">Create AI Agent</button>
</form>