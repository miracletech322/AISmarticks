<!-- Display AI Agents List -->
<div class="card">
    <div class="card-header">
        <h2>AI Agents</h2>
    </div>
    <div class="card-body">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Model</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($aiAgents as $agent)
                    <tr>
                        <td>{{ $agent->id }}</td>
                        <td>{{ $agent->name }}</td>
                        <td>{{ $agent->model }}</td>
                        <td>
                            <!-- Actions (Edit, Delete) -->
                            <a href="{{ route('aiagents.edit', $agent->id) }}" class="btn btn-sm btn-primary">Edit</a>
                            <form action="{{ route('aiagents.destroy', $agent->id) }}" method="POST"
                                style="display: inline-block">
                                @csrf
                                @method('DELETE')
                                <button type="submit" class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</div>
