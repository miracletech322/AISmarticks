<div class="conv-sidebar-block">
    <div class="panel-group accordion accordion-empty">
        <div class="panel panel-default" id="voipeintegration-sidebar">
			<div class="panel-heading">
			    <h4 class="panel-title">
			        <a data-toggle="collapse" href=".voipeintegration-collapse-sidebar">
						{{ __('Last calls') }}
			            <b class="caret"></b>
			        </a>
			    </h4>
			</div>
			<div class="voipeintegration-collapse-sidebar panel-collapse collapse in">
			    <div class="panel-body">
			        <div class="sidebar-block-header2"><strong>{{ __('Last calls') }}</strong> (<a data-toggle="collapse" href=".voipeintegration-collapse-sidebar">{{ __('close') }}</a>)</div>
					
					@if (count($calls) && count($prev_conversations)) 
						<ul class="sidebar-block-list voipe-sidebar">
							@foreach ($calls as $call)
								@if (isset($prev_conversations[$call->conversation_id]))
									<li>
										<a href="{{ $prev_conversations[$call->conversation_id]->url() }}" target="_blank" class="help-link">
											<i class="glyphicon glyphicon-earphone"></i>
											{{ __($call->data['event']) }} {{ $call->data['date_time'] }} 
										</a>
									</li>
								@endif
							@endforeach
						</ul>
					@else
						<div style="text-align: center;">
							{{ __('there are no calls') }}
						</div>
					@endif
		
			    </div>
			</div>
        </div>
    </div>
</div>
