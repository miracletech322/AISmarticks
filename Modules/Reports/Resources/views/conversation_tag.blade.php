@extends('layouts.app')

@section('header_top')
    @parent
    @include('reports::partials/chart-styles')
@endsection

@section('title', __('Conversation Tag Report'))
@section('content_class', 'content-full')

@section('content')
    <div class="container">
        <div class="rpt-header">
            <form id="rpt-filters">
                <div class="rpt-title">{{ __('Conversation Tag Report') }}</div>
                @include('reports::partials/filters')
            </form>
        </div>

        <div id="rpt-report" data-report-name="{{ \Reports::REPORT_CONVERSATION_TAG }}">
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