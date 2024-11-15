@extends('layouts.app')

@section('title_full', __('Whapi Channels').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')
    <h2>Whapi Channels</h2>
    <div>
		<div class="section-heading margin-bottom">
			{{ __('Whapi channels') }}
		</div>

		<div class="col-xs-12">
	
			@include('partials/flash_messages')

			@if (!empty($settings['token']))
				{{ $settings['channel_name']??'' }} <a href="{{ \Whapi::getQrUrl($mailbox->id,$settings['token']) }}" target="popup" class="btn btn-default whapiopenpopup">Authorize channel</a><br/>
			@endif
			
			@if (!empty($settings['tokens']))
				@foreach ($settings['tokens'] as $tk=>$token)
					{{ $settings['channels_names'][$tk] ?? '' }} <a href="{{ \Whapi::getQrUrl($mailbox->id,$token) }}" target="popup" class="btn btn-default whapiopenpopup">Authorize channel</a><br/>
				@endforeach
			@endif

			@if (!empty($settings['activated_token']))
				{{ $settings['channel_name']??'' }} <a href="{{ \Whapi::getDeactivateUrl($mailbox->id,$settings['activated_token']) }}" target="popup" class="btn btn-default">Unauthorize channel</a><br/>
			@endif
			@if (!empty($settings['activated_tokens']))
				@foreach ($settings['activated_tokens'] as $tk=>$token)
					{{ $settings['channels_names'][$tk] ?? '' }} <a href="{{ \Whapi::getDeactivateUrl($mailbox->id,$token) }}" target="popup" class="btn btn-default">Unauthorize channel</a><br/>
				@endforeach
			@endif
		</div>
    </div>
@endsection
