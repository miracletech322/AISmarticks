<div class="conv-sidebar-block">
    <div class="panel-group accordion accordion-empty">
        <div class="panel panel-default @if ($load) wc-loading @endif" id="wc-orders">
            @include('woocommerce::partials/orders_list')
        </div>
    </div>
</div>

@section('javascript')
    @parent
    initWooCommerce({!! json_encode($customer_emails) !!}, {{ (int)$load }});
@endsection