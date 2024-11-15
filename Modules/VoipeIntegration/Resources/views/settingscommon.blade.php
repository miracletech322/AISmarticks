@extends('layouts.app')

@section('title_full', __('Voipe Settings').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('Voipe Settings') }}
    </div>

    <div class="col-xs-12">
  
        @include('partials/flash_messages')

        <form class="form-horizontal margin-bottom" method="POST" action="" autocomplete="off">
            {{ csrf_field() }}

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Join conversations') }}</label>
				<div class="col-sm-6">
					<div>
						<input type="checkbox" name="settings[joinconversations]" {{ (isset($settings['joinconversations']))?'checked':'' }}>
						<label for="voipe_module_e4">{{ __('Join whatsapp / sms / responder conversations') }}</label>
					</div>
				</div>
            </div>

			<div class="form-group">
                <label class="col-sm-2 control-label" style="padding-top:0!important">{{ __('Reopen conversations') }}</label>
				<div class="col-sm-6">
					<div>
						<label>
							<input type="checkbox" name="settings[reopenconversations]" {{ (isset($settings['reopenconversations']))?'checked':'' }}>
							{{ __('Reopen whatsapp / sms / responder / facebook conversations') }}
						</label>
					</div>
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