<li @if (\Helper::isMenuSelected('voipesmstickets'))class="active"@endif><a href="{{ route('mailboxes.voipesmstickets.settings', ['mailbox_id'=>$mailbox->id]) }}"><i class="glyphicon glyphicon-erase"></i> {{ __('VoipeSmsTickets') }}</a></li>