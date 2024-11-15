<div class="panel-heading">
    <h4 class="panel-title">
        <a data-toggle="collapse" href=".edd-collapse-orders">
            Easy Digital Downloads
            <b class="caret"></b>
        </a>
    </h4>
</div>
<div class="edd-collapse-orders panel-collapse collapse in">
    <div class="panel-body">
        <div class="sidebar-block-header2"><strong>Easy Digital Downloads</strong> (<a data-toggle="collapse" href=".edd-collapse-orders">{{ __('close') }}</a>)</div>
       	<div id="edd-loader">
        	<img src="{{ asset('img/loader-tiny.gif') }}" />
        </div>
        	
        @if (!$load)
            @if (count($orders)) 
			    <ul class="sidebar-block-list edd-orders-list">
                    @foreach($orders as $order)
                        <li>
                            <div>
                                {{-- EDD 3 returns not order post ID in ID but it's own order ID instead --}}
                                @if (is_numeric($order['ID']))
                                    <a href="{{ $url }}wp-admin/edit.php?post_type=download&amp;page=edd-payment-history&amp;view=view-order-details&amp;id={{ $order['ID'] }}" target="_blank">{{ $order['products'][0]['name'] }}</a>
                                @else
                                    <a href="{{ $url }}wp-admin/edit.php?post_type=download&amp;page=edd-payment-history&amp;s={{ $order['ID'] }}" target="_blank">{{ $order['products'][0]['name'] }}</a>
                                @endif

                                <span class="pull-right">{{ $order['total'] }}</span>
                            </div>
                            <div>
                                <small class="text-help">{{ \Carbon\Carbon::parse($order['date'])->format('M j, Y')  }}</small>
                                @if (!empty($order['licenses']) && !empty($order['licenses'][0]) && !empty($order['licenses'][0]['status']))
                                    <small class="pull-right @if ($order['licenses'][0]['status'] == 'active') text-success @else text-warning @endif ">
                                        {{ __(ucfirst($order['licenses'][0]['status'])) }}
                                    </small>
                                @endif
                            </div>
                        </li>
                    @endforeach
                </ul>
			@else
			    <div class="text-help margin-top-10 edd-no-orders">{{ __("No orders found") }}</div>
			@endif
        @endif
   
        <div class="margin-top-10 small edd-actions">
            <a href="#" class="sidebar-block-link edd-refresh"><i class="glyphicon glyphicon-refresh"></i> {{ __("Refresh") }}</a>
            @if (count($orders) >= \Edd::MAX_ORDERS) | 
                <a href="{{ $url }}wp-admin/edit.php?post_type=download&amp;page=edd-payment-history&amp;meta_key&amp;s={{ $customer_email }}" class="sidebar-block-link" target="_blank">{{ __("View all") }}</a>
            @endif
        </div>
	   
    </div>
</div>
