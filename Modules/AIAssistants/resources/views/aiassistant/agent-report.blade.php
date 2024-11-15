<!-- Display AI Agent Report -->
<div class="card">
    <div class="card-header">
        <h2>{{ $aiAgent->name }} Report</h2>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-12">
                <h3>Token Usage Over Time</h3>
                <div class="chart-container" style="position: relative; height:40vh; width:80vw">
                    {!! $chart->renderChart() !!}
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>Interaction Logs</h3>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Input Text</th>
                            <th>Output Text</th>
                            <th>Tokens Used</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($interactionLogs as $log)
                            <tr>
                                <td>{{ $log->id }}</td>
                                <td>{{ $log->input_text }}</td>
                                <td>{{ $log->output_text }}</td>
                                <td>{{ $log->tokens_used }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
