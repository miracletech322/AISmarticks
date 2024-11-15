@extends('layouts.app')

@section('title_full', __('Whapi dashboard').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')
    <h2>Whapi Channel Health Status</h2>
    <div>
        
		<div class="section-heading margin-bottom">
			{{ __('Whapi dashboard') }}
		</div>

		<a href="" class="btn btn-default" id="whapi_simulate_metrics">Simulate notification (health)</a>
        
		<div class="col-xs-12">
	
			@include('partials/flash_messages')

			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Last update date') }}</label>

				<div class="col-sm-6">
					{{ isset($health['lastUpdateDate'])?$health['lastUpdateDate']:'---' }}
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Lifetime of phone number') }}</label>

				<div class="col-sm-6">
					@if (@$health['lifeTime']==1)
						<span class="badge danger">Use caution</span>
					@elseif (@$health['lifeTime']==2)
						<span class="badge warning">Needs Attention</span>
					@elseif (@$health['lifeTime']==3)
						<span class="badge success">Good Indicator</span>
					@else
						---
					@endif
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Coverage of the address book') }}</label>

				<div class="col-sm-6">
					@if (@$health['riskFactorContacts']==1)
						<span class="badge danger">Use caution</span>
					@elseif (@$health['riskFactorContacts']==2)
						<span class="badge warning">Needs Attention</span>
					@elseif (@$health['riskFactorContacts']==3)
						<span class="badge success">Good Indicator</span>
					@else
						---
					@endif
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Response rate') }}</label>

				<div class="col-sm-6">
					@if (@$health['riskFactorChats']==1)
						<span class="badge danger">Use caution</span>
					@elseif (@$health['riskFactorChats']==2)
						<span class="badge warning">Needs Attention</span>
					@elseif (@$health['riskFactorChats']==3)
						<span class="badge success">Good Indicator</span>
					@else
						---
					@endif
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Overall rating') }}</label>

				<div class="col-sm-6">
					@if (@$health['riskFactor']==1)
						<span class="badge danger">Use caution</span>
					@elseif (@$health['riskFactor']==2)
						<span class="badge warning">Needs Attention</span>
					@elseif (@$health['riskFactor']==3)
						<span class="badge success">Good Indicator</span>
					@else
						---
					@endif
				</div>
			</div>
		</div>
    </div>
@endsection
