@if (count($conversations) || (isset($params) && !empty($params['user_id'])))
    @php
        if (is_array($conversations)) {
            $conversations = collect($conversations);
        }
        if (empty($folder)) {
            // Create dummy folder
            $folder = new App\Folder();
            $folder->type = App\Folder::TYPE_ASSIGNED;
        }
        // Clean filter.
        if (!empty($conversations_filter)) {
            foreach ($conversations_filter as $i => $filter_value) {
                if (is_array($filter_value)) {
                    unset($conversations_filter[$i]);
                }
            }
        }

        // Preload users and customers
        App\Conversation::loadUsers($conversations);
        App\Conversation::loadCustomers($conversations);

        // Get information on viewers
        if (empty($no_checkboxes)) {
            $viewers = App\Conversation::getViewersInfo($conversations, ['id', 'first_name', 'last_name'], [Auth::user()->id]);
        }

        $conversations = \Eventy::filter('conversations_table.preload_table_data', $conversations);
        $show_assigned = ($folder->type == App\Folder::TYPE_ASSIGNED || $folder->type == App\Folder::TYPE_CLOSED || !array_key_exists($folder->type, App\Folder::$types));

        if (!isset($params)) {
            $params = [];
        }

        // For customer profile.
        if (!empty($params['no_customer'])) {
            $no_customer = true;
        }
        if (!empty($params['no_checkboxes'])) {
            $no_checkboxes = true;
        }
        $params['target_blank'] = \Auth::user()->open_on_this_page ? '_self' : '_blank';

        // Sorting.
        $sorting = App\Conversation::getConvTableSorting();

        // Build columns list
        $columns = ['current'];
        if (empty($no_checkboxes)) {
            $columns[] = 'cb';
        }
        if (empty($no_customer)) {
            $columns[] = 'customer';
        }
        $columns[] = 'attachment';
        $columns[] = 'subject';
        $columns[] = 'count';
        if ($show_assigned) {
            $columns[] = 'assignee';
        }
        $columns[] = 'number';
        $columns[] = 'date';

        $col_counter = 6;
    @endphp

    {{--@if (!request()->get('page'))--}}
        @include('/conversations/partials/bulk_actions')
    {{--@endif--}}

    <table class="table-conversations table @if (!empty($params['show_mailbox']))show-mailbox @endif" data-page="{{ (int)request()->get('page', 1) }}" @foreach ($params as $param_name => $param_value) data-param_{{ $param_name }}="{{ $param_value }}" @endforeach @if (!empty($conversations_filter)) @foreach ($conversations_filter as $filter_field => $filter_value) data-filter_{{ $filter_field }}="{{ $filter_value }}" @endforeach @endif @foreach ($sorting as $sorting_name => $sorting_value) data-sorting_{{ $sorting_name }}="{{ $sorting_value }}" @endforeach >
        <colgroup>
            {{-- todo: without this column table becomes not 100% wide --}}
            <col class="conv-current">
            @if (empty($no_checkboxes))<col class="conv-cb">@php $col_counter++ ; @endphp@endif
            @if (empty($no_customer))<col class="conv-customer">@php $col_counter++ ; @endphp@endif
            <col class="conv-attachment">
            <col class="conv-subject">
            <col class="conv-thread-count">
            @if ($show_assigned)
                <col class="conv-owner">@php $col_counter++ ; @endphp
            @endif
            @action('conversations_table.col_before_conv_number')
            <col class="conv-number">
            <col class="conv-date">
        </colgroup>
        <thead>
        <tr>
            <th class="conv-current">&nbsp;</th>
            @if (empty($no_checkboxes))<th class="conv-cb"><input type="checkbox" class="toggle-all magic-checkbox" id="toggle-all"><label for="toggle-all"></label></th>@endif
            @if (empty($no_customer))
                <th class="conv-customer">
                    <span>{{ __("Customer") }}</span>
                </th>
            @endif
            <th class="conv-attachment">&nbsp;</th>
            <th class="conv-subject" colspan="2">
                <span class="conv-col-sort" data-sort-by="subject" data-order="@if ($sorting['sort_by'] == 'subject'){{ $sorting['order'] }}@else{{ 'asc' }}@endif">
                    {{ __("Conversation") }} 
                     @if ($sorting['sort_by'] == 'subject' && $sorting['order'] =='desc')↑@endif
                     @if ($sorting['sort_by'] == 'subject' && $sorting['order'] =='asc')↓@endif
                </span>
            </th>
            @if ($show_assigned)
                <th class="conv-owner fs-trigger-modal @if (!empty($params['user_id'])) filtered @endif" data-remote="{{ route('conversations.ajax_html', ['action' =>
                        'assignee_filter', 'mailbox_id' => (\Helper::isRoute('mailboxes.view.folder') ? $folder->mailbox_id : ''), 'user_id' => ($params['user_id'] ?? '')]) }}" data-trigger="modal" data-modal-title="{{ __("Assigned To") }}" data-modal-no-footer="true" data-modal-on-show="initConvAssigneeFilter">
                    <span>{{ __("Assigned To") }}<small class="glyphicon glyphicon-filter"></small></span>
                </th>
                {{--<th class="conv-owner dropdown">
                    <span {{--data-target="#"- -}} class="dropdown-toggle" data-toggle="dropdown">{{ __("Assigned To") }}</span>
                    <ul class="dropdown-menu">
                          <li><a class="filter-owner" data-id="1" href="#"><span class="option-title">{{ __("Anyone") }}</span></a></li>
                          <li><a class="filter-owner" data-id="123" href="#"><span class="option-title">{{ __("Me") }}</span></a></li>
                          <li><a class="filter-owner" data-id="123" href="#"><span class="option-title">{{ __("User") }}</span></a></li>
                    </ul>
                </th>--}}
            @endif
            @action('conversations_table.th_before_conv_number')
            <th class="conv-number">
                <span class="conv-col-sort" data-sort-by="number" data-order="@if ($sorting['sort_by'] == 'number'){{ $sorting['order'] }}@else{{ 'asc' }}@endif">
                    {{ __("Number") }} 
                     @if ($sorting['sort_by'] == 'number' && $sorting['order'] =='desc')↑@endif
                     @if ($sorting['sort_by'] == 'number' && $sorting['order'] =='asc')↓@endif
                </span>
            </th>
            <th class="conv-date">
                <span>
                    <span class="conv-col-sort" data-sort-by="date" data-order="@if ($sorting['sort_by'] == 'date'){{ $sorting['order'] }}@else{{ 'asc' }}@endif">
                        @if ($folder->type == App\Folder::TYPE_CLOSED)@php $column_title_date = __("Closed"); @endphp@elseif ($folder->type == App\Folder::TYPE_DRAFTS)@php $column_title_date = __("Last Updated"); @endphp@elseif ($folder->type == App\Folder::TYPE_DELETED)@php $column_title_date = __("Deleted"); @endphp@else@php $column_title_date = \Eventy::filter('conversations_table.column_title_date', __("Waiting Since"), $folder) @endphp@endif{{ $column_title_date }} @if ($sorting['sort_by'] == 'date' && $sorting['order'] == 'desc')↑@elseif ($sorting['sort_by'] == 'date' && $sorting['order'] == 'asc')↓@elseif ($sorting['sort_by'] == '' && $sorting['order'] =='')↓@endif
                    </a>
                </span>
            </th>
          </tr>
        </thead>
        <tbody>
            @foreach ($conversations as $conversation)
                <tr class="conv-row @action('conversations_table.row_class', $conversation) @if ($conversation->isActive()) conv-active @endif @if ($conversation->isSpam()) conv-spam @endif" data-conversation_id="{{ $conversation->id }}">
                    @if (empty($no_checkboxes))<td class="conv-current">@if (!empty($viewers[$conversation->id]))
                                <div class="viewer-badge @if (!empty($viewers[$conversation->id]['replying'])) viewer-replying @endif" data-toggle="tooltip" title="@if (!empty($viewers[$conversation->id]['replying'])){{ __(':user is replying', ['user' => $viewers[$conversation->id]['user']->getFullName()]) }}@else{{ __(':user is viewing', ['user' => $viewers[$conversation->id]['user']->getFullName()]) }}@endif"><div>
                            @endif</td>@else<td class="conv-current"></td>@endif
                    @if (empty($no_checkboxes))
                        <td class="conv-cb">
                            <input type="checkbox" class="conv-checkbox magic-checkbox" id="cb-{{ $conversation->id }}" name="cb_{{ $conversation->id }}" value="{{ $conversation->id }}"><label for="cb-{{ $conversation->id }}"></label>
                        </td>
                    @endif
                    @if (empty($no_customer))
                        <td class="conv-customer">
                            <a href="{{ $conversation->url() }}" target="{{ $params['target_blank'] }}">
                                @if ($conversation->customer_id && $conversation->customer){{ $conversation->customer->getFullName(true)}}@endif&nbsp;@if ($conversation->threads_count > 1)<span class="conv-counter">{{ $conversation->threads_count }}</span>@endif
                                @if ($conversation->user_id)
                                    <small class="conv-owner-mobile text-help">
                                        {{ $conversation->user->getFullName() }} <small class="glyphicon glyphicon-user"></small>
                                    </small>
                                @endif
                            </a>
                        </td>
                    @else
                        {{-- Displayed in customer conversation history --}}
                        <td class="conv-customer conv-owner-mobile">
                            <a href="{{ $conversation->url() }}" class="help-link" target="{{ $params['target_blank'] }}">
                                <small class="glyphicon glyphicon-envelope"></small> 
                                @if ($conversation->user_id)
                                     <small>&nbsp;<i class="glyphicon glyphicon-user"></i> {{ $conversation->user->getFullName() }}</small> 
                                @endif
                            </a>
                        </td>
                    @endif
                    <td class="conv-attachment">
                        <i class="glyphicon conv-star @if ($conversation->isStarredByUser()) glyphicon-star @else glyphicon-star-empty @endif" title="@if ($conversation->isStarredByUser()){{ __("Unstar Conversation") }}@else{{ __("Star Conversation") }}@endif"></i>
                        
                        @if ($conversation->has_attachments)
                            <i class="glyphicon glyphicon-paperclip"></i>
                        @else
                            &nbsp;
                        @endif
                    </td>
                    <td class="conv-subject">
                        <a href="{{ $conversation->url() }}" title="{{ __('View conversation') }}" @if (!empty(request()->x_embed) || $params['target_blank'] == '_blank') target="_blank" @else  target="_self" @endif>
                            <span class="conv-fader"></span>
                            <p style="display:flex;align-items:center;">
                                @if ($conversation->has_attachments)
                                    <i class="conv-attachment-mobile glyphicon glyphicon-paperclip"></i>
                                @endif
                                @if ($conversation->isPhone())
                                    <i class="glyphicon glyphicon-earphone"></i>
                                @endif
								@if ($conversation->isCustom())
                                    <i class="glyphicon glyphicon-comment"></i>
                                @endif
								@include('conversations/partials/badges'){{ '' }}

								@if ($conversation->isChat() && $conversation->getChannelName())
									@if ($conversation->getChannelName()=='Telegram')
										<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 48 48" class="pull-left">
											<path fill="#29b6f6" d="M24 4A20 20 0 1 0 24 44A20 20 0 1 0 24 4Z"></path><path fill="#fff" d="M33.95,15l-3.746,19.126c0,0-0.161,0.874-1.245,0.874c-0.576,0-0.873-0.274-0.873-0.274l-8.114-6.733 l-3.97-2.001l-5.095-1.355c0,0-0.907-0.262-0.907-1.012c0-0.625,0.933-0.923,0.933-0.923l21.316-8.468 c-0.001-0.001,0.651-0.235,1.126-0.234C33.667,14,34,14.125,34,14.5C34,14.75,33.95,15,33.95,15z"></path><path fill="#b0bec5" d="M23,30.505l-3.426,3.374c0,0-0.149,0.115-0.348,0.12c-0.069,0.002-0.143-0.009-0.219-0.043 l0.964-5.965L23,30.505z"></path><path fill="#cfd8dc" d="M29.897,18.196c-0.169-0.22-0.481-0.26-0.701-0.093L16,26c0,0,2.106,5.892,2.427,6.912 c0.322,1.021,0.58,1.045,0.58,1.045l0.964-5.965l9.832-9.096C30.023,18.729,30.064,18.416,29.897,18.196z"></path>
										</svg>
									@elseif ($conversation->getChannelName()=='Facebook')
										<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 48 48" class="pull-left">
											<path fill="#039be5" d="M24 5A19 19 0 1 0 24 43A19 19 0 1 0 24 5Z"></path><path fill="#fff" d="M26.572,29.036h4.917l0.772-4.995h-5.69v-2.73c0-2.075,0.678-3.915,2.619-3.915h3.119v-4.359c-0.548-0.074-1.707-0.236-3.897-0.236c-4.573,0-7.254,2.415-7.254,7.917v3.323h-4.701v4.995h4.701v13.729C22.089,42.905,23.032,43,24,43c0.875,0,1.729-0.08,2.572-0.194V29.036z"></path>
										</svg>
									@elseif ($conversation->getChannelName()=='Whatsapp' || $conversation->getChannelName()=='WhatsApp')
										<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 48 48" class="pull-left">
											<path fill="#fff" d="M4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98c-0.001,0,0,0,0,0h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303z"></path><path fill="#fff" d="M4.868,43.803c-0.132,0-0.26-0.052-0.355-0.148c-0.125-0.127-0.174-0.312-0.127-0.483l2.639-9.636c-1.636-2.906-2.499-6.206-2.497-9.556C4.532,13.238,13.273,4.5,24.014,4.5c5.21,0.002,10.105,2.031,13.784,5.713c3.679,3.683,5.704,8.577,5.702,13.781c-0.004,10.741-8.746,19.48-19.486,19.48c-3.189-0.001-6.344-0.788-9.144-2.277l-9.875,2.589C4.953,43.798,4.911,43.803,4.868,43.803z"></path><path fill="#cfd8dc" d="M24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,4C24.014,4,24.014,4,24.014,4C12.998,4,4.032,12.962,4.027,23.979c-0.001,3.367,0.849,6.685,2.461,9.622l-2.585,9.439c-0.094,0.345,0.002,0.713,0.254,0.967c0.19,0.192,0.447,0.297,0.711,0.297c0.085,0,0.17-0.011,0.254-0.033l9.687-2.54c2.828,1.468,5.998,2.243,9.197,2.244c11.024,0,19.99-8.963,19.995-19.98c0.002-5.339-2.075-10.359-5.848-14.135C34.378,6.083,29.357,4.002,24.014,4L24.014,4z"></path><path fill="#40c351" d="M35.176,12.832c-2.98-2.982-6.941-4.625-11.157-4.626c-8.704,0-15.783,7.076-15.787,15.774c-0.001,2.981,0.833,5.883,2.413,8.396l0.376,0.597l-1.595,5.821l5.973-1.566l0.577,0.342c2.422,1.438,5.2,2.198,8.032,2.199h0.006c8.698,0,15.777-7.077,15.78-15.776C39.795,19.778,38.156,15.814,35.176,12.832z"></path><path fill="#fff" fill-rule="evenodd" d="M19.268,16.045c-0.355-0.79-0.729-0.806-1.068-0.82c-0.277-0.012-0.593-0.011-0.909-0.011c-0.316,0-0.83,0.119-1.265,0.594c-0.435,0.475-1.661,1.622-1.661,3.956c0,2.334,1.7,4.59,1.937,4.906c0.237,0.316,3.282,5.259,8.104,7.161c4.007,1.58,4.823,1.266,5.693,1.187c0.87-0.079,2.807-1.147,3.202-2.255c0.395-1.108,0.395-2.057,0.277-2.255c-0.119-0.198-0.435-0.316-0.909-0.554s-2.807-1.385-3.242-1.543c-0.435-0.158-0.751-0.237-1.068,0.238c-0.316,0.474-1.225,1.543-1.502,1.859c-0.277,0.317-0.554,0.357-1.028,0.119c-0.474-0.238-2.002-0.738-3.815-2.354c-1.41-1.257-2.362-2.81-2.639-3.285c-0.277-0.474-0.03-0.731,0.208-0.968c0.213-0.213,0.474-0.554,0.712-0.831c0.237-0.277,0.316-0.475,0.474-0.791c0.158-0.317,0.079-0.594-0.04-0.831C20.612,19.329,19.69,16.983,19.268,16.045z" clip-rule="evenodd"></path>
										</svg>
									@else
										<span class="fs-tag pull-left">
											<span class="fs-tag-name">
												<small class="glyphicon glyphicon-phone"></small> {{ $conversation->getChannelName() }}
											</span>
										</span>
									@endif
								@endif

								{{ '' }}
								@action('conversations_table.before_subject', $conversation)<p>{{ $conversation->getSubject() }}</p>
								@action('conversations_table.after_subject', $conversation)
                            </p>
                            <p class="conv-preview">@action('conversations_table.preview_prepend', $conversation)@if (!empty($params['show_mailbox']))[{{ $conversation->mailbox_cached->name }}]<br/>@endif{{ '' }}@if ($conversation->preview){{ $conversation->preview }}@else&nbsp;@endif</p>
                        </a>
                    </td>
                    <td class="conv-thread-count">
                        <i class="glyphicon conv-star @if ($conversation->isStarredByUser()) glyphicon-star @else glyphicon-star-empty @endif" title="@if ($conversation->isStarredByUser()){{ __("Unstar Conversation") }}@else{{ __("Star Conversation") }}@endif"></i>

                        {{--<a href="{{ $conversation->url() }}" title="{{ __('View conversation') }}">@if ($conversation->threads_count <= 1)&nbsp;@else<span>{{ $conversation->threads_count }}</span>@endif</a>--}}
                    </td>
                    @if ($show_assigned)
                        <td class="conv-owner">
                            @if ($conversation->user_id)<a href="{{ $conversation->url() }}" title="{{ __('View conversation') }}" target="{{ $params['target_blank'] }}"> {{ $conversation->user->getFullName() }} </a>@else &nbsp;@endif
                        </td>
                    @endif
                    @action('conversations_table.td_before_conv_number', $conversation)
                    <td class="conv-number">
                        <a href="{{ $conversation->url() }}" title="{{ __('View conversation') }}"  target="{{ $params['target_blank'] }}"><i>#</i>{{ $conversation->number }}</a>
                    </td>
                    <td class="conv-date">
						@php $conv_waiting_since = $conversation->getWaitingSince($folder); @endphp<a href="{{ $conversation->url() }}" @if (!in_array($folder->type, [App\Folder::TYPE_CLOSED, App\Folder::TYPE_DRAFTS, App\Folder::TYPE_DELETED]))@php $conv_date_title = $conversation->getDateTitle(); @endphp aria-label="{{ $conv_waiting_since }}" aria-description="{{ $conv_date_title }}" data-toggle="tooltip" data-html="true" data-placement="left" title="{{ $conv_date_title }}"@else title="{{ __('View conversation') }}" @endif @if (!empty($params['target_blank'])) target="{{ $params['target_blank'] }}" @endif>{{ $conv_waiting_since }}</a>
                    </td>
                </tr>
                @action('conversations_table.after_row', $conversation, $columns, $col_counter)
            @endforeach
        </tbody>
        @if (count($conversations))
            <tfoot>
                <tr>
                    <td class="conv-totals" colspan="{{ $col_counter-3 }}">
                        @if ($conversations->total())
                            {!! __(':count conversations', ['count' => '<strong>'.$conversations->total().'</strong>']) !!}&nbsp;|&nbsp; 
                        @endif
                        @if (isset($folder->active_count) && !$folder->isIndirect())
                            <strong>{{ $folder->getActiveCount() }}</strong> {{ __('active') }}&nbsp;|&nbsp; 
                        @endif
                        @if ($conversations)
                            <strong>{{ $conversations->firstItem() }}</strong>-<strong>{{ $conversations->lastItem() }}</strong>
                        @endif
                    </td>
                    <td colspan="3" class="conv-nav">
                        <div class="table-pager">
                            @if ($conversations)
                                {{ $conversations->links('conversations/conversations_pagination') }}
                            @endif
                        </div>
                    </td>
                </tr>
            </tfoot>
        @endif
    </table>
@else
    @include('partials/empty', ['empty_text' => __('There are no conversations here')])
@endif

@section('javascript')
    @parent
    conversationsTableInit();
@endsection
