<div class="form-group">
    <label class="col-sm-2 control-label">{{ __('Name') }}</label>

    <div class="col-sm-10">
        <input class="form-control" name="name" value="{{ $user_field->name }}" maxlength="75" required/>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label">{{ __('Type') }}</label>

    <div class="col-sm-10">
    	<select name="type" class="form-control" @if ($mode != 'create') disabled @endif>
    		@foreach (\UserField::$types as $type_key => $type_name)
    			<option value="{{ $type_key }}" @if ($type_key == $user_field->type) selected @endif>{{ __($type_name) }}</option>
    		@endforeach
    	</select>
    </div>
</div>

<div class="form-group cf-type cf-type-1 @if ($user_field->type != \UserField::TYPE_DROPDOWN) hidden @endif">
    <label class="col-sm-2 control-label">{{ __('Options') }}</label>

    <div class="col-sm-10">
        @if ($mode != 'create')
            @if (empty($user_field->options))
                @php
                    $user_field->options = [1 => ''];
                @endphp
            @endif
            @if (is_array($user_field->options))
                <div class="cf-options">
                    @foreach ($user_field->options as $option_id => $option_title)
                        <div class="input-group cf-option">
                            <span class="input-group-addon cf-option-handle">
                                <i class="glyphicon glyphicon-menu-hamburger"></i>
                            </span>
                            <input type="text" name="options[{{ $option_id }}]" data-option-id="{{ $option_id }}" class="form-control" value="{{ $option_title }}" @if ($user_field->type != \UserField::TYPE_DROPDOWN) disabled @endif">
                            <span class="input-group-btn cf-option-restore">
                                <button class="btn btn-default" type="button"><small>{{ __('Undo') }}</small></button>
                            </span>
                            <span class="input-group-btn cf-option-remove">
                                <button class="btn btn-default" type="button">–</button>
                            </span>
                            <span class="input-group-btn cf-option-add">
                                <button class="btn btn-default" type="button">+</button>
                            </span>
                        </div>
                    @endforeach
                </div>
            @endif
        @else
            <textarea name="options" class="form-control" rows="4" placeholder="{{ __('One option per line') }}" @if ($user_field->type != \UserField::TYPE_DROPDOWN) disabled @endif"></textarea>
        @endif
    </div>
</div>

<div class="form-group cf-type cf-type-2 @if ($user_field->type != \UserField::TYPE_SINGLE_LINE) hidden @endif">
    <label class="col-sm-2 control-label">{{ __('Autosuggest') }}</label>

    <div class="col-sm-10">
        <div class="controls">
            <div class="onoffswitch-wrap">
                <div class="onoffswitch">
                    <input type="checkbox" name="options[autosuggest]" value="1" id="autosuggest_{{ $user_field->id }}" class="onoffswitch-checkbox" @if (!empty($user_field->options['autosuggest']))checked="checked"@endif @if ($user_field->type != \UserField::TYPE_SINGLE_LINE) disabled @endif">
                    <label class="onoffswitch-label" for="autosuggest_{{ $user_field->id }}"></label>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label">{{ __('Required') }}</label>

    <div class="col-sm-10">
        <div class="controls">
            <div class="onoffswitch-wrap">
                <div class="onoffswitch">
                    <input type="checkbox" name="required" value="1" id="required_{{ $user_field->id }}" class="onoffswitch-checkbox" @if ($user_field->required)checked="checked"@endif >
                    <label class="onoffswitch-label" for="required_{{ $user_field->id }}"></label>
                </div>
            </div>
        </div>
    </div>
</div>
