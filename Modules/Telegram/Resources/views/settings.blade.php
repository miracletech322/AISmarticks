<form class="form-horizontal margin-top margin-bottom" method="POST" action="" id="telegram_form">
    {{ csrf_field() }}

    {{--<div class="descr-block">
        <p>{{ __("These settings are used to send system emails (alerts to admin and invitation emails to users).") }}</p>
    </div>--}}

    <div class="form-group{{ $errors->has('settings.telegram.bot_token') ? ' has-error' : '' }} margin-bottom-10">
        <label for="telegram.bot_token" class="col-sm-2 control-label">{{ __('Bot API Token') }}</label>

        <div class="col-sm-6">
            <input id="telegram.bot_token" type="text" class="form-control input-sized-lg" name="settings[telegram.bot_token]" value="{{ old('settings.telegram.bot_token', $settings['telegram.bot_token']) }}">
            <div class="text-help small">{!! __("Talk to :bot in Telegram, create a bot and get it's API Access Token.", ['bot' => '<a href="https://telegram.me/botfather" target="_blank">@BotFather</a>']) !!}</a></div>
            @if ($token_error)
                <div class="alert alert-danger alert-narrow margin-bottom-0 margin-top-10">
                    <strong>{{ __('Invalid Bot API Token') }}</strong>: {{ $token_error }}
                </div>
            @endif
            @include('partials/field_error', ['field'=>'settings.telegram.bot_token'])
        </div>
    </div>

    <div class="form-group">
        <label for="" class="col-sm-2 control-label">{{ __('Events') }}</label>

        <div class="col-sm-6">
            @foreach ($events as $event_code => $event_title)
                <div class="control-group">
                    <label class="checkbox" for="event_{{ $event_code }}">
                        <input type="checkbox" name="settings[telegram.events][]" value="{{ $event_code }}" id="event_{{ $event_code }}" @if (in_array($event_code, old('settings[telegram.events]', $settings['telegram.events']))) checked="checked" @endif @if (!$active) disabled @endif> {{ $event_title }}
                    </label>
                </div>
            @endforeach
        </div>
    </div>

    <div class="form-group">
        <label for="" class="col-sm-2 control-label">{{ __('Chats Mapping') }}</label>

        <div class="col-sm-6">
            @if ($channels_error)
                <div class="alert alert-warning alert-narrow margin-top-10">
                    {{ __('Could not retrieve the latest list of chats from Telegram. If you have a webhook set up for the current Telegram Bot try to disable it in order to retrive fresh chats list.') }}
                </div>
            @endif
            @if ($channels_mapping)
                <div class="text-help margin-bottom">
                    {{ __('To add a chat to the mapping, just send a message to a channel, group or chat where your bot is present and refresh this page.') }}
                </div>
                @if (count($channels_mapping))
                    <div class="row margin-bottom-10" style="margin-top: 4px;">
                        <div class="col-xs-4">
                            <strong>{{ __('Mailbox') }}</strong>
                        </div>
                        <div class="col-xs-8">
                            <strong>{{ __('Chat') }}</strong>
                        </div>
                    </div>
                @endif
                @foreach ($channels_mapping as $mailbox_id => $mapping)
                    <div class="row margin-bottom-10">
                        <div class="col-xs-4">
                            {{ $mapping['mailbox']->name }}
                        </div>
                        <div class="col-xs-8">
                            <select class="form-control input-sized" name="settings[telegram.channels_mapping][{{ $mailbox_id }}]" @if (!$active) disabled @endif>
                                <option value=""></option>
                                @foreach ($channels as $channel_id => $channel_title)
                                    <option value="{{ $channel_id }}" @if (old('settings.telegram.channels_mapping.'.$mailbox_id, $settings['telegram.channels_mapping'][$mailbox_id] ?? '') == $channel_id)selected="selected"@endif>{{ $channel_title }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                @endforeach
            @else
                <div class="alert alert-info alert-striped alert-narrow">
                    {{ __('There are no mailboxes yet.') }} <a href="{{ route('mailboxes.create') }}">{{ __("Create Mailbox") }}</a>
                </div>
            @endif
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