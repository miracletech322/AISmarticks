@extends('layouts.app')

@section('title_full', __('Mail Signing').' - '.$mailbox->name)

@section('body_attrs')@parent data-mailbox_id="{{ $mailbox->id }}"@endsection

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('Mail Signing & Encryption') }}
    </div>

    <div class="col-xs-12">

        @include('partials/flash_messages')

        <form class="form-horizontal margin-bottom" method="POST" action="" autocomplete="off" enctype="multipart/form-data">
            {{ csrf_field() }}

            <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Protocol') }}</label>

                <div class="col-sm-6">
                    <div class="controls">
                        <label class="radio-inline">
                            <input type="radio" name="settings[protocol]" value="{{ \MailSigning::PROTOCOL_SMIME }}" @if ($settings['protocol'] == \MailSigning::PROTOCOL_SMIME) checked @endif /> S/MIME
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="settings[protocol]" value="{{ \MailSigning::PROTOCOL_PGP }}" @if ($settings['protocol'] == \MailSigning::PROTOCOL_PGP) checked @endif /> PGP
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">{{ __('Mode') }}</label>

                <div class="col-sm-6">
                    <div class="controls">
                        <label class="radio-inline">
                            <input type="radio" name="settings[mode]" value="{{ \MailSigning::MODE_SIGN }}" @if ($settings['mode'] == \MailSigning::MODE_SIGN) checked @endif /> {{ __('Sign Only') }}
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="settings[mode]" value="{{ \MailSigning::MODE_SIGN_ENCRYPT }}" @if ($settings['mode'] == \MailSigning::MODE_SIGN_ENCRYPT) checked @endif /> {{ __('Sign & Encrypt') }}
                        </label>
                        {{--<label class="radio-inline">
                            <input type="radio" name="settings[mode]" value="{{ \MailSigning::PROTOCOL_PGP }}" @if ($settings['protocol'] == \MailSigning::PROTOCOL_PGP) checked @endif> {{ __('Encrypt Only') }}</option>
                        </label>--}}
                    </div>
                </div>
            </div>

            <div class="form-group ms-protocol ms-protocol-{{ \MailSigning::PROTOCOL_PGP }} @if ($settings['protocol'] != \MailSigning::PROTOCOL_PGP) hidden @endif">
                <hr/>

                <div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Path to GPG Keys Folder') }}</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            <input type="text" name="settings[pgp_path]" value="{{ $settings['pgp_path'] }}" class="form-control input-sized" placeholder="/home/user/.gnupg">
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Key Email Address') }}</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            <input type="text" name="settings[pgp_email]" value="{{ $settings['pgp_email'] }}" class="form-control input-sized">
                        </div>
                    </div>
                </div>

                {{-- PGP signing does not work with passpharase: get_key failed --}}
                {{--<div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Key Passphrase') }}</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            <input type="text" name="settings[pgp_pass]" value="{{ $settings['pgp_pass'] }}" class="form-control input-sized" placeholder="{{ __('(optional)') }}">
                        </div>
                    </div>
                </div>--}}
            </div>

            <div class="ms-protocol ms-protocol-{{ \MailSigning::PROTOCOL_SMIME }} @if ($settings['protocol'] != \MailSigning::PROTOCOL_SMIME) hidden @endif">
                <h3 class="subheader">{{ __('Signing') }} (@if (\MailSigning::isSigningActive($mailbox))<span class="text-success">{{ 'Active' }}</span>@else<span class="text-help">{{ 'Inactive' }}</span>@endif)</h3>

                <div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Certificate') }} (.pem)</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            
                            @if ($settings['smime_cert'])
                                <label class="control-label">
                                    <span class="text-help"><i class="glyphicon glyphicon-ok text-success"></i> {{ __('Uploaded') }}</span> &nbsp;<button name="delete_file" value="smime_cert" class="btn btn-default btn-xs">{{ __('Delete') }}</button>
                                </label>
                            @else
                                <div class="form-help">
                                    <input type="file" name="settings[smime_cert]" accept=".pem">
                                    @include('partials/field_error', ['field'=>'settings[smime_cert]'])
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Private Key') }} (.pem)</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            @if ($settings['smime_key'])
                                <label class="control-label">
                                    <span class="text-help"><i class="glyphicon glyphicon-ok text-success"></i> {{ __('Uploaded') }}</span> &nbsp;<button name="delete_file" value="smime_key" class="btn btn-default btn-xs">{{ __('Delete') }}</button>
                                </label>
                            @else
                                <div class="form-help">
                                    <input type="file" name="settings[smime_key]" accept=".pem">
                                    @include('partials/field_error', ['field'=>'settings[smime_key]'])
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Private Key Passphrase') }}</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            <input type="password" name="settings[smime_pass]" value="{{ $settings['smime_pass'] }}" class="form-control input-sized" placeholder="{{ __('(optional)') }}" autocomplete="new-password">
                        </div>
                    </div>
                </div>
            </div>

            <div class="ms-mode ms-mode-{{ \MailSigning::MODE_SIGN_ENCRYPT }} @if ($settings['mode'] != \MailSigning::MODE_SIGN_ENCRYPT) hidden @endif">

                <h3 class="subheader">{{ __('Encryption') }} (@if (\MailSigning::isEncriptionActive($mailbox))<span class="text-success">{{ 'Active' }}</span>@else<span class="text-help">{{ 'Inactive' }}</span>@endif)</h3>

                <div class="ms-protocol ms-protocol-{{ \MailSigning::PROTOCOL_SMIME }} @if ($settings['protocol'] != \MailSigning::PROTOCOL_SMIME) hidden @endif">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">{{ __('Certificate') }} (.pem)</label>

                        <div class="col-sm-6">
                            <div class="controls">
                                @if ($settings['smime_encrypt_cert'])
                                    <label class="control-label">
                                        <span class="text-help"><i class="glyphicon glyphicon-ok text-success"></i> {{ __('Uploaded') }}</span> &nbsp;<button name="delete_file" value="smime_encrypt_cert" class="btn btn-default btn-xs">{{ __('Delete') }}</button>
                                    </label>
                                @else
                                    <div class="form-help">
                                        <input type="file" name="settings[smime_encrypt_cert]" accept=".pem">
                                        @include('partials/field_error', ['field'=>'settings[smime_encrypt_cert]'])
                                    </div>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">{{ __('Encrypt') }}</label>

                    <div class="col-sm-6">
                        <div class="controls">
                            <select name="settings[encrypt]" class="form-control input-sized">
                                <option value="customer" @if ($settings['encrypt'] == 'customer') selected @endif> {{ __('Emails to Customers') }}</option>
                                <option value="customer_user" @if ($settings['encrypt'] == 'customer_user') selected @endif> {{ __('Emails to Customers & Users') }}</option>
                            </select>
                        </div>
                    </div>
                </div>

            </div>

            <h3 class="subheader">{{ __('Testing') }}</h3>
            
            <div class="form-group">
                <label for="send_test" class="col-sm-2 control-label">{{ __('Send Test Email') }}</label>

                <div class="col-sm-6">
                    <div class="input-group input-sized">
                        <input id="send_test" type="email" class="form-control" name="settings[test_email]" value="{{ $settings['test_email'] ?? '' }}">
                        <span class="input-group-btn">
                            <button id="send-test-trigger" class="btn btn-default" type="button" data-loading-text="{{ __('Send Test') }}…">{{ __('Send Test') }}</button>
                        </span>
                    </div>
                    <div class="form-help">{!! __("Make sure to save settings before testing.") !!}</div>
                </div>
            </div>

            <hr/>

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

@section('javascript')
    @parent
    mailsigningInit();
@endsection