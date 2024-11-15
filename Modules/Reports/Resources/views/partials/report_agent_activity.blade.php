<div class="rpt-metrics">

    <div class="rpt-metric">
        <div class="rpt-metric-title">
            {{ __('Number of conversations handled') }}&nbsp;<i class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="{{ __('Number of conversations handled') }}"></i>
        </div>
        <div class="rpt-metric-value">
            {{ $metrics['conv_handled']['value'] }}
            @include('reports::partials/metric_change', ['change' => $metrics['conv_handled']['change']])
        </div>
    </div>

    <div class="rpt-metric">
        <div class="rpt-metric-title">
            {{ __('Responses made') }}&nbsp;<i class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="{{ __('Responses made') }}"></i>
        </div>
        <div class="rpt-metric-value">
            {{ $metrics['responses_made']['value'] }}
            @include('reports::partials/metric_change', ['change' => $metrics['responses_made']['change']])
        </div>
    </div>

    <div class="rpt-metric">
        <div class="rpt-metric-title text-center">
            {{ __('Average handling time') }}
        </div>
        <div class="rpt-metric-value text-center">
            {{ $metrics['average_handling']['value'] }}
            @include('reports::partials/metric_change', ['change' => $metrics['average_handling']['change']])
        </div>
    </div>

</div>

    <canvas id="rpt-chart" class="chart-js">

    </canvas>


<div id="rpt-tables" data-menu-text="{{ __('Entries per page') }}" data-paging-text="{{ __('Showing _START_ to _END_ of _TOTAL_ ') }}" style="margin-top: 60px;">
    <div class="row">
        @if (count($table_agents))
            <div class="@if (count($table_agents)) col-md-12 @else col-md-8 col-md-offset-2 @endif">
                <table class="table table-striped agent_activity reports_datatable compact display">
                    <thead>
                    <tr>
                        <th  scope="col" data-toggle="tooltip"  title="{{ __('Users activity') }}">
                            <span class="th-full">{{ __('Users activity') }}</span>
                            <span class="th-medium">{{ __('Users') }}</span>
                            <span class="th-small">{{ __('Users') }}</span>
                        </th>
                        <th  scope="col" data-toggle="tooltip"  title="{{ __('Conversations Handled') }}">
                            <span class="th-full">{{ __('Conversations Handled') }}</span>
                            <span class="th-medium">{{ __('Conversations') }}</span>
                            <span class="th-small"><i class="glyphicon glyphicon-comment"></i></span>
                        </th>
                        <th  scope="col" data-toggle="tooltip"  title="{{ __('Responses made') }}">
                            <span class="th-full">{{ __('Responses made') }}</span>
                            <span class="th-medium">{{ __('Responses') }}</span>
                            <span class="th-small"><i class="glyphicon glyphicon-share-alt"></i></span>
                        </th>
                        <th  scope="col" data-toggle="tooltip"  title="{{ __('Handling Time') }}">
                            <span class="th-full">{{ __('Handling Time') }}</span>
                            <span class="th-medium">{{ __('Time') }}</span>
                            <span class="th-small">{{ __('Time') }}</span>
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($table_agents as $agent)
                        <tr>
                            <td><a href="{{ route('users.profile', ['id' => $agent['user']->id]) }}" target="_blank">{{ $agent['user']->getFullName(true) }}</a></td>
                            <td>{{ $agent['conversations_count'] }}</td>
                            <td>{{ $agent['responses'] }}</td>
                            <td>{{ $agent['handling_time'] }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        @endif
    </div>
</div>

@section('javascript')
    @parent
    // initTooltips();
@endsection