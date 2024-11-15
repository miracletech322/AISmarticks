@extends('layouts.app')

@section('title', __('Add Customer'))

@section('content')
    @include('partials/edit_template_form')
@endsection

@section('javascript')
    @parent
    createWhatsappTemplates();
@endsection