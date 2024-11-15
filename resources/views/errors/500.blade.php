@extends('errors::layout')

@section('title', 'Error')

@section('message')
    {{ __('Whoops, looks like something went wrong — check logs in /storage/logs') }}
@endsection