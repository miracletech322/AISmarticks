@foreach ($conversations as $conversation)
	<div class="checkbox"><input type="checkbox" class="conv-merge-id conv-merge-searched" value="{{ $conversation->id }}" /><a href="{{ $conversation->url() }}" target="_blank" data-toggle="tooltip" title="{{ __('Click to view') }}"><strong>#{{ $conversation->number }}</strong> {{ $conversation->getSubject() }}</a></div>
@endforeach