Whapi Channel Health Status:
{{ __('Last update date') }}: {{ isset($health['lastUpdateDate'])?$health['lastUpdateDate']:'---' }}
{{ __('Lifetime of phone number') }}: {{ isset($health['lifeTime'])?$health['lifeTime']:'---' }}
{{ __('Coverage of the address book') }}: {{ isset($health['riskFactorContacts'])?$health['riskFactorContacts']:'---' }}
{{ __('Response rate') }}: {{ isset($health['riskFactorChats'])?$health['riskFactorChats']:'---' }}
{{ __('Overall rating') }}: {{ isset($health['riskFactor'])?$health['riskFactor']:'---' }}