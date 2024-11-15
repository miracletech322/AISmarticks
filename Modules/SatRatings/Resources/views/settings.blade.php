@extends('layouts.app')

@section('title_full', __('Satisfaction Ratings').' - '.$mailbox->name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('mailboxes/sidebar_menu')
@endsection

@section('content')

    <div class="section-heading-noborder">
        {{ __('Satisfaction Ratings') }}
    </div>

    @include('satratings::partials/tabs')

 	<div class="row-container">
        <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal margin-top" method="POST" action="">
                    {{ csrf_field() }}

                    <div class="form-group{{ $errors->has('ratings') ? ' has-error' : '' }}">
                        <label for="ratings" class="col-sm-2 control-label">{{ __('Enable Ratings') }}</label>

                        <div class="col-sm-6">
                            <div class="controls">
                                <div class="onoffswitch-wrap">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="ratings" value="1" id="ratings" class="onoffswitch-checkbox" @if (old('ratings', $mailbox->ratings))checked="checked"@endif >
                                        <label class="onoffswitch-label" for="ratings"></label>
                                    </div>
                                </div>
                            </div>
                            @include('partials/field_error', ['field'=>'ratings'])
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">{{ __('Add Ratings') }}</label>

                        <div class="col-sm-6">
                            <div class="control-group">
                                <label class="radio" for="ratings_add_{{ SatRatingsHelper::ADD_ALWAYS }}">
                                    <input type="radio" name="settings[add]" value="{{ SatRatingsHelper::ADD_ALWAYS }}" id="ratings_add_{{ SatRatingsHelper::ADD_ALWAYS }}" @if ($settings['add'] == SatRatingsHelper::ADD_ALWAYS) checked="checked" @endif> {!! __("Add to all emails sent to customers.") !!}
                                </label>
                                <label class="radio" for="ratings_add_{{ SatRatingsHelper::ADD_VIA_SHORTCODE }}">
                                    <input type="radio" name="settings[add]" value="{{ SatRatingsHelper::ADD_VIA_SHORTCODE }}" id="ratings_add_{{ SatRatingsHelper::ADD_VIA_SHORTCODE }}" @if ($settings['add'] == SatRatingsHelper::ADD_VIA_SHORTCODE) checked="checked" @endif> {!! __("Add only to emails containing the following shortcode (the shortcode itself is not visible to the recipient): :shortcode", ['shortcode' => '<code>'.SatRatingsHelper::SHORTCODE.'</code>']) !!}
                            </div>
                        </div>
                    </div>

					<div class="form-group">
                        <label for="ratings_placement" class="col-sm-2 control-label">{{ __('Placement') }}</label>

                        <div class="col-sm-6">
                            <div class="control-group">
                                <label class="radio" for="ratings_placement_{{ SatRatingsHelper::PLACEMENT_ABOVE }}">
                                    <input type="radio" name="ratings_placement" value="{{ SatRatingsHelper::PLACEMENT_ABOVE }}" id="ratings_placement_{{ SatRatingsHelper::PLACEMENT_ABOVE }}" @if ($mailbox->ratings_placement == SatRatingsHelper::PLACEMENT_ABOVE) checked="checked" @endif> {!! __("Place ratings text :%tag_begin%above:%tag_end% mailbox signature.", ['%tag_begin%' => '<strong>', '%tag_end%' => '</strong>']) !!}
                                </label>
                                <label class="radio" for="ratings_placement_{{ SatRatingsHelper::PLACEMENT_BELOW }}">
                                    <input type="radio" name="ratings_placement" value="{{ SatRatingsHelper::PLACEMENT_BELOW }}" id="ratings_placement_{{ SatRatingsHelper::PLACEMENT_BELOW }}" @if ($mailbox->ratings_placement == SatRatingsHelper::PLACEMENT_BELOW) checked="checked" @endif> {!! __("Place ratings text :%tag_begin%below:%tag_end% mailbox signature.", ['%tag_begin%' => '<strong>', '%tag_end%' => '</strong>']) !!}
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group margin-bottom-5">
                        <label for="ratings_text" class="col-sm-2 control-label">{{ __('Ratings Text') }}</label>

                        <div class="col-sm-9">
                            <textarea id="ratings_text" class="form-control" name="ratings_text" rows="8">{{ old('ratings_text', ($mailbox->ratings_text ?? SatRatingsHelper::DEFAULT_TEXT)) }}</textarea>
                            <textarea id="default_ratings_text" class="hidden">{{ SatRatingsHelper::DEFAULT_TEXT }}</textarea>
                            <div class="{{ $errors->has('ratings_text') ? ' has-error' : '' }}">
                                @include('partials/field_error', ['field'=>'ratings_text'])
                            </div>
                            <a href="#" class="reset-trigger">{{ __('Reset to defaults') }}</a>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">{{ __('Saving Mode') }}</label>

                        <div class="col-sm-6">
                            <div class="control-group">
                                <label class="radio" for="ratings_saving_mode_{{ SatRatingsHelper::SAVING_MODE_INSTANT }}">
                                    <input type="radio" name="settings[saving_mode]" value="{{ SatRatingsHelper::SAVING_MODE_INSTANT }}" id="ratings_saving_mode_{{ SatRatingsHelper::SAVING_MODE_INSTANT }}" @if ($settings['saving_mode'] == SatRatingsHelper::SAVING_MODE_INSTANT) checked="checked" @endif> {!! __("Save rating immediately after one of the rating links is clicked in the email") !!}
                                </label>
                                <label class="radio" for="ratings_saving_mode_{{ SatRatingsHelper::SAVING_MODE_ON_SUBMIT }}">
                                    <input type="radio" name="settings[saving_mode]" value="{{ SatRatingsHelper::SAVING_MODE_ON_SUBMIT }}" id="ratings_saving_mode_{{ SatRatingsHelper::SAVING_MODE_ON_SUBMIT }}" @if ($settings['saving_mode'] == SatRatingsHelper::SAVING_MODE_ON_SUBMIT) checked="checked" @endif> {!! __("Save rating after Send button is clicked on the rating page") !!}
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-6 col-sm-offset-2">
                            <button type="submit" class="btn btn-primary">
                                {{ __('Save') }}
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
  
@endsection

@include('partials/editor')

@section('javascript')
    @parent
    initSatRatingsSettings('{{ __('Reset to default values?') }}');
@endsection