<form class="form-horizontal margin-top margin-bottom" method="POST" action="">
    {{ csrf_field() }}

    <div class="form-group">
        <label class="col-sm-2 control-label"></label>

        <div class="col-sm-6">
            <label class="control-label">
                <a href="https://freescout.net/module/sms-notifications/" target="_blank">{{ __('Instruction') }} <small class="glyphicon glyphicon-share"></small></a>
            </label>
            <p class="form-help">
                {!! __('API errors can be found in :%a_begin%Manage » Logs » SMS Notifications Errors:%a_end%.', ['%a_begin%' => '<a href="'.route('logs', ['name' => \SmsNotifications::LOG_NAME]).'" target="_blank">', '%a_end%' => '</a>']) !!}
            </p>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-6 col-sm-offset-2">
            <label for="smsnotifications_system_{{ \SmsNotifications::SYSTEM_TWILIO }}" class="radio inline plain">
                <input type="radio" name="settings[smsnotifications.system]" value="{{ \SmsNotifications::SYSTEM_TWILIO }}" id="smsnotifications_system_{{ \SmsNotifications::SYSTEM_TWILIO }}" @if ($settings['smsnotifications.system'] == \SmsNotifications::SYSTEM_TWILIO ) checked @endif> <strong>Twilio</strong>
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('Account SID') }}</label>

        <div class="col-sm-6">
            <input type="text" class="form-control input-sized-lg" name="settings[smsnotifications.twilio_sid]" value="{{ $settings['smsnotifications.twilio_sid'] ?? '' }}" >
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('Auth Token') }}</label>

        <div class="col-sm-6">
            <input type="text" class="form-control input-sized-lg" name="settings[smsnotifications.twilio_token]" value="{{ $settings['smsnotifications.twilio_token'] ?? '' }}" >
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('Twilio Phone Number') }}</label>

        <div class="col-sm-6">
            <input type="text" class="form-control input-sized-lg" name="settings[smsnotifications.twilio_phone_number]" value="{{ $settings['smsnotifications.twilio_phone_number'] ?? '' }}" >
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-6 col-sm-offset-2">
            <label for="smsnotifications_system_{{ \SmsNotifications::SYSTEM_MESSAGEBIRD }}" class="radio inline plain">
                <input type="radio" name="settings[smsnotifications.system]" value="{{ \SmsNotifications::SYSTEM_MESSAGEBIRD }}" id="smsnotifications_system_{{ \SmsNotifications::SYSTEM_MESSAGEBIRD }}" @if ($settings['smsnotifications.system'] == \SmsNotifications::SYSTEM_MESSAGEBIRD ) checked @endif> <strong>MessageBird</strong>
            </label>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('API Key') }}</label>

        <div class="col-sm-6">
            <input type="text" name="settings[smsnotifications.api_key]" value="{{ $settings['smsnotifications.api_key'] }}" class="form-control input-sized-lg" required="required" />
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('Sender Phone Number') }}</label>

        <div class="col-sm-6">
            <input type="text" name="settings[smsnotifications.phone_number]" value="{{ $settings['smsnotifications.phone_number'] }}" class="form-control input-sized-lg" />
            <p class="form-help">
                {!! __('Leave this field empty to send SMS from a random shared phone number, or get a phone number :%a_begin%here:%a_end%.', ['%a_begin%' => '<a href="https://dashboard.messagebird.com/en/numbers" target="_blank">', '%a_end%' => '</a>']) !!}
            </p>
        </div>
    </div>

    <div class="form-group margin-top margin-bottom">
        <div class="col-sm-6 col-sm-offset-2">
            <button type="submit" class="btn btn-primary">
                {{ __('Save') }}
            </button>
        </div>
    </div>
</form>
