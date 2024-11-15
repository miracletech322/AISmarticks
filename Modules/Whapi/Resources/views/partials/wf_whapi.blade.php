<div class="row-container">
	<form class="form-horizontal wf-email-form" method="POST" action="">
		<div class="form-group">
			<label>{{ __('Phone (blank for customer)') }}</label>
			<input type="text" class="form-control wf-email-input" name="phone" value="{{ $phone }}"/>
		</div>
		<div class="form-group">
			<label>{{ __('Text') }}</label>
			<input type="text" class="form-control wf-email-input" name="text" value="{{ $text }}"/>
		</div>
		<div class="form-group margin-top margin-bottom-10">
			<button class="btn btn-primary" data-loading-text="{{ __('Saving') }}…">{{ __('Save') }}</button> 
			<button class="btn btn-link" data-dismiss="modal">{{ __('Cancel') }}</button>
		</div>
	</form>
</div>