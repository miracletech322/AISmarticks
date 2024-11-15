@extends('layouts.app')

@section('title_full', __('Whapi'))

@section('content')

    <div class="section-heading margin-bottom">
        {{ __('Whapi') }}
    </div>

    <div class="col-xs-12">
		{{ json_encode($data) }}
	</div>

@endsection