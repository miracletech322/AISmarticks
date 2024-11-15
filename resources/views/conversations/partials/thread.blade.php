@if ($thread->type == App\Thread::TYPE_LINEITEM)
    <div class="thread thread-type-{{ $thread->getTypeName() }} thread-state-{{ $thread->getStateName() }}" id="thread-{{ $thread->id }}">
        <div class="thread-message">
            <div class="thread-header">
                <div class="thread-title">
                    {!! $thread->getActionText('', true, false, null, view('conversations/thread_by', ['thread' => $thread])->render()) !!}
                </div>
                <div class="thread-info">
                    <a href="#thread-{{ $thread->id }}" class="thread-date" data-toggle="tooltip" title='{{ App\User::dateFormat($thread->created_at) }}'>{{ App\User::dateDiffForHumans($thread->created_at) }}</a>
                </div>
            </div>
            @action('thread.after_header', $thread, $loop, $threads, $conversation, $mailbox)
        </div>
        <div class="dropdown thread-options">
            <span class="dropdown-toggle {{--glyphicon glyphicon-option-vertical--}}" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true"><b class="caret"></b></span>
            @if (Auth::user()->isAdmin())
                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                    @action('thread.menu', $thread)
                    <li><a href="{{ route('conversations.ajax_html', array_merge(['action' =>
                        'send_log'], \Request::all(), ['thread_id' => $thread->id])) }}" title="{{ __("View outgoing emails") }}" data-trigger="modal" data-modal-title="{{ __("Outgoing Emails") }}" data-modal-size="lg">{{ __("Outgoing Emails") }}</a></li>
                    @action('thread.menu.append', $thread)
                </ul>
            @endif
        </div>
    </div>
@elseif ($thread->type == App\Thread::TYPE_MESSAGE && $thread->state == App\Thread::STATE_DRAFT)
    <div class="thread thread-type-draft" id="thread-{{ $thread->id }}" data-thread_id="{{ $thread->id }}">
        <div class="thread-message">
            <div class="thread-header">
                <div class="thread-title">
                    <div class="thread-person">
						@if (($thread->meta['channel']??false) === 'whatsapp')
							<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 48 48" class="pull-left">
								<path fill="#fff" d="M4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98c-0.001,0,0,0,0,0h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303z"></path><path fill="#fff" d="M4.868,43.803c-0.132,0-0.26-0.052-0.355-0.148c-0.125-0.127-0.174-0.312-0.127-0.483l2.639-9.636c-1.636-2.906-2.499-6.206-2.497-9.556C4.532,13.238,13.273,4.5,24.014,4.5c5.21,0.002,10.105,2.031,13.784,5.713c3.679,3.683,5.704,8.577,5.702,13.781c-0.004,10.741-8.746,19.48-19.486,19.48c-3.189-0.001-6.344-0.788-9.144-2.277l-9.875,2.589C4.953,43.798,4.911,43.803,4.868,43.803z"></path><path fill="#cfd8dc" d="M24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,4C24.014,4,24.014,4,24.014,4C12.998,4,4.032,12.962,4.027,23.979c-0.001,3.367,0.849,6.685,2.461,9.622l-2.585,9.439c-0.094,0.345,0.002,0.713,0.254,0.967c0.19,0.192,0.447,0.297,0.711,0.297c0.085,0,0.17-0.011,0.254-0.033l9.687-2.54c2.828,1.468,5.998,2.243,9.197,2.244c11.024,0,19.99-8.963,19.995-19.98c0.002-5.339-2.075-10.359-5.848-14.135C34.378,6.083,29.357,4.002,24.014,4L24.014,4z"></path><path fill="#40c351" d="M35.176,12.832c-2.98-2.982-6.941-4.625-11.157-4.626c-8.704,0-15.783,7.076-15.787,15.774c-0.001,2.981,0.833,5.883,2.413,8.396l0.376,0.597l-1.595,5.821l5.973-1.566l0.577,0.342c2.422,1.438,5.2,2.198,8.032,2.199h0.006c8.698,0,15.777-7.077,15.78-15.776C39.795,19.778,38.156,15.814,35.176,12.832z"></path><path fill="#fff" fill-rule="evenodd" d="M19.268,16.045c-0.355-0.79-0.729-0.806-1.068-0.82c-0.277-0.012-0.593-0.011-0.909-0.011c-0.316,0-0.83,0.119-1.265,0.594c-0.435,0.475-1.661,1.622-1.661,3.956c0,2.334,1.7,4.59,1.937,4.906c0.237,0.316,3.282,5.259,8.104,7.161c4.007,1.58,4.823,1.266,5.693,1.187c0.87-0.079,2.807-1.147,3.202-2.255c0.395-1.108,0.395-2.057,0.277-2.255c-0.119-0.198-0.435-0.316-0.909-0.554s-2.807-1.385-3.242-1.543c-0.435-0.158-0.751-0.237-1.068,0.238c-0.316,0.474-1.225,1.543-1.502,1.859c-0.277,0.317-0.554,0.357-1.028,0.119c-0.474-0.238-2.002-0.738-3.815-2.354c-1.41-1.257-2.362-2.81-2.639-3.285c-0.277-0.474-0.03-0.731,0.208-0.968c0.213-0.213,0.474-0.554,0.712-0.831c0.237-0.277,0.316-0.475,0.474-0.791c0.158-0.317,0.079-0.594-0.04-0.831C20.612,19.329,19.69,16.983,19.268,16.045z" clip-rule="evenodd"></path>
							</svg>
						@elseif (($thread->meta['channel']??false) === 'voipesms')
							<i class="glyphicon glyphicon-comment"></i>
						@endif
                        <strong>@include('conversations/thread_by')</strong>
                        @if ($thread->isForward())
                            {{ __('are forwarding') }}
                        @else
                            &nbsp;
                        @endif
                        [{{ __('Draft') }}]
                    </div>
                    <div class="btn-group btn-group-xs draft-actions">
                        <a class="btn btn-default edit-draft-trigger" href="#">{{ __('Edit') }}</a>
                        <a class="btn btn-default discard-draft-trigger" href="#">{{ __('Discard') }}</a>
                    </div>
                </div>
                <div class="thread-info">
                    {{--<span class="thread-type">[{{ __('Draft') }}] <span>·</span> </span>--}}
                    <a href="#thread-{{ $thread->id }}" class="thread-date" data-toggle="tooltip" title='{{ App\User::dateFormat($thread->created_at) }}'>{{ App\User::dateDiffForHumans($thread->created_at) }}</a>
                </div>
            </div>
            @action('thread.after_header', $thread, $loop, $threads, $conversation, $mailbox)
            <div class="thread-body">
                @action('thread.before_body', $thread, $loop, $threads, $conversation, $mailbox)
                {!! $thread->getCleanBody() !!}

                @include('conversations/partials/thread_attachments')
            </div>
        </div>
    </div>
@else
    <div class="thread thread-type-{{ $thread->getTypeName() }}" id="thread-{{ $thread->id }}" data-thread_id="{{ $thread->id }}">
        <div class="thread-photo">
            @include('partials/person_photo', ['person' => $thread->getPerson(true)])
        </div>
        <div class="thread-message">
            @if ($thread->isForward())
                <div class="thread-badge">
                    <i class="glyphicon glyphicon-arrow-right"></i>
                </div>
            @endif
            @if ($conversation->isPhone() && $thread->first)
                <div class="thread-badge">
                    <i class="glyphicon glyphicon-earphone"></i>
                </div>
            @endif
            <div class="thread-header">
                <div class="thread-title">
                    <div class="thread-person">
						@if (($thread->meta['channel']??false) === 'whatsapp')
							<svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 48 48" class="pull-left">
								<path fill="#fff" d="M4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98c-0.001,0,0,0,0,0h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303z"></path><path fill="#fff" d="M4.868,43.803c-0.132,0-0.26-0.052-0.355-0.148c-0.125-0.127-0.174-0.312-0.127-0.483l2.639-9.636c-1.636-2.906-2.499-6.206-2.497-9.556C4.532,13.238,13.273,4.5,24.014,4.5c5.21,0.002,10.105,2.031,13.784,5.713c3.679,3.683,5.704,8.577,5.702,13.781c-0.004,10.741-8.746,19.48-19.486,19.48c-3.189-0.001-6.344-0.788-9.144-2.277l-9.875,2.589C4.953,43.798,4.911,43.803,4.868,43.803z"></path><path fill="#cfd8dc" d="M24.014,5c5.079,0.002,9.845,1.979,13.43,5.566c3.584,3.588,5.558,8.356,5.556,13.428c-0.004,10.465-8.522,18.98-18.986,18.98h-0.008c-3.177-0.001-6.3-0.798-9.073-2.311L4.868,43.303l2.694-9.835C5.9,30.59,5.026,27.324,5.027,23.979C5.032,13.514,13.548,5,24.014,5 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974C24.014,42.974,24.014,42.974,24.014,42.974 M24.014,4C24.014,4,24.014,4,24.014,4C12.998,4,4.032,12.962,4.027,23.979c-0.001,3.367,0.849,6.685,2.461,9.622l-2.585,9.439c-0.094,0.345,0.002,0.713,0.254,0.967c0.19,0.192,0.447,0.297,0.711,0.297c0.085,0,0.17-0.011,0.254-0.033l9.687-2.54c2.828,1.468,5.998,2.243,9.197,2.244c11.024,0,19.99-8.963,19.995-19.98c0.002-5.339-2.075-10.359-5.848-14.135C34.378,6.083,29.357,4.002,24.014,4L24.014,4z"></path><path fill="#40c351" d="M35.176,12.832c-2.98-2.982-6.941-4.625-11.157-4.626c-8.704,0-15.783,7.076-15.787,15.774c-0.001,2.981,0.833,5.883,2.413,8.396l0.376,0.597l-1.595,5.821l5.973-1.566l0.577,0.342c2.422,1.438,5.2,2.198,8.032,2.199h0.006c8.698,0,15.777-7.077,15.78-15.776C39.795,19.778,38.156,15.814,35.176,12.832z"></path><path fill="#fff" fill-rule="evenodd" d="M19.268,16.045c-0.355-0.79-0.729-0.806-1.068-0.82c-0.277-0.012-0.593-0.011-0.909-0.011c-0.316,0-0.83,0.119-1.265,0.594c-0.435,0.475-1.661,1.622-1.661,3.956c0,2.334,1.7,4.59,1.937,4.906c0.237,0.316,3.282,5.259,8.104,7.161c4.007,1.58,4.823,1.266,5.693,1.187c0.87-0.079,2.807-1.147,3.202-2.255c0.395-1.108,0.395-2.057,0.277-2.255c-0.119-0.198-0.435-0.316-0.909-0.554s-2.807-1.385-3.242-1.543c-0.435-0.158-0.751-0.237-1.068,0.238c-0.316,0.474-1.225,1.543-1.502,1.859c-0.277,0.317-0.554,0.357-1.028,0.119c-0.474-0.238-2.002-0.738-3.815-2.354c-1.41-1.257-2.362-2.81-2.639-3.285c-0.277-0.474-0.03-0.731,0.208-0.968c0.213-0.213,0.474-0.554,0.712-0.831c0.237-0.277,0.316-0.475,0.474-0.791c0.158-0.317,0.079-0.594-0.04-0.831C20.612,19.329,19.69,16.983,19.268,16.045z" clip-rule="evenodd"></path>
							</svg>
						@elseif (($thread->meta['channel']??false) === 'voipesms')
							<i class="glyphicon glyphicon-comment"></i>
						@endif
                        <strong>
                            @if ($thread->type == App\Thread::TYPE_CUSTOMER)
                                @if ($thread->customer_cached)
                                    @if (\Helper::isPrint())
                                        {{ $thread->customer_cached->getFullName(true) }}
                                    @else
                                        <a href="{{ $thread->customer_cached->url() }}">{{ $thread->customer_cached->getFullName(true) }}</a>
                                    @endif
                                @endif
                            @else
                                @if (\Helper::isPrint())
                                    {{ $thread->created_by_user_cached->getFullName() }}
                                @else
                                    @include('conversations/thread_by', ['as_link' => true])
                                @endif
                            @endif
                        </strong>
                        @if (\Helper::isPrint())
                            <small>&lt;{{ ($thread->type == App\Thread::TYPE_CUSTOMER ? $thread->customer_cached->getMainEmail() : $thread->created_by_user_cached->email ) }}&gt;</small>
                            @if ($thread->isNote())
                                [{{ __('Note') }}]
                            @endif
                        @endif
                        {{-- Lines below must be spaceless --}}
                        {{ \Eventy::action('thread.after_person_action', $thread, $loop, $threads, $conversation, $mailbox) }}
                    </div>
                    @if ($thread->type != App\Thread::TYPE_NOTE || $thread->isForward())
                        <div class="thread-recipients">
                            @action('thread.before_recipients', $thread, $loop, $threads, $conversation, $mailbox)
                            @if (($thread->isUserMessage() && $thread->from && array_key_exists($thread->from, $mailbox->getAliases()))
                                || ($thread->isCustomerMessage() && isset($customer) && count($customer->emails) > 1)
                            )
                                <div>
                                    <strong>
                                        {{ __("From") }}:
                                    </strong>
                                    {{ $thread->from }}
                                </div>
                            @endif
                            @if (($thread->isForward()
                                || $loop->last
                                || ($thread->type == App\Thread::TYPE_CUSTOMER && count($thread->getToArray($mailbox->getEmails())))
                                || ($thread->type == App\Thread::TYPE_MESSAGE && !in_array($conversation->customer_email, $thread->getToArray()))
                                || ($thread->type == App\Thread::TYPE_MESSAGE && isset($customer) && count($customer->emails) > 1)
                                || \Helper::isPrint())
                                && $thread->getToArray()
                            )
                                <div>
                                    <strong>
                                        {{ __("To") }}:
                                    </strong>
                                    {{ implode(', ', $thread->getToArray()) }}
                                </div>
                            @endif
                            @if ($thread->getCcArray())
                                <div>
                                    <strong>
                                        {{ __("Cc") }}:
                                    </strong>
                                    {{ implode(', ', $thread->getCcArray()) }}
                                </div>
                            @endif
                            @if ($thread->getBccArray())
                                <div>
                                    <strong>
                                        {{ __("Bcc") }}:
                                    </strong>
                                    {{ implode(', ', $thread->getBccArray()) }}
                                </div>
                            @endif
                            @action('thread.after_recipients', $thread, $loop, $threads, $conversation, $mailbox)
                        </div>
                    @endif
                </div>
                <div class="thread-info">
                    @action('thread.info.prepend', $thread)
                    @if ($thread->type == App\Thread::TYPE_NOTE)
                        {{--<span class="thread-type">{{ __('Note') }} <span>·</span> </span>--}}
                    @else
                        @if (in_array($thread->type, [App\Thread::TYPE_CUSTOMER, App\Thread::TYPE_MESSAGE]))
                            @php
                                if (!empty($thread_num)) {
                                    $thread_num--;
                                } else {
                                    $thread_num = $conversation->threads_count;
                                }
                                if (!isset($is_first) && ($thread->type == App\Thread::TYPE_CUSTOMER || $thread->type == App\Thread::TYPE_MESSAGE)) {
                                    $is_first = true;
                                } elseif (isset($is_first)) {
                                    $is_first = false;
                                }
                            @endphp
                            @if (!empty($is_first) && $conversation->threads_count > 2)<a href="#thread-{{ $threads[count($threads)-1]->id }}" class="thread-to-first" data-toggle="tooltip" title="{{ __('To the First Message') }}"><i class="glyphicon glyphicon-arrow-down"></i> </a>@endif
                            {{--<span class="thread-type">#{{ $thread_num }} <span>·</span> </span>--}}
                        @endif
                    @endif
                    @if (!\Helper::isPrint())
                        <a href="#thread-{{ $thread->id }}" class="thread-date" data-toggle="tooltip" title='{{ App\User::dateFormat($thread->created_at) }}'>{{ App\User::dateDiffForHumans($thread->created_at) }}</a><br/>
                    @else
                        <a href="#thread-{{ $thread->id }}" class="thread-date" data-toggle="tooltip" title='{{ App\User::dateFormat($thread->created_at) }}'>{{ App\User::dateFormat($thread->created_at) }}</a><br/>
                    @endif
                    {{--<a href="#thread-{{ $thread->id }}">#{{ $thread_index+1 }}</a>--}}
                    @if (in_array($thread->type, [App\Thread::TYPE_CUSTOMER, App\Thread::TYPE_MESSAGE, App\Thread::TYPE_NOTE]))
                        <span class="thread-status">
                            @if ($loop->last || (!$loop->last && $thread->status != App\Thread::STATUS_NOCHANGE && $thread->status != $threads[$loop->index+1]->status))
                                @php
                                    $show_status = true;
                                @endphp
                            @else
                                @php
                                    $show_status = false;
                                @endphp
                            @endif
                            @if ($loop->last || (!$loop->last && ($thread->user_id != $threads[$loop->index+1]->user_id || $threads[$loop->index+1]->action_type == App\Thread::ACTION_TYPE_USER_CHANGED))
                            )
                                @if ($thread->user_id)
                                    @if ($thread->user_cached)
                                        {{ $thread->user_cached->getFullName() }}@if (!empty($show_status)),@endif
                                    @endif
                                @else
                                    {{ __("Anyone") }}@if (!empty($show_status)),@endif
                                @endif
                            @endif
                            @if (!empty($show_status))
                                {{ $thread->getStatusName() }}
                            @endif
                        </span>
                    @endif
					@if ( ($thread->meta['wstatus']??false) !== false)
						<div class="thread-status">{{ $thread->meta['wstatus'] }}</div>
					@endif
                </div>
				
            </div>
            @action('thread.after_header', $thread, $loop, $threads, $conversation, $mailbox)
            <div class="thread-body">
                @php
                    $send_status_data = $thread->getSendStatusData();
                @endphp
                @if ($send_status_data)
                    @if (!empty($send_status_data['is_bounce']))
                        <div class="alert alert-warning">
                            @if (empty($send_status_data['bounce_for_thread']) || empty($send_status_data['bounce_for_conversation']))
                                {{ __('This is a bounce message.') }}
                            @else
                                @php
                                    $bounce_for_conversation = App\Conversation::find($send_status_data['bounce_for_conversation']);
                                @endphp
                                @if ($bounce_for_conversation)
                                    {!! __('This is a bounce message for :link', [
                                    'link' => '<a href="'.route('conversations.view', ['id' => $send_status_data['bounce_for_conversation']]).'#thread-id='.$send_status_data['bounce_for_thread'].'">#'.$bounce_for_conversation->number.'</a>'
                                    ]) !!}
                                @endif
                            @endif
                        </div>
                    @endif
                @endif
                @if ($thread->isSendStatusError())
                        <div class="alert alert-danger alert-light">
                            <div>
                                <strong>{{ __('Message not sent to customer') }}</strong> (<a href="{{ route('conversations.ajax_html', array_merge(['action' =>
                        'send_log'], \Request::all(), ['thread_id' => $thread->id]) ) }}" data-trigger="modal" data-modal-title="{{ __("Outgoing Emails") }}" data-modal-size="lg">{{ __('View log') }}</a>)

                                @if ($thread->canRetrySend())
                                    &nbsp;<button class="btn btn-default btn-xs btn-thread-retry" data-loading-text="{{ __('Retry') }}…">{{ __('Retry') }}</button>
                                @endif
                            </div>

                            @if (!empty($send_status_data['bounced_by_thread']) && !empty($send_status_data['bounced_by_conversation']))
                                @php
                                    $bounced_by_conversation = App\Conversation::find($send_status_data['bounced_by_conversation']);
                                @endphp
                                @if ($bounced_by_conversation)
                                    <small>
                                        {!! __('Message bounced (:link)', [
                                        'link' => '<a href="'.route('conversations.view', ['id' => $send_status_data['bounced_by_conversation']]).'#thread-id='.$send_status_data['bounced_by_thread'].'">#'.$bounced_by_conversation->number.'</a>'
                                        ]) !!}
                                    </small>
                                @endif
                            @endif
                            @if (!empty($send_status_data['msg']))
                                <small>
                                    {{ $send_status_data['msg'] }}
                                </small>
                            @endif
                        </div>
                @endif
                @if ($thread->isForwarded())
                    <div class="alert alert-info">
                        {{ __('This is a forwarded conversation.') }}
                        {!! __('Original conversation: :forward_parent_conversation_number', [
                        'forward_parent_conversation_number' => '<a href="'.route('conversations.view', ['id' => $thread->getMetaFw(App\Thread::META_FORWARD_PARENT_CONVERSATION_ID)]).'#thread-'.$thread->getMetaFw(App\Thread::META_FORWARD_PARENT_THREAD_ID).'">#'.$thread->getMetaFw(App\Thread::META_FORWARD_PARENT_CONVERSATION_NUMBER).'</a>'
                        ]) !!}
                    </div>
                @endif
                @if ($thread->isForward())
                    <div class="alert alert-note">
                        {!! __(':person forwarded this conversation. Forwarded conversation: :forward_child_conversation_number', [
                        'person' => ucfirst($thread->getForwardByFullName()),
                        'forward_child_conversation_number' => '<a href="'.route('conversations.view', ['id' => $thread->getMetaFw(App\Thread::META_FORWARD_CHILD_CONVERSATION_ID)]).'">#'.$thread->getMetaFw(App\Thread::META_FORWARD_CHILD_CONVERSATION_NUMBER).'</a>'
                        ]) !!}
                    </div>
                @endif

                @action('thread.before_body', $thread, $loop, $threads, $conversation, $mailbox)

                <div class="thread-content" dir="auto">
                    {!! \Eventy::filter('thread.body_output', $thread->getBodyWithFormatedLinks(), $thread, $conversation, $mailbox) !!}
                </div>

                @if ($thread->body_original)
                    <div class='thread-meta'>
                        <i class="glyphicon glyphicon-pencil"></i> {{ __("Edited by :whom :when", ['whom' => $thread->getEditedByUserName(), 'when' => App\User::dateDiffForHumansWithHours($thread->edited_at)]) }} &nbsp;<a href="#" class="thread-original-show help-link link-underlined">{{ __("Show original") }}</a><a href="#" class="thread-original-hide help-link link-underlined hidden">{{ __("Hide") }}</a>
                        <div class="thread-original thread-text hidden">{!! $thread->getCleanBodyOriginal() !!}</div>
                    </div>
                @endif
                @if ($thread->opened_at)
                    <div class='thread-meta'><i class="glyphicon glyphicon-eye-open"></i> {{ __("Customer viewed :when", ['when' => App\User::dateDiffForHumansWithHours($thread->opened_at)]) }}</div>
                @endif

                @action('thread.meta', $thread, $loop, $threads, $conversation, $mailbox)

                @include('conversations/partials/thread_attachments')
            </div>
        </div>
        <div class="dropdown thread-options">
            <span class="dropdown-toggle {{--glyphicon glyphicon-option-vertical--}}" data-toggle="dropdown" role="button" aria-expanded="false" aria-haspopup="true"><b class="caret"></b></span>
            <ul class="dropdown-menu dropdown-menu-right" role="menu">
                @if (Auth::user()->can('edit', $thread))
                    <li><a href="#" title="" class="thread-edit-trigger" role="button">{{ __("Edit") }}</a></li>
                @endif
                @if ($thread->isNote() && !$thread->first && Auth::user()->can('delete', $thread))
                    <li><a href="#" class="thread-delete-trigger" role="button" data-loading-text="{{ __("Delete") }}…">{{ __("Delete") }}</a></li>
                @endif
                <li><a href="{{ route('conversations.create', ['mailbox_id' => $mailbox->id]) }}?from_thread_id={{ $thread->id }}" title="{{ __("Start a conversation from this thread") }}" class="new-conv" role="button">{{ __("New Conversation") }}</a></li>
                @if ($thread->isCustomerMessage())
                    <li><a href="{{ route('conversations.clone_conversation', ['mailbox_id' => $mailbox->id, 'from_thread_id' => $thread->id]) }}" title="{{ __("Clone a conversation from this thread") }}" class="new-conv" role="button">{{ __("Clone Conversation") }}</a></li>
                @endif
                @action('thread.menu', $thread)
                @if (Auth::user()->isAdmin())
                    <li><a href="{{ route('conversations.ajax_html', array_merge(['action' =>
                        'send_log'], \Request::all(), ['thread_id' => $thread->id])) }}" title="{{ __("View outgoing emails") }}" data-trigger="modal" data-modal-title="{{ __("Outgoing Emails") }}" data-modal-size="lg" role="button">{{ __("Outgoing Emails") }}</a></li>
                @endif
                @if ($thread->isReply())
                    <li><a href="{{ route('conversations.ajax_html', array_merge(['action' =>
                        'show_original'], \Request::all(), ['thread_id' => $thread->id])) }}" title="{{ __("Show original message") }}" data-trigger="modal" data-modal-title="{{ __("Original Message") }}" data-modal-fit="true" data-modal-size="lg" role="button">{{ __("Show Original") }}</a></li>
                @endif
                @if ($thread->isReply() || $thread->isNote())
                    <li><a href="{{ \Request::getRequestUri() }}&amp;print_thread_id={{ $thread->id }}&amp;print=1" target="_blank" role="button">{{ __("Print") }}</a></li>
                @endif
                @action('thread.menu.append', $thread)
            </ul>
        </div>
    </div>
@endif
