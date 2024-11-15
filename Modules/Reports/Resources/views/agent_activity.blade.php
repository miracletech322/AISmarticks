@extends('layouts.app')

@section('header_top')
    @parent
    @include('reports::partials/chart-styles')
@endsection

@section('title', __('Agent Activity Report'))
@section('content_class', 'content-full')

@section('content')
    <div class="container">
        <div class="rpt-header">
            <form id="rpt-filters">
                <div class="rpt-title">{{ __('Agent Activity Report') }}</div>
                @include('reports::partials/filters')
            </form>
        </div>

        <div id="rpt-report" data-report-name="{{ \Reports::REPORT_AGENT_ACTIVITY }}">
            @include('partials/empty', ['icon' => 'refresh', 'extra_class' => 'glyphicon-spin'])
        </div>
    </div>
    @include('partials/include_datepicker')
@endsection

@section('javascript')
    @parent
    initReports();
    initDataTables();
@endsection

@section('body_bottom')
    @parent
    @include('reports::partials/chart-scripts')
@endsection

@section('scripts_after_jquery')
    @parent
    @include('reports::partials/scripts-after-jquery')
@endsection