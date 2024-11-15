@extends('layouts.app')

@section('title_full', __('Edit User').' - '.$user->getFullName())

@section('body_attrs')@parent data-user_id="{{ $user->id }}"@endsection

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('users/sidebar_menu')
@endsection

@section('content')
    <div class="section-heading">
        {{ __('Advanced profile') }}
    </div>

    <div class="container form-container">
        <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal margin-top" method="POST" action="" enctype="multipart/form-data">
                    {{ csrf_field() }}

                    <div class="form-group{{ $errors->has('locale') ? ' has-error' : '' }}">
                        <label for="locale" class="col-sm-2 control-label">{{ __('Language') }}</label>

                        <div class="col-sm-6">
                            <select id="locale" class="form-control input-sized" name="locale">
                                @include('partials/custom_locale_options', ['selected' => old('locale', $user->getLocale())])
                            </select>

                            @include('partials/field_error', ['field'=>'locale'])
                        </div>
                    </div>

                    <div class="form-group{{ $errors->has('open_on_this_page') ? ' has-error' : '' }}">
                        <label for="open_on_this_page" class="col-sm-2 control-label">{{ __('Opening links') }}</label>

                        <div class="col-sm-6">
                            <div class="control-group">
                                <label class="checkbox" for="open_on_this_page">
                                    <input type="checkbox" name="open_on_this_page" id="open_on_this_page" @if ($user->open_on_this_page == 1) checked="checked" @endif> {{ __('On this page') }}
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-6 col-sm-offset-2">
                            <button type="submit" class="btn btn-primary">
                                {{ __('Save advanced profile') }}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection