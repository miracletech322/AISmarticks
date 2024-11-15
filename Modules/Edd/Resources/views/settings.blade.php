<form class="form-horizontal margin-top margin-bottom" method="POST" action="">
    {{ csrf_field() }}

    <div class="form-group{{ $errors->has('settings.edd->url') ? ' has-error' : '' }}">
        <label class="col-sm-2 control-label">{{ __('Store URL') }}</label>

        <div class="col-sm-6">
            <div class="input-group input-sized-lg">
                <span class="input-group-addon input-group-addon-grey">https://</span>
                <input type="text" class="form-control input-sized-lg" name="settings[edd.url]" value="{{ old('settings') ? old('settings')['edd.url'] : $settings['edd.url'] }}">
            </div>

            @include('partials/field_error', ['field'=>'settings.edd->url'])

            <p class="form-help">
                {{ __('Example') }}: example.org/shop/
            </p>
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('API Public Key') }}</label>

        <div class="col-sm-6">
            <input type="text" class="form-control input-sized-lg" name="settings[edd.key]" value="{{ $settings['edd.key'] }}">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-2 control-label">{{ __('API Token') }}</label>

        <div class="col-sm-6">
            <input type="text" class="form-control input-sized-lg" name="settings[edd.token]" value="{{ $settings['edd.token'] }}">

            <p class="form-help">
                {{ __('You can generate EDD API credentials in your WordPress installation under "Downloads » Tools » API Keys"') }})
            </p>
        </div>
    </div>

    <div class="form-group margin-top margin-bottom">
        <div class="col-sm-6 col-sm-offset-2">
            <button type="submit" class="btn btn-primary">
                {{ __('Save') }}
            </button>
        </div>
    </div>
</form>