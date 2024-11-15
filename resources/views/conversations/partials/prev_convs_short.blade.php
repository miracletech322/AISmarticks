@php
	$target_blank = \Auth::user()->open_on_this_page ? '_self' : '_blank';
@endphp
<div class="conv-sidebar-block">
    <div class="panel-group accordion accordion-empty">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" href=".collapse-conv-prev">{{ __("Previous Conversations") }} 
                        <b class="caret"></b>
                    </a>
                </h4>
            </div>
            <div class="collapse-conv-prev panel-collapse collapse in">
                <div class="panel-body">
                    <div class="sidebar-block-header2"><strong>{{ __("Previous Conversations") }}</strong> (<a data-toggle="collapse" href=".collapse-conv-prev">{{ __('close') }}</a>)</div>
                    <ul class="sidebar-block-list">
                        @foreach ($prev_conversations as $prev_conversation)
                            <li>
                                <a href="{{ $prev_conversation->url() }}" target="{{ $target_blank }}" class="help-link"><i class="glyphicon @if ($prev_conversation->isPhone()) glyphicon-earphone @else glyphicon-envelope @endif"></i>{{ $prev_conversation->getSubject() }}</a>
								<?php
									$threads = $prev_conversation->threads()->orderBy('created_at', 'desc')->paginate(10);
									$i=0;
									foreach ($threads as $thread)
									{
										if ($thread->type == App\Thread::TYPE_LINEITEM)
										{
											$i++;
											if ($i==3)
											{
												echo '<div class="prev_conv_more_container"><a href="" class="prev_conv_more_extender">+</a><div class="prev_conv_more">';
											}
											echo '<div><strong>'.date('Y-m-d H:i',strtotime($thread->created_at)).' ('.$thread->getActionPerson().'):</strong> '.strip_tags($thread->getActionText('', true, false, null, view('conversations/thread_by', ['thread' => $thread])->render())).'</div>';
										}
										elseif ($thread->type == App\Thread::TYPE_MESSAGE && $thread->state == App\Thread::STATE_DRAFT)
										{
											$i++;
											if ($i==3)
											{
												echo '<div class="prev_conv_more_container"><a href="" class="prev_conv_more_extender">+</a><div class="prev_conv_more">';
											}
											echo '<div><strong>'.date('Y-m-d H:i',strtotime($thread->created_at)).' ('.$thread->getActionPerson().'):</strong> '.strip_tags($thread->getCleanBody()).'</div>';
										}
										else
										{
											$i++;
											if ($i==3)
											{
												echo '<div class="prev_conv_more_container"><a href="" class="prev_conv_more_extender">+</a><div class="prev_conv_more">';
											}
											echo '<div><strong>'.date('Y-m-d H:i',strtotime($thread->created_at)).' ('.$thread->getActionPerson().'):</strong> ';
											// .strip_tags($thread->getCleanBody()).'</div>';
											$send_status_data = $thread->getSendStatusData();
											if ($send_status_data)
											{
												if (!empty($send_status_data['is_bounce']))
												{
													if (empty($send_status_data['bounce_for_thread']) || empty($send_status_data['bounce_for_conversation']))
													{
														echo __('This is a bounce message.');
													}
													else
													{
														$bounce_for_conversation = App\Conversation::find($send_status_data['bounce_for_conversation']);
														if ($bounce_for_conversation)
														{
															echo __('This is a bounce message for :link', ['link' => '<a href="'.route('conversations.view', ['id' => $send_status_data['bounce_for_conversation']]).'#thread-id='.$send_status_data['bounce_for_thread'].'" target="{{ $target_blank }}" >#'.$bounce_for_conversation->number.'</a>']);
														}
													}
												}
											}
											if ($thread->isSendStatusError())
											{
												echo __('Message not sent to customer');
												if (!empty($send_status_data['bounced_by_thread']) && !empty($send_status_data['bounced_by_conversation']))
												{
													$bounced_by_conversation = App\Conversation::find($send_status_data['bounced_by_conversation']);
													if ($bounced_by_conversation)
													{
														echo __('Message bounced (:link)', ['link' => '<a href="'.route('conversations.view', ['id' => $send_status_data['bounced_by_conversation']]).'#thread-id='.$send_status_data['bounced_by_thread'].'" target="{{ $target_blank }}" >#'.$bounced_by_conversation->number.'</a>']);
													}
												}
												if (!empty($send_status_data['msg']))
												{
													echo strip_tags($send_status_data['msg']);
												}
											}
											if ($thread->isForwarded())
											{
												echo __('This is a forwarded conversation.');
												echo __('Original conversation: :forward_parent_conversation_number', ['forward_parent_conversation_number' => '<a href="'.route('conversations.view', ['id' => $thread->getMetaFw(App\Thread::META_FORWARD_PARENT_CONVERSATION_ID)]).'#thread-'.$thread->getMetaFw(App\Thread::META_FORWARD_PARENT_THREAD_ID).'" target="{{ $target_blank }}" >#'.$thread->getMetaFw(App\Thread::META_FORWARD_PARENT_CONVERSATION_NUMBER).'</a>']);
											}
											if ($thread->isForward())
											{
												echo __(':person forwarded this conversation. Forwarded conversation: :forward_child_conversation_number', ['person' => ucfirst($thread->getForwardByFullName()),'forward_child_conversation_number' => '<a href="'.route('conversations.view', ['id' => $thread->getMetaFw(App\Thread::META_FORWARD_CHILD_CONVERSATION_ID)]).'" target="{{ $target_blank }}" >#'.$thread->getMetaFw(App\Thread::META_FORWARD_CHILD_CONVERSATION_NUMBER).'</a>']);
											}
											echo strip_tags(\Eventy::filter('thread.body_output', $thread->getBodyWithFormatedLinks(), $thread, $conversation, $mailbox));
											echo '</div>';
										}
										// echo '<div><strong>'.date('Y-m-d H:i',strtotime($thread->created_at)).' ('.$thread->getActionPerson().'):</strong> '.strip_tags($thread->getCleanBody()).'</div>';
									}
									if ($i>=3) echo '</div><a href="" class="prev_conv_less_extender">-</a></div>';
								?>
							</li>
                        @endforeach
                    </ul>
                    @if ($prev_conversations->hasMorePages()) 
                        <a href="{{ route('customers.conversations', ['id' => $customer->id])}}" class="sidebar-block-link link-blue" target="{{ $target_blank }}" >{{ __("View all :number", ['number' => $prev_conversations->total()]) }}</a>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
<style>
	.prev_conv_more
	{
		display:none;
	}
	.prev_conv_less_extender
	{
		display:none;
	}
</style>