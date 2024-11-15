@extends('layouts.app')

@section('title_full', __('Whapi').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('Whapi') }}
    </div>

    <div class="col-xs-12">
  
        @include('partials/flash_messages')

		<form class="form-horizontal margin-bottom" method="POST" action="" autocomplete="off">
            {{ csrf_field() }}

            <div class="form-group{{ $errors->has('auto_reply_enabled') ? ' has-error' : '' }}">
                <label for="settings_enabled" class="col-sm-2 control-label">{{ __('Enabled') }}</label>

                <div class="col-sm-6">
                    <div class="controls">
                        <div class="onoffswitch-wrap">
                            <div class="onoffswitch">
                                <input type="checkbox" name="settings[enabled]" value="1" id="settings_enabled" class="onoffswitch-checkbox" @if (!empty($settings['enabled']))checked="checked"@endif >
                                <label class="onoffswitch-label" for="settings_enabled"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

			<div class="form-group{{ $errors->has('initiate_enabled') ? ' has-error' : '' }}">
                <label for="settings_initiate_enabled" class="col-sm-2 control-label">{{ __('Initiate Conversation Enabled') }}</label>

                <div class="col-sm-6">
                    <div class="controls">
                        <div class="onoffswitch-wrap">
                            <div class="onoffswitch">
                                <input type="checkbox" name="settings[initiate_enabled]" value="1" id="settings_initiate_enabled" class="onoffswitch-checkbox" @if (!empty($settings['initiate_enabled']))checked="checked"@endif >
                                <label class="onoffswitch-label" for="settings_initiate_enabled"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Channel ID') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[instance]" value="{{ $settings['instance'] ?? '' }}" >
                </div>
            </div> -->

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Webhook URL') }}</label>

                <div class="col-sm-6">
                    <label class="control-label text-help">
                        <small>{{ \Whapi::getWebhookUrl($mailbox->id) }}</small>
                    </label>
                </div>
            </div>
			<div id="whapi_token_sample" class="whapi_token">
				<div class="form-group">
					<label class="col-sm-2 control-label">{{ __('Token') }}</label>
					<div class="col-sm-6">
						<input class="form-control input-sized-lg input_token" name="settings[token]" value="{{ $settings['token'] ?? '' }}"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">{{ __('Channel Name') }}</label>
					<div class="col-sm-6">
						<input class="form-control input-sized-lg input_channel_name" name="settings[channel_name]" value="{{ $settings['channel_name'] ?? '' }}"/>
					</div>
				</div>
				<button class="btn btn-primary whapi_token_remove" style="display:none;">
					{{ __('Remove account') }}
				</button>
				<hr/>
			</div>
			
			@if (!empty($settings['tokens']))
				@foreach ($settings['tokens'] as $tk=>$token)
					<div class="whapi_token">
						<div class="form-group">
							<label class="col-sm-2 control-label">{{ __('Token') }}</label>
							<div class="col-sm-6">
								<input class="form-control input-sized-lg input_token" name="settings[tokens][]" value="{{ $token ?? '' }}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">{{ __('Channel Name') }}</label>
							<div class="col-sm-6">
								<input class="form-control input-sized-lg input_channel_name" name="settings[channels_names][]" value="{{ $settings['channels_names'][$tk] ?? '' }}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">{{ __('Webhook URL') }}</label>
							<div class="col-sm-6">
								<label class="control-label text-help">
									<small>{{ \Whapi::getWebhookUrl($mailbox->id,$token) }}</small>
								</label>
							</div>
						</div>
						<button class="btn btn-primary whapi_token_remove">
							{{ __('Remove account') }}
						</button>
						<hr/>
					</div>
				@endforeach
			@endif

			<div id="whapi_token_samples"></div>
			<div class="form-group margin-top">
                <div class="col-sm-6 col-sm-offset-2">
                    <button id="whapi_token_add" class="btn btn-primary">
                        {{ __('Add account') }}
                    </button>
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