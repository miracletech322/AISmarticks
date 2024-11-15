@extends('layouts.app')

@section('title_full', __('VoipeSmsTickets').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('VoipeSmsTickets') }}
    </div>

    <div class="col-xs-12">
  
        @include('partials/flash_messages')

        <form class="form-horizontal margin-bottom" method="POST" action="" autocomplete="off">
            {{ csrf_field() }}

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Organisation') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[organisation]" value="{{ $settings['organisation'] ?? '' }}" required>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('SMS Token') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[token]" value="{{ $settings['token'] ?? '' }}" required>
                </div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label">{{ __('SMS Sender') }}</label>

                <div class="col-sm-6">
                    <input type="text" class="form-control input-sized-lg" name="settings[sender]" value="{{ $settings['sender'] ?? '' }}" required>
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