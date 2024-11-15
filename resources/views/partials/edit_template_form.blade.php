@if (session('flash_success_create_template'))
    <div class="alert alert-success">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        {!! session('flash_success_create_template') !!}
    </div>
@endif

@if (session('flash_error_create_template'))
    <div class="alert alert-danger">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        {{ session('flash_error_create_template') }}
    </div>
@endif

@php
    if (empty($template)) {
        $template = [];
    }

@endphp

<div class="container form-container">
    <div class="row">
        <div class="col-xs-12">
            <form class="form-horizontal margin-top" method="POST" action="{{ route('whatsapp.create_template.save') }}" enctype="multipart/form-data">
                {{ csrf_field() }}

                <input type="hidden" name="mailbox" value="{{ $mailbox }}">

                <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
                    <label for="name" class="col-sm-2 control-label">{{ __('Template Name') }}</label>

                    <div class="col-sm-6">
                        <input id="name" type="text" class="form-control input-sized-lg" name="name"  value="{{ old('name', '') }}">

                        @include('partials/field_error', ['field'=>'name'])
                    </div>
                </div>

                <div class="form-group{{ $errors->has('category') ? ' has-error' : '' }} margin-bottom-0">
                    <label for="category" class="col-sm-2 control-label">{{ __('Category') }}</label>

                    <div class="col-sm-6">
                        <div class="multi-container">
                            <div class="multi-item">
                                <div>
                                    <div class="input-group input-group-flex input-sized-lg">
                                        <select class="form-control" name="category">
                                            @foreach($templateTree['category'] as $key => $category)
                                                <option value="{{$category}}" @if($category == old('category')) selected @endif>{{ $category }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        @include('partials/field_error', ['field'=>'category'])
                    </div>
                </div>

                <div class="form-group{{ $errors->has('language') ? ' has-error' : '' }} margin-bottom-0">
                    <label for="language" class="col-sm-2 control-label">{{ __('Language') }}</label>

                    <div class="col-sm-6">
                        <div class="multi-container">
                            <div class="multi-item">
                                <div>
                                    <div class="input-group input-group-flex input-sized-lg">
                                        <select class="form-control" name="language" id="language">
                                            @foreach($templateTree['language'] as $key => $language)
                                                <option value="{{$key}}" @if($key == old('language')) selected @endif>{{ $language }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        @include('partials/field_error', ['field'=>'language'])
                    </div>
                </div>

                <h1>Components</h1>

                <div class="template_components">
                    <div class="component_types">
                        <button type="button" class="btn btn-primary active" data-component-type="1">{{ __('BODY') }}</button>
                        <button type="button" class="btn btn-primary" data-component-type="2">{{ __('HEADER') }}</button>
                        <button type="button" class="btn btn-primary" data-component-type="3">{{ __('FOOTER') }}</button>
                        <button type="button" class="btn btn-primary" data-component-type="4">{{ __('BUTTONS') }}</button>
                    </div>
                    <div class="component component_body active" data-component-type-block="1">
                        <div class="form-group{{ $errors->has('components.body.text.') ? ' has-error' : '' }}">
                            <label for="components_body-text" class="col-sm-2 control-label">{{ __('Text') }}</label>

                            <div class="col-sm-6">
                                <input id="components_body-text" type="text" class="form-control input-sized-lg" name="components[body][text]" value="{{ old('components.body.text', '') }}">

                                @include('partials/field_error', ['field'=>'components.body.text'])
                            </div>
                        </div>
                    </div>
                    <div class="component component_header" data-component-type-block="2">
                        <div class="form-group{{ $errors->has('components.header.format') ? ' has-error' : '' }} margin-bottom-0">
                            <label for="components_format" class="col-sm-2 control-label">{{ __('Format') }}</label>

                            <div class="col-sm-6">
                                <div class="multi-container">
                                    <div class="multi-item">
                                        <div>
                                            <div class="input-group input-group-flex input-sized-lg">
                                                <select class="form-control" name="components[header][format]" id="components_format">
                                                    @foreach($templateTree['components']['format'] as $key => $format)
                                                        <option value="{{$format}}"  @if($format == old('components.header.format')) selected @endif>{{ $format }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                @include('partials/field_error', ['field'=>'components.header.format'])
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('components.header.text') ? ' has-error' : '' }} components_header_text @if(old('components.header.format') == 'TEXT' || empty(old('components.header.format'))) active @endif">
                            <label for="components_header-text" class="col-sm-2 control-label">{{ __('Text') }}</label>

                            <div class="col-sm-6">
                                <input id="components_header-text" type="text" class="form-control input-sized-lg " name="components[header][text]"  value="{{ old('components.header.text', '') }}">

                                @include('partials/field_error', ['field'=>'components.header.text'])
                            </div>
                        </div>

                        <div class="form-group{{ $errors->has('components.files') ? ' has-error' : '' }} margin-bottom-0 components_header_files @if(old('components.header.format') != 'TEXT' && !empty(old('components.header.format'))) active @endif">
                            <label for="photo_url" class="col-sm-2 control-label">{{ __('Select') }}</label>

                            <div class="col-sm-6">
                                <input type="file" name="components[files][]" multiple>

                                @include('partials/field_error', ['field'=>'components.files'])
                            </div>
                        </div>
                    </div>

                    <div class="component component_footer" data-component-type-block="3">
                        <div class="form-group{{ $errors->has('components.footer.text') ? ' has-error' : '' }}">
                            <label for="components_footer-text" class="col-sm-2 control-label">{{ __('Text') }}</label>

                            <div class="col-sm-6">
                                <input id="components_footer-text" type="text" class="form-control input-sized-lg" name="components[footer][text]"  value="{{ old('components.footer.text', '') }}">

                                @include('partials/field_error', ['field'=>'components.footer.text'])
                            </div>
                        </div>
                    </div>

                    <div class="component component_buttons" data-component-type-block="4">
                        <div class="form-group{{ $errors->has('components.buttons.text') ? ' has-error' : '' }}">
                            <label for="components_buttons-text" class="col-sm-2 control-label">{{ __('Text') }}</label>

                            <div class="col-sm-6">
                                <input id="components_buttons-text" type="text" class="form-control input-sized-lg" name="components[buttons][text]"  value="{{ old('components.buttons.text', '') }}">

                                @include('partials/field_error', ['field'=>'components.buttons.text'])
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-6" style="margin-top: 15px;">
                        <button type="submit" class="btn btn-primary">{{ __('Create Template') }}</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<style>
    .component_types {
        margin-bottom: 20px;
    }

    .component_body,
    .component_header,
    .component_header,
    .component_footer,
    .component_buttons {
        display: none;
        padding: 15px 10px;
        border: 1px dashed lightgrey;
    }

    .component_body.active,
    .component_header.active,
    .component_header.active,
    .component_footer.active,
    .component_buttons.active {
        display: block;
    }

    .components_header_text.active,
    .components_header_files.active {
        display: block;
    }
    .components_header_text:not(.active),
    .components_header_files:not(.active) {
        display: none;
    }

    .template_components .component_types .btn.btn-primary {
        margin-top: 4px;
    }
</style>