@extends('layouts.app')

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    <div class="sidebar-title">
        {{ __('Billing and License') }}
    </div>
    <ul class="sidebar-menu">
        <li @if ($section == 'license-subscription')class="active"@endif><i class="glyphicon glyphicon-list-alt"></i> <a href="{{ route('billing_license', ['section' => 'license-subscription']) }}">{{ __('License and subscription') }}</a></li>
        <li @if ($section == 'license')class="active"@endif><i class="glyphicon glyphicon-list-alt"></i> <a href="{{ route('billing_license', ['section' => 'license']) }}">{{ __('License') }}</a></li>
    </ul>
@endsection

@section('content')
    <div class="section-heading">
        {{ $section_name }}
    </div>

    @include('partials/flash_messages')

    <div class="row-container form-container">
        <div class="row">
            <div class="col-xs-12">
                @if($section == 'license')
                    @include('billing-license/license')
                @else
                    @include('billing-license/license-subscription')
                @endif
            </div>
        </div>
    </div>
@endsection