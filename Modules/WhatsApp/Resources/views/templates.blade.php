@extends('layouts.app')

@section('title_full', __('WhatsApp Templates').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('WhatsApp Templates') }}
    </div>

    @if ($needSettings)
        <div class="col-xs-12">
            <div class="alert alert-danger">
                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                {{ __('Need to configure WhatsApp') }}
            </div>
            <a href="{{ route('mailboxes.whatsapp.settings', ['mailbox_id' => $mailbox->id]) }}">{{ __('Customize WhatsApp') }}</a>
        </div>
    @else

        <div class="col-xs-12">
            <div class="row" style="margin-bottom: 10px">
                <div class="col-lg-12">
                    <a href="#" data-trigger="modal" data-modal-title="{{ __('Add Template') }}" data-modal-size="lg" data-modal-no-footer="true" data-modal-body='<iframe src="{{ route('whatsapp.create_template', ['x_embed' => 1, 'mailbox' => $mailbox->id]) }}" frameborder="0" class="modal-iframe"></iframe>' class="btn btn-primary" style="position:relative;top:-1px;margin-left:4px;">{{ __('Add') }}</a>
                </div>
            </div>
            @include('partials/all_templates_table', ['mailbox' => $mailbox->id])
        </div>
    @endif
@endsection

@section('javascript')
    @parent
    whatsappTemplates();
@endsection