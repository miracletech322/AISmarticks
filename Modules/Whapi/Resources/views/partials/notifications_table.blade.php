<td>
	{{ __("Whapi channel isnt health") }}
</td>
<td class="subs-cb subscriptions-email"><input type="checkbox" @include('users/is_subscribed', ['medium' => App\Subscription::MEDIUM_EMAIL, 'event' => \Whapi::EVENT_NONHEALTH]) name="{{ $subscriptions_formname }}[{{ App\Subscription::MEDIUM_EMAIL }}][]" value="{{ \Whapi::EVENT_NONHEALTH }}"></td>
<td class="subs-cb subscriptions-browser"><input type="checkbox" @include('users/is_subscribed', ['medium' => App\Subscription::MEDIUM_BROWSER, 'event' => \Whapi::EVENT_NONHEALTH]) name="{{ $subscriptions_formname }}[{{ App\Subscription::MEDIUM_BROWSER }}][]" value="{{ \Whapi::EVENT_NONHEALTH }}"></td>
<td class="subs-cb subscriptions-mobile"><input type="checkbox" @include('users/is_subscribed', ['medium' => App\Subscription::MEDIUM_MOBILE, 'event' => \Whapi::EVENT_NONHEALTH]) name="{{ $subscriptions_formname }}[{{ App\Subscription::MEDIUM_MOBILE }}][]" @if (!$mobile_available) disabled="disabled" @endif value="{{ \Whapi::EVENT_NONHEALTH }}"></td>
@action('notifications_table.td', \Whapi::EVENT_NONHEALTH, $subscriptions_formname, $subscriptions)
</tr>