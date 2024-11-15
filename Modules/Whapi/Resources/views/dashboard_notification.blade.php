    <h2>Whapi Channel Health Status</h2>
    <div>
        <div class="col-xs-12">
			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Last update date') }}</label>
				<div class="col-sm-6">
					{{ isset($health['lastUpdateDate'])?$health['lastUpdateDate']:'---' }}
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Lifetime of phone number') }}</label>
				<div class="col-sm-6">
					{{ isset($health['lifeTime'])?$health['lifeTime']:'---' }}
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Coverage of the address book') }}</label>
				<div class="col-sm-6">
					{{ isset($health['riskFactorContacts'])?$health['riskFactorContacts']:'---' }}
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Response rate') }}</label>
				<div class="col-sm-6">
					{{ isset($health['riskFactorChats'])?$health['riskFactorChats']:'---' }}
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">{{ __('Overall rating') }}</label>

				<div class="col-sm-6">
					{{ isset($health['riskFactor'])?$health['riskFactor']:'---' }}
				</div>
			</div>
		</div>
    </div>
