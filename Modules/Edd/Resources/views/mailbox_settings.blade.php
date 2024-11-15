@extends('layouts.app')

@section('title_full', 'EDD'.' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading">
        Easy Digital Downloads
    </div>

    @include('partials/flash_messages')
    
 	<div class="row-container">
        <div class="row">
            <div class="col-xs-12">
                @include('edd::settings')
            </div>
        </div>
    </div>
  
@endsection