@extends('layouts.app')

@section('title_full', __('Voipe Integration').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('Voipe Integration') }}
    </div>

    <div class="col-xs-12">
  
        @include('partials/flash_messages')

        <form class="form-horizontal margin-bottom" method="POST" action="" autocomplete="off">
            {{ csrf_field() }}

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Webhook url') }}</label>

                <div class="col-sm-6">
                    {{ $webhookurl ?? '' }}
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('PBX Server') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[pbx_server]" value="{{ $settings['pbx_server'] ?? '' }}" required>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Organisation') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[organisation]" value="{{ $settings['organisation'] ?? '' }}" required>
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Bucket connection') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[bucket]" value="{{ $settings['bucket'] ?? '' }}" required>
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Queues at which to enable events (list separated by commas)') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[queues]" value="{{ $settings['queues'] ?? '' }}">
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Events at which to create new chats') }}</label>
				<div class="col-sm-6">
					<div>
						<input type="checkbox" id="voipe_module_e1" name="settings[events][incoming]" {{ (isset($settings['events']['incoming']))?'checked':'' }}>
						<label for="voipe_module_e1">{{ __('Queue incoming') }}</label>
					</div>
					<div>
						<input type="checkbox" id="voipe_module_e2" name="settings[events][abandoned]" {{ (isset($settings['events']['abandoned']))?'checked':'' }}>
						<label for="voipe_module_e2">{{ __('Queue abandoned') }}</label>
					</div>
					<div>
						<input type="checkbox" id="voipe_module_e3" name="settings[events][failover]" {{ (isset($settings['events']['failover']))?'checked':'' }}>
						<label for="voipe_module_e3">{{ __('Queue failover') }}</label>
					</div>
					<div>
						<input type="checkbox" id="voipe_module_e4" name="settings[events][abandonedivr]" {{ (isset($settings['events']['abandonedivr']))?'checked':'' }}>
						<label for="voipe_module_e4">{{ __('Abandoned IVR') }}</label>
					</div>
				</div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Responder') }}</label>
				<div class="col-sm-6">
					<div>
						<input type="checkbox" id="voipe_module_e4" name="settings[responder]" {{ (isset($settings['responder']))?'checked':'' }}>
						<label for="voipe_module_e4">{{ __('Create new chat for responder requests') }}</label>
					</div>
				</div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Event user') }}</label>
				<div class="col-sm-6">
					<div>
						<select class="form-control input-sized-lg" name="settings[event_user]">
							@foreach ($users as $user)
								@php $selected=''; @endphp
								@if (@$settings['event_user']==$user->id) @php $selected="selected"; @endphp @endif
								<option value="{{ $user->id }}" {{ $selected }} >{{ $user->first_name }} {{ $user->last_name }}</option>
							@endforeach
						</select>
					</div>
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Landline phone number wrning') }}</label>
				<div class="col-sm-6">
					<!-- <textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="templates[responder][body]" value="{{ (isset($templates['responder']['body']))?$templates['responder']['body']:'' }}"></textarea> -->
					<textarea class="form-control input-sized-lg" rows=4 name="settings[landline_warning]">{{ (isset($settings['landline_warning']))?$settings['landline_warning']:'' }}</textarea>
					<!-- Please notice this is a landline phone number which is not receiving sms messages. Please contact the customer via a phone call. -->
				</div>
            </div>
	
			<br>
			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important"></label>
				<div class="col-sm-6"><b>{{ __('Incoming event template') }}</b></div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Subject') }}</label>
				<div class="col-sm-6">
					<!-- <input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="templates[incoming][subject]" value="{{ (isset($templates['incoming']['subject']))?$templates['incoming']['subject']:'' }}"> -->
					<input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="settings[templates][incoming][subject]" value="{{ (isset($settings['templates']['incoming']['subject']))?$settings['templates']['incoming']['subject']:'' }}">
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Body') }}</label>
				<div class="col-sm-6">
					<!-- <textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="templates[incoming][body]" value="{{ (isset($templates['incoming']['body']))?$templates['incoming']['body']:'' }}"></textarea> -->
					<textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="settings[templates][incoming][body]">{{ (isset($settings['templates']['incoming']['body']))?$settings['templates']['incoming']['body']:'' }}</textarea>
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Available parameters') }}</label>
				<div class="col-sm-6">
					%event% %date_time% %queue_name% %queue_number% %extensions% %callerid%
				</div>
            </div>

			<br>
			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important"></label>
				<div class="col-sm-6"><b>{{ __('Abandoned event template') }}</b></div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Subject') }}</label>
				<div class="col-sm-6">
					<!-- <input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="templates[abandoned][subject]" value="{{ (isset($templates['abandoned']['subject']))?$templates['abandoned']['subject']:'' }}"> -->
					<input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="settings[templates][abandoned][subject]" value="{{ (isset($settings['templates']['abandoned']['subject']))?$settings['templates']['abandoned']['subject']:'' }}">
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Body') }}</label>
				<div class="col-sm-6">
					<!-- <textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="templates[abandoned][body]" value="{{ (isset($templates['abandoned']['body']))?$templates['abandoned']['body']:'' }}"></textarea> -->
					<textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="settings[templates][abandoned][body]">{{ (isset($settings['templates']['abandoned']['body']))?$settings['templates']['abandoned']['body']:'' }}</textarea>
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Available parameters') }}</label>
				<div class="col-sm-6">
					%event% %date_time% %queue_name% %queue_number% %callerid% %wait_time% %did%
				</div>
            </div>

			<br>
			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important"></label>
				<div class="col-sm-6"><b>{{ __('Failover event template') }}</b></div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Subject') }}</label>
				<div class="col-sm-6">
					<!-- <input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="templates[failover][subject]" value="{{ (isset($templates['failover']['subject']))?$templates['failover']['subject']:'' }}"> -->
					<input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="settings[templates][failover][subject]" value="{{ (isset($settings['templates']['failover']['subject']))?$settings['templates']['failover']['subject']:'' }}">
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Body') }}</label>
				<div class="col-sm-6">
					<!-- <textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="templates[failover][body]" value="{{ (isset($templates['failover']['body']))?$templates['failover']['body']:'' }}"></textarea> -->
					<textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="settings[templates][failover][body]">{{ (isset($settings['templates']['failover']['body']))?$settings['templates']['failover']['body']:'' }}</textarea>
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Available parameters') }}</label>
				<div class="col-sm-6">
					%event% %date_time% %queue_name% %queue_number% %callerid% %wait_time% %failover_destination%
				</div>
            </div>

			<br>
			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important"></label>
				<div class="col-sm-6"><b>{{ __('Responder sms event template') }}</b></div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Subject') }}</label>
				<div class="col-sm-6">
					<!-- <input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="templates[responder][subject]" value="{{ (isset($templates['responder']['subject']))?$templates['responder']['subject']:'' }}"> -->
					<input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="settings[templates][responder][subject]" value="{{ (isset($settings['templates']['responder']['subject']))?$settings['templates']['responder']['subject']:'' }}">
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Body') }}</label>
				<div class="col-sm-6">
					<!-- <textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="templates[responder][body]" value="{{ (isset($templates['responder']['body']))?$templates['responder']['body']:'' }}"></textarea> -->
					<textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="settings[templates][responder][body]">{{ (isset($settings['templates']['responder']['body']))?$settings['templates']['responder']['body']:'' }}</textarea>
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Available parameters') }}</label>
				<div class="col-sm-6">
					%event% %date_time% %callerid% %senderid% %template%
				</div>
            </div>

			<br>
			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important"></label>
				<div class="col-sm-6"><b>{{ __('Abandoned IVR event template') }}</b></div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Subject') }}</label>
				<div class="col-sm-6">
					<input type="text" class="form-control input-sized-lg" placeholder="{{ __('Subject') }}" name="settings[templates][abandonedivr][subject]" value="{{ (isset($settings['templates']['abandonedivr']['subject']))?$settings['templates']['abandonedivr']['subject']:'' }}">
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Body') }}</label>
				<div class="col-sm-6">
					<textarea class="form-control input-sized-lg" rows=4 placeholder="{{ __('Body') }}" name="settings[templates][abandonedivr][body]">{{ (isset($settings['templates']['abandonedivr']['body']))?$settings['templates']['abandonedivr']['body']:'' }}</textarea>
				</div>
            </div>

			<div class="form-group">
				<label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Available parameters') }}</label>
				<div class="col-sm-6">
					%event% %date_time% %ivr% %callerid% %wait_time% %did%
				</div>
            </div>

            <div class="form-group margin-top">
                <div class="col-sm-6 col-sm-offset-2">
                    <button type="submit" class="btn btn-primary">
                        {{ __('Save') }}
                    </button>
                </div>
            </div>
        </form>
    </div>
@endsection