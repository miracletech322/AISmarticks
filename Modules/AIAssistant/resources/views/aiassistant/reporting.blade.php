<!-- Display Reporting Dashboard -->
<div class="card">
    <div class="card-header">
        <h2>Reporting Dashboard</h2>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="col-md-6">
                <h3>AI Agent Token Usage</h3>
                <div class="chart-container" style="position: relative; height:40vh; width:80vw">
                    {{-- {!! $chart->renderChart() !!} --}}
                </div>
            </div>
            <div class="col-md-6">
                <h3>AI Agents</h3>
                <ul>
                    @foreach ($aiAgents as $agent)
                        <li>
                            <a href="{{ route('aiassistant.agent-report', $agent->id) }}">{{ $agent->name }}</a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
    </div>
</div>
