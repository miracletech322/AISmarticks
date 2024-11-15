<div class="rpt-metrics">

    <div class="rpt-metric">
        <div class="rpt-metric-title text-center">
            {{ __('Number of unique tags') }}&nbsp;<i class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="{{ __('Overall tag usage') }}"></i>
        </div>
        <div class="rpt-metric-value text-center">
            {{ $metrics['count_tags']['value'] }}
            @include('reports::partials/metric_change', ['change' => $metrics['count_tags']['change']])
        </div>
    </div>

    <div class="rpt-metric">
        <div class="rpt-metric-title text-center">
            {{ __('Number of tags used in conversations') }}&nbsp;<i class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="{{ __('Number of tags used in conversations') }}"></i>
        </div>
        <div class="rpt-metric-value text-center">
            {{ $metrics['count_used_tags']['value'] }}
            @include('reports::partials/metric_change', ['change' => $metrics['count_used_tags']['change']])
        </div>
    </div>

    <div class="rpt-metric">
        <div class="rpt-metric-title text-center">
            {{ __('Most frequently used tag') }}&nbsp;<i class="glyphicon glyphicon-question-sign" data-toggle="tooltip" title="{{ __('Most frequently used tag') }}"></i>
        </div>
        <div class="rpt-metric-value" style="display: grid;">
            <span class="conv-tags text-center">
                @foreach($metrics['commonly_used_tag']['value'] as $tag)
                    <span class="tag btn btn-primary tag-c-{{ $tag['color'] }}" style="font-size: 18px;padding: 5px 10px;border-color: transparent!important;" data-id="{{ $tag['id'] }}">{{ $tag['name'] }}</span>
                @endforeach
            </span>
        </div>
    </div>

</div>

<canvas id="rpt-chart" class="chart-js">

</canvas>


<div id="rpt-tables" data-menu-text="{{ __('Entries per page') }}" data-paging-text="{{ __('Showing _START_ to _END_ of _TOTAL_ ') }}" style="margin-top: 60px;">
    <div class="row">
        @if (count($table_tags_data))
            <div class="@if (count($table_tags_data)) col-md-4 @else col-md-8 col-md-offset-2 @endif">
                <table class="table table-striped reports_datatable compact display">
                    <thead>
                    <tr>
                        <th>{{ __('#') }}</th>
                        <th>{{ __('Tag') }}</th>
                        <th>{{ __('Count') }}</th>
                        <th>{{ __('Number of customers') }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach ($table_tags_data as $tagData)
                        <tr>
                            <td>
                                {{ $tagData['id'] }}
                            </td>
                            <td>
                                <a href="https://test.smarticks.com/search?f[tag]={{ $tagData['name'] }}" target="_blank">{{ $tagData['name'] }}</a>
                            </td>
                            <td>{{ $tagData['conv_count'] }}</td>
                            <td>{{ $tagData['unique_customer_count'] }}</td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        @endif
    </div>
</div>