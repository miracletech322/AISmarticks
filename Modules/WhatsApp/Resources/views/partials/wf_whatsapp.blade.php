<div class="row-container">
	<form class="form-horizontal wf-email-form" method="POST" action="">
		<div class="form-group">
			<label>{{ __('Phone (blank for customer)') }}</label>
			<input type="text" class="form-control wf-email-input" name="phone" value="{{ $phone }}"/>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">{{ __('Template') }}</label>
			<div class="col-sm-9">
				<select class="form-control wf-email-input" name="whatsapptemplate" id="wfwhatsapptemplate">
					@if(isset($whatsapp_templates))
						@foreach ($whatsapp_templates as $template)
							<option value="{{ $template['id'] }}" @if($template['id']==$whatsapptemplate) selected @endif >{{ $template['name'] }}</option>
						@endforeach
					@endif
				</select>
			</div>
		</div>
		<div id="wf-wt-form"></div>
		<div class="form-group margin-top margin-bottom-10">
			<button class="btn btn-primary" data-loading-text="{{ __('Saving') }}…">{{ __('Save') }}</button> 
			<button class="btn btn-link" data-dismiss="modal">{{ __('Cancel') }}</button>
		</div>
	</form>
	<script>
		wfWhatsappViewTemplate();
	</script>
</div>