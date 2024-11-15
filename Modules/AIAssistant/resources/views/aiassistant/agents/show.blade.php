<!-- Display AI Agent Details -->
<div class="card">
    <div class="card-header">
        <h2>AI Agent Details</h2>
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <tbody>
                <tr>
                    <th>ID</th>
                    <td>{{ $aiAgent->id }}</td>
                </tr>
                <tr>
                    <th>Name</th>
                    <td>{{ $aiAgent->name }}</td>
                </tr>
                <tr>
                    <th>Model</th>
                    <td>{{ $aiAgent->model }}</td>
                </tr>
                <tr>
                    <th>System Prompt</th>
                    <td>{{ $aiAgent->system_prompt }}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
