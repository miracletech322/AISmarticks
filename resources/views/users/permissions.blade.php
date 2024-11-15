@extends('layouts.app')

@section('title_full', __('User Permissions').' - '.$user->first_name.' '.$user->last_name)

@section('sidebar')
    @include('partials/sidebar_menu_toggle')
    @include('users/sidebar_menu')
@endsection

@section('content')
    <div class="section-heading">
        {{ __('Permissions') }}
    </div>

    @include('partials/flash_messages')

    <div class="container form-container">
        <div class="row">

            <form method="POST" action="">

                {{ csrf_field() }}

                @if (count($mailboxes))
                    <div class="col-xs-12">
                        <h3> {{ __(':first_name has access to the selected mailboxes:', ['first_name' => $user->first_name]) }}</h3>
                    </div>
                    <div class="col-xs-12">

                        <p><a href="#" class="sel-all">{{ __('all') }}</a> / <a href="#" class="sel-none">{{ __('none') }}</a></p>

                        <fieldset id="permissions-fields">
                            @foreach ($mailboxes as $mailbox)
                                <div class="control-group">
                                    <div class="controls">
                                        <label class="control-label checkbox" for="mailbox-{{ $mailbox->id }}">
                                            <input type="checkbox" name="mailboxes[]" id="mailbox-{{ $mailbox->id }}" value="{{ $mailbox->id }}" @if ($user_mailboxes->contains($mailbox)) checked="checked" @endif> {{ $mailbox->name }}
                                        </label> &nbsp;
									</div>
								</div>
								<div class="control-group">
                                    <div class="controls">
                                		<label class="control-label checkbox" for="mailbox-only-team-{{ $mailbox->id }}">
                                            <input type="checkbox" name="mailboxes_only_team[]" id="mailbox-only-team-{{ $mailbox->id }}" value="{{ $mailbox->id }}" @if (isset($mailbox_users[$mailbox->id])) @if ($mailbox_users[$mailbox->id]['only_team']==1) @if (!$user->isAdmin()) checked="checked" @endif @endif @endif @if ($user->isAdmin()) disabled @endif > Only team
                                        </label> &nbsp;
										</div>
								</div>
								<div class="control-group">
                                    <div class="controls">
                                		<label class="control-label checkbox" for="mailbox-only-unassigned-{{ $mailbox->id }}">
                                            <input type="checkbox" name="mailboxes_only_unassigned[]" id="mailbox-only-unassigned-{{ $mailbox->id }}" value="{{ $mailbox->id }}" @if (isset($mailbox_users[$mailbox->id])) @if ($mailbox_users[$mailbox->id]['only_unassigned']==1) @if (!$user->isAdmin()) checked="checked" @endif @endif @endif @if ($user->isAdmin()) disabled @endif > Only unassigned
                                        </label> &nbsp;
                                    </div>
                                </div>
								<br/>
                            @endforeach
                        </fieldset>
                        @if ($user->isAdmin())
                            <div class="form-group margin-top">
                                
                                <button type="submit" class="btn btn-primary">
                                    {{ __('Save Permissions') }}
                                </button>
                            
                            </div>
                        @endif
                    </div>
                @endif

                @if (!$user->isAdmin())
                    <div class="col-xs-12 margin-top">
                        <h3> {{ __('User Permissions') }}</h3>
                    </div>
                    <div class="col-xs-12">

                        @foreach (App\User::getUserPermissionsList() as $permission_id)
                            <div class="control-group">
                                <label class="checkbox" for="user_permission_{{ $permission_id }}">
                                    <input type="checkbox" name="user_permissions[]" value="{{ $permission_id }}" id="user_permission_{{ $permission_id }}" @if ($user->hasPermission($permission_id)) checked="checked" @endif> @if ($user->hasPermission($permission_id, false) != $user->hasPermission($permission_id)) <span style="font-weight:bold">@else<span class="text-help">@endif{{ App\User::getUserPermissionName($permission_id) }}</span>
                                </label>
                            </div>
                        @endforeach

                        <div class="form-group margin-top">
                            
                            <button type="submit" class="btn btn-primary">
                                {{ __('Save Permissions') }}
                            </button>
                        
                        </div>
                    </div>
                @endif

            </form>
        </div>
    </div>
@endsection

@section('javascript')
    @parent
    permissionsInit();
@endsection