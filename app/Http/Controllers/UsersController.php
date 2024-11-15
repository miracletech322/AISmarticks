<?php

namespace App\Http\Controllers;

use App\Folder;
use App\Mailbox;
use App\MailboxUser;
use App\Subscription;
use App\Thread;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Validation\Rule;
use Validator;
use App\LicenseLimit;

class UsersController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Users list.
     */
    public function users()
    {
        $this->authorize('create', 'App\User');

        $users = User::nonDeleted()->get();
        $users = User::sortUsers($users);

        return view('users/users', ['users' => $users]);
    }

    /**
     * New user.
     */
    public function create()
    {
        $this->authorize('create', 'App\User');
        $mailboxes = Mailbox::all();

        return view('users/create', ['mailboxes' => $mailboxes]);
    }

    /**
     * Create new user.
     *
     * @param \Illuminate\Http\Request $request
     */
    public function createSave(Request $request)
    {
        $invalid = false;
        $this->authorize('create', 'App\User');
        $auth_user = auth()->user();

        $rules = [
            'first_name' => 'required|string|max:20',
            'last_name'  => 'required|string|max:30',
            'email'      => 'required|string|email|max:100|unique:users',
            //'role'       => ['required', Rule::in(array_keys(User::$roles))],
        ];
        if ($auth_user->isAdmin()) {
            $rules['role'] = ['required', Rule::in(array_keys(User::$roles))];
        }
        if (empty($request->send_invite)) {
            $rules['password'] = 'required|string|max:255';
        }
        $validator = Validator::make($request->all(), $rules);

        if (User::mailboxEmailExists($request->email)) {
            $invalid = true;
            $validator->errors()->add('email', __('There is a mailbox with such email. Users and mailboxes can not have the same email addresses.'));
        }

        if ($invalid || $validator->fails()) {
            return redirect()->route('users.create')
                        ->withErrors($validator)
                        ->withInput();
        }

        $user = new User();
        $user->fill($request->all());
        if (!$auth_user->can('changeRole', $user)) {
            $user->role = User::ROLE_USER;
        }
        if (empty($request->send_invite)) {
            // Set password from request
            $user->password = Hash::make($request->password);
        } else {
            // Set some random password before sending invite
            $user->password = Hash::make($user->generateRandomPassword());
        }
        // Set system timezone.
        $user->timezone = config('app.timezone') ?: User::DEFAULT_TIMEZONE;
        $user = \Eventy::filter('user.create_save', $user, $request);

        switch ($user->role) {
            case User::ROLE_ADMIN:
                $errText = 'admins';
				$max = LicenseLimit::getLimits()->max_admin;
				if (is_null($max)) $max=2;
                $count = User::nonDeleted()->where(['role' => User::ROLE_ADMIN])->count();
                break;
            default:
                $errText = 'users';
                $max = LicenseLimit::getLimits()->max_user;
                if (is_null($max)) $max=0;
                $count = User::nonDeleted()->where(['role' => User::ROLE_USER])->count();
        }
		error_log('MAX = '.json_encode($max).' COUNT = '.json_encode($count));
        if (!empty($max) && $count >= $max) {
            \Session::flash('flash_error_floating', __("You reached the maximum $errText. Please contact the administrator"));
            return redirect()->route('users.create');
        }

        $user->save();

        $user->mailboxes()->sync($request->mailboxes ?: []);
        $user->syncPersonalFolders($request->mailboxes);

        // Send invite
        if (!empty($request->send_invite)) {
            try {
                $user->sendInvite(true);
            } catch (\Exception $e) {
                // Admin is allowed to see exceptions
                \Session::flash('flash_error_floating', $e->getMessage().' — '.__('Check mail settings in "Manage » Settings » Mail Settings"'));
            }
        }

        \Session::flash('flash_success_floating', __('User created successfully'));

        return redirect()->route('users.profile', ['id' => $user->id]);
    }

    /**
     * User profile.
     */
    public function profile($id)
    {
        $user = User::findOrFail($id);
        if ($user->isDeleted()) {
            abort(404);
        }

        $this->authorize('update', $user);

        $users = $this->getUsersForSidebar($id);

        return view('users/profile', ['user' => $user, 'users' => $users]);
    }

	public function advancedProfile($id)
    {
        $user = User::findOrFail($id);
        if ($user->isDeleted()) {
            abort(404);
        }

        $this->authorize('update', $user);

        $users = $this->getUsersForSidebar($id);

        return view('users/advanced_profile', ['user' => $user, 'users' => $users]);
    }

	public function advancedProfileSave($id, Request $request)
    {
        $invalid = false;

        $user = User::findOrFail($id);
        $this->authorize('update', $user);

        // Save language into session. And links opening settings
        if (auth()->user()->id == $id && $request->locale) {
            session()->put('user_locale', $request->locale);
        }
        
        if (auth()->user()->role == User::ROLE_ADMIN) {
            User::updateOrCreate(
                ['id' => $id],
                ['open_on_this_page' => isset($request->open_on_this_page)]
            );
        }
		
        $user->setData(['locale'=>$request->locale,'user_id'=>$id]);
        $user->save();

        \Session::flash('flash_success_floating', __('Profile saved successfully'));

        return redirect()->route('users.advanced_profile', ['id' => $id]);
    }

    public function getUsersForSidebar($except_id)
    {
        if (auth()->user()->isAdmin()) {
            return User::sortUsers(User::nonDeleted()->get());/*->except($except_id)*/;
        } else {
            return [];
        }
    }

    /**
     * Handle a registration request for the application.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function profileSave($id, Request $request)
    {
        $invalid = false;

        $user = User::findOrFail($id);
        $this->authorize('update', $user);

        // This is also present in PublicController::userSetup
        $validator = Validator::make($request->all(), [
            'first_name'  => 'required|string|max:20',
            'last_name'   => 'required|string|max:30',
            'email'       => 'required|string|email|max:100|unique:users,email,'.$id,
            //'emails'      => 'max:100',
            'job_title'   => 'max:100',
            'phone'       => 'max:60',
            'timezone'    => 'required|string|max:255',
            'time_format' => 'required',
            'role'        => ['nullable', Rule::in(array_keys(User::$roles))],
            'photo_url'   => 'nullable|image|mimes:jpeg,png,jpg,gif',
        ]);
        $validator->setAttributeNames([
            'photo_url'   => __('Photo'),
        ]);

        // Photo
        $validator->after(function ($validator) use ($user, $request) {
            if ($request->hasFile('photo_url')) {
                $path_url = $user->savePhoto($request->file('photo_url'));

                if ($path_url) {
                    $user->photo_url = $path_url;
                } else {
                    $invalid = true;
                    $validator->errors()->add('photo_url', __('Error occurred processing the image. Make sure that PHP GD extension is enabled.'));
                }
            }

            // Do not allow to remove last administrator
            if ($user->isAdmin() && isset($request->role) && $request->role != User::ROLE_ADMIN) {
                $admins_count = User::where('role', User::ROLE_ADMIN)->count();
                if ($admins_count < 2) {
                    $invalid = true;
                    $validator->errors()->add('role', __('Role of the only one administrator can not be changed.'));
                }
            }
        });
		// Do not allow to add more then limited amount of administrators
		if (isset($request->role) && $request->role == User::ROLE_ADMIN && $request->role!=$user->role) {
			$admins_count = User::where('role', User::ROLE_ADMIN)->where('status',1)->count();
			$admins_limit = LicenseLimit::where(['id' => 1])->get()->toArray()[0]['max_admin'];
        	if ($admins_count >= $admins_limit) {
				$invalid = true;
				$validator->errors()->add('role', __('You reached the maximum administrators amount. Please contact the administrator'));
			}
		}
		if (isset($request->role) && $request->role == User::ROLE_USER && $request->role!=$user->role) {
			$users_count = User::where('role', User::ROLE_USER)->where('status',1)->count();
			$users_limit = LicenseLimit::where(['id' => 1])->get()->toArray()[0]['max_user'];
        	if ($users_count >= $users_limit) {
				$invalid = true;
				$validator->errors()->add('role', __('You reached the maximum users amount. Please contact the administrator'));
			}
		}
		//when enable disabled user - check limits
		if (empty($request_data['disabled'])) if ($user->status!=User::STATUS_ACTIVE)
		{
			if (isset($request->role))
			{
				if ($request->role == User::ROLE_ADMIN) 
				{
					$admins_count = User::where('role', User::ROLE_ADMIN)->where('status',1)->count();
					$admins_limit = LicenseLimit::where(['id' => 1])->get()->toArray()[0]['max_admin'];
					if ($admins_count >= $admins_limit) {
						$invalid = true;
						$validator->errors()->add('role', __('You reached the maximum administrators amount. Please contact the administrator'));
					}
				}
				else if ($request->role == User::ROLE_USER) 
				{
					$users_count = User::where('role', User::ROLE_USER)->where('status',1)->count();
					$users_limit = LicenseLimit::where(['id' => 1])->get()->toArray()[0]['max_user'];
					if ($users_count >= $users_limit) {
						$invalid = true;
						$validator->errors()->add('role', __('You reached the maximum users amount. Please contact the administrator'));
					}
				}
			}
			else
			{
				if ($user->role == User::ROLE_ADMIN) 
				{
					$admins_count = User::where('role', User::ROLE_ADMIN)->where('status',1)->count();
					$admins_limit = LicenseLimit::where(['id' => 1])->get()->toArray()[0]['max_admin'];
					if ($admins_count >= $admins_limit) {
						$invalid = true;
						$validator->errors()->add('role', __('You reached the maximum administrators amount. Please contact the administrator'));
					}
				}
				else if ($user->role == User::ROLE_USER) 
				{
					$users_count = User::where('role', User::ROLE_USER)->where('status',1)->count();
					$users_limit = LicenseLimit::where(['id' => 1])->get()->toArray()[0]['max_user'];
					if ($users_count >= $users_limit) {
						$invalid = true;
						$validator->errors()->add('role', __('You reached the maximum users amount. Please contact the administrator'));
					}
				}
			}
		}

        if (User::mailboxEmailExists($request->email)) {
            $invalid = true;
            $validator->errors()->add('email', __('There is a mailbox with such email. Users and mailboxes can not have the same email addresses.'));
        }

        if ($invalid || $validator->fails()) {
            return redirect()->route('users.profile', ['id' => $id])
                        ->withErrors($validator)
                        ->withInput();
        }

        // Save language into session.
        // if (auth()->user()->id == $id && $request->locale) {
        //     session()->put('user_locale', $request->locale);
        // }

        $request_data = $request->all();

        if (isset($request_data['photo_url'])) {
            unset($request_data['photo_url']);
        }
        if (!auth()->user()->can('changeRole', $user)) {
            unset($request_data['role']);
        }
        if ($user->status != User::STATUS_DELETED) {
            if (!empty($request_data['disabled'])) {
                $request_data['status'] = User::STATUS_DISABLED;
            } else {
				$request_data['status'] = User::STATUS_ACTIVE;
			}
        }
        $user->setData($request_data);

        if (empty($request->input('enable_kb_shortcuts'))) {
            $user->enable_kb_shortcuts = false;
        }

        $user = \Eventy::filter('user.save_profile', $user, $request);

        $user->save();

        \Session::flash('flash_success_floating', __('Profile saved successfully'));

        return redirect()->route('users.profile', ['id' => $id]);
    }

    /**
     * User permissions.
     */
    public function permissions($id)
    {
        $user = auth()->user();
        if (!$user->isAdmin()) {
            abort(403);
        }

        $user = User::findOrFail($id);

        if ($user->isDeleted()) {
            abort(404);
        }

        $mailboxes = Mailbox::all();

        $users = $this->getUsersForSidebar($id);

		$qa = MailboxUser::where('user_id',$id)->get();
		$mailbox_users=[];
		foreach ($qa as $q) $mailbox_users[$q->mailbox_id]=['only_unassigned'=>$q->only_unassigned,'only_team'=>$q->only_team];
		
        return view('users/permissions', [
            'user'           => $user,
            'mailboxes'      => $mailboxes,
            'user_mailboxes' => $user->mailboxes,
            'users'          => $users,
			'mailbox_users'  => $mailbox_users,
        ]);
    }

    /**
     * Save user permissions.
     *
     * @param int                      $id
     * @param \Illuminate\Http\Request $request
     */
    public function permissionsSave($id, Request $request)
    {
        $user = auth()->user();
        if (!$user->isAdmin()) {
            abort(403);
        }

        $user = User::findOrFail($id);

        $user->mailboxes()->sync($request->mailboxes ?: []);
        $user->syncPersonalFolders($request->mailboxes);

        // Save permissions.
        $user_permissions = $request->user_permissions ?? [];
        $permissions = [];

        foreach (User::getUserPermissionsList() as $permission_id) {
            $new_has_permission = in_array($permission_id, $user_permissions);

            if ($user->hasPermission($permission_id, false) != $new_has_permission) {
                $permissions[$permission_id] = (int)(bool)$new_has_permission;
                $save_user = true;
            }
        }
        $user->permissions = $permissions;
        $user->save();
		if (!isset($request->mailboxes_only_team)) $request->mailboxes_only_team=[];
		if (!isset($request->mailboxes_only_unassigned)) $request->mailboxes_only_unassigned=[];
		$qa = MailboxUser::where('user_id',$id)->get();
		$mailbox_users=[];
		foreach ($qa as $q) 
		{
			$q->only_team=(in_array($q->mailbox_id,$request->mailboxes_only_team))?1:0;
			$q->only_unassigned=(in_array($q->mailbox_id,$request->mailboxes_only_unassigned))?1:0;
			$q->save();
		}
		foreach ($request->mailboxes as $mailbox_id)
		{
			$mailbox_user = $user->mailboxesWithSettings()->where('mailbox_id', $mailbox_id)->first();
			if (!$mailbox_user) {
				// Admin may not be connected to the mailbox yet
				$user->mailboxes()->attach($id);
				$mailbox_user = $user->mailboxesWithSettings()->where('mailbox_id', $mailbox_id)->first();
			}
			$mailbox_user->settings->only_team = (in_array($mailbox_id,$request->mailboxes_only_team) ? true : false);
			$mailbox_user->settings->only_unassigned = (in_array($mailbox_id,$request->mailboxes_only_unassigned) ? true : false);
			$mailbox_user->settings->save();
		}

        \Session::flash('flash_success_floating', __('Permissions saved successfully'));

        return redirect()->route('users.permissions', ['id' => $id]);
    }

    /**
     * User notifications settings.
     */
    public function notifications($id)
    {
        $user = User::findOrFail($id);
        $this->authorize('update', $user);

        if ($user->isDeleted()) {
            abort(404);
        }
        
        $subscriptions = $user->subscriptions()->select('medium', 'event')->get();

        $person = '';
        if ($id != auth()->user()->id) {
            $person = $user->getFirstName(true);
        }

        $users = $this->getUsersForSidebar($id);

        return view('users/notifications', [
            'user'          => $user,
            'subscriptions' => $subscriptions,
            'person'        => $person,
            'users'         => $users,
            'mobile_available' => \Eventy::filter('notifications.mobile_available', false),
        ]);
    }

    /**
     * Save user notifications settings.
     *
     * @param int                      $id
     * @param \Illuminate\Http\Request $request
     */
    public function notificationsSave($id, Request $request)
    {
        $user = User::findOrFail($id);
        $this->authorize('update', $user);

        Subscription::saveFromArray($request->subscriptions, $user->id);

        \Session::flash('flash_success_floating', __('Notifications saved successfully'));

        return redirect()->route('users.notifications', ['id' => $id]);
    }

    /**
     * Users ajax controller.
     */
    public function ajax(Request $request)
    {
        $response = [
            'status' => 'error',
            'msg'    => '', // this is error message
        ];

        $auth_user = auth()->user();

        switch ($request->action) {

            // Both send and resend
            case 'send_invite':
                if (!$auth_user->isAdmin()) {
                    $response['msg'] = __('Not enough permissions');
                }
                if (empty($request->user_id)) {
                    $response['msg'] = __('Incorrect user');
                }
                if (!$response['msg']) {
                    $user = User::find($request->user_id);
                    if (!$user) {
                        $response['msg'] = __('User not found');
                    } elseif ($user->invite_state == User::INVITE_STATE_ACTIVATED) {
                        $response['msg'] = __('User already accepted invitation');
                    }
                }

                if (!$response['msg']) {
                    try {
                        $user->sendInvite(true);

                        $response['status'] = 'success';
                    } catch (\Exception $e) {
                        // Admin is allowed to see exceptions.
                        $response['msg'] = $e->getMessage().' — '.__('Check mail settings in "Manage » Settings » Mail Settings"');
                    }
                }
                break;

            // Reset password
            case 'reset_password':
                if (!auth()->user()->isAdmin()) {
                    $response['msg'] = __('Not enough permissions');
                }
                if (empty($request->user_id)) {
                    $response['msg'] = __('Incorrect user');
                }
                if (!$response['msg']) {
                    $user = User::find($request->user_id);
                    if (!$user) {
                        $response['msg'] = __('User not found');
                    }
                }

                if (!$response['msg']) {
                    $reset_result = Password::broker()->sendResetLink(
                        //['id' => $request->user_id]
                        ['id' => $request->user_id]
                    );

                    if ($reset_result == Password::RESET_LINK_SENT) {
                        $response['status'] = 'success';
                        $response['msg_success'] = __('Password reset email has been sent');
                    }
                }
                break;

            // Load website notifications
            case 'web_notifications':
                if (!$auth_user) {
                    $response['msg'] = __('You are not logged in');
                }
                if (!$response['msg']) {
                    $web_notifications_info = $auth_user->getWebsiteNotificationsInfo(false);
                    $response['html'] = view('users/partials/web_notifications', [
                        'web_notifications_info_data' => $web_notifications_info['data'],
                    ])->render();

                    $response['has_more_pages'] = (int) $web_notifications_info['notifications']->hasMorePages();

                    $response['status'] = 'success';
                }
                break;

            // Mark all user website notifications as read
            case 'mark_notifications_as_read':
                if (!$auth_user) {
                    $response['msg'] = __('You are not logged in');
                }
                if (!$response['msg']) {
                    $auth_user->unreadNotifications()->update(['read_at' => now()]);
                    $auth_user->clearWebsiteNotificationsCache();

                    $response['status'] = 'success';
                }
                break;

            // Delete user photo
            case 'delete_photo':
                $user = User::find($request->user_id);

                if (!$user) {
                    $response['msg'] = __('User not found');
                } elseif (!$auth_user->can('update', $user)) {
                    $response['msg'] = __('Not enough permissions');
                }
                if (!$response['msg']) {
                    $user->removePhoto();
                    $user->save();

                    $response['status'] = 'success';
                }
                break;

            // Delete user
            case 'delete_user':
                $user = User::find($request->user_id);

                if (!$user) {
                    $response['msg'] = __('User not found');
                } elseif (!$auth_user->can('delete', $user)) {
                    $response['msg'] = __('Not enough permissions');
                }

                // Check if the user is the only one admin
                if (!$response['msg'] && $user->isAdmin()) {
                    $admins_count = User::where('role', User::ROLE_ADMIN)->count();
                    if ($admins_count < 2) {
                        $response['msg'] = __('Administrator can not be deleted');
                    }
                }

                if (!$response['msg']) {

                    $user->deleteUser($auth_user, $request->assign_user);

                    \Session::flash('flash_success_floating', __('User deleted').': '.$user->getFullName());

                    $response['status'] = 'success';
                }
                break;

			// Change user language
			case 'change_locale':
				if ($request->locale) {
					session()->put('user_locale', $request->locale);
					auth()->user()->setData(['locale'=>$request->locale,'user_id'=>auth()->user()->user_id]);
					auth()->user()->save();
					$response['status'] = 'success';
				}
				break;

            default:
                $response['msg'] = 'Unknown action';
                break;
        }

        if ($response['status'] == 'error' && empty($response['msg'])) {
            $response['msg'] = 'Unknown error occurred';
        }

        return \Response::json($response);
    }

    /**
     * Change user password.
     */
    public function password($id)
    {
        $user = User::findOrFail($id);
        $this->authorize('update', $user);

        $users = User::all()->except($id);

        return view('users/password', ['user' => $user, 'users' => $users]);
    }

    /**
     * Save changed user password.
     *
     * @param \Illuminate\Http\Request $request
     *
     * @return \Illuminate\Http\Response
     */
    public function passwordSave($id, Request $request)
    {
        // It is allowed to edit only your own password
        $user = auth()->user();
        if ($user->id != $id) {
            abort(403);
        }

        // This is also present in PublicController::userSetup
        $validator = Validator::make($request->all(), [
            'password_current' => 'required|string',
            'password'         => 'required|string|min:8|confirmed',
        ]);

        $validator->after(function ($validator) use ($user, $request) {
            // Check current password
            if (!Hash::check($request->password_current, $user->password)) {
                $validator->errors()->add('password_current', __('This password is incorrect.'));
            } elseif (Hash::check($request->password, $user->password)) {
                // Check new password
                $validator->errors()->add('password', __('The new password is the same as the old password.'));
            }
        });

        if ($validator->fails()) {
            return redirect()->route('users.password', ['id' => $id])
                        ->withErrors($validator)
                        ->withInput();
        }

        $user->password = bcrypt($request->password);
        $user->save();

        $user->sendPasswordChanged();

        \Session::flash('flash_success_floating', __('Password saved successfully!'));

        return redirect()->route('users.profile', ['id' => $id]);
    }
}
