@extends('layouts.app')

@section('title_full', __('VoipeWhatsapp').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('VoipeWhatsapp') }}
    </div>

    <div class="col-xs-12">
  
        @include('partials/flash_messages')

        <form class="form-horizontal margin-bottom" method="POST" action="" autocomplete="off">
            {{ csrf_field() }}

            <!-- <div class="form-group{{ $errors->has('auto_reply_enabled') ? ' has-error' : '' }}">
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
            </div> -->

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Whatsapp Webhook url') }}</label>

                <div class="col-sm-6">
                    {{ $webhookurl ?? '' }}
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Whatsapp Phone number') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[phone]" value="{{ $settings['phone'] ?? '' }}" required>
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Whatsapp Token') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[token]" value="{{ $settings['token'] ?? '' }}" required>
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Whatsapp Api URL') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[url]" value="{{ $settings['url'] ?? '' }}" required>
                </div>
            </div>

            <!-- <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Auto Reply') }}</label>

                <div class="col-sm-6">
                    <textarea class="form-control input-sized-lg" rows="3" name="settings[auto_reply]">{{ $settings['auto_reply'] ?? '' }}</textarea>
                    <div class="form-help">
                        {{ __('Auto reply sent in response to the /start command.') }}
                    </div>
                </div>
            </div> -->

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