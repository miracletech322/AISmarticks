@php
	$dropdown_locales = config('app.locales');
@endphp
@foreach ($dropdown_locales as $locale)
	@php
		$data = \Helper::getLocaleData($locale);
	@endphp
	<option value="{{ $locale }}" @if ($selected == $locale)selected="selected"@endif>{{ $data['name'] }}</option>
@endforeach