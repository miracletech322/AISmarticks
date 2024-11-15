<?php

namespace Modules\Edd\Http\Controllers;

use App\Mailbox;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

class EddController extends Controller
{
    /**
     * Edit ratings.
     * @return Response
     */
    public function mailboxSettings($id)
    {
        $mailbox = Mailbox::findOrFail($id);

        $settings = \Edd::getMailboxEddSettings($mailbox);

        return view('edd::mailbox_settings', [
            'settings' => [
                'edd.url' => $settings['url'] ?? '',
                'edd.key' => $settings['key'] ?? '',
                'edd.token' => $settings['token'] ?? '',
                //'edd.version' => $settings['version'] ?? '',
            ],
            'mailbox' => $mailbox
        ]);
    }

    public function mailboxSettingsSave($id, Request $request)
    {
        $mailbox = Mailbox::findOrFail($id);

        $settings = $request->settings ?: [];

        if (!empty($settings)) {
            foreach ($settings as $key => $value) {
                $settings[str_replace('edd.', '', $key)] = $value;
                unset($settings[$key]);
            }
        }

        $mailbox->setMetaParam('edd', $settings);
        $mailbox->save();

        if (!empty($settings['url']) && !empty($settings['key']) && !empty($settings['token'])) {
            // Check API credentials.
            $result = \Edd::apiGetOrders('test@example.org', $mailbox);

            if (!empty($result['error'])) {
                \Session::flash('flash_error', __('Error occurred connecting to the API').': '.$result['error']);
            } else {
                \Session::flash('flash_success', __('Successfully connected to the API.'));
            }
        } else {
            \Session::flash('flash_success_floating', __('Settings updated'));
        }

        return redirect()->route('mailboxes.edd', ['id' => $id]);
    }

    /**
     * Ajax controller.
     */
    public function ajax(Request $request)
    {
        $response = [
            'status' => 'error',
            'msg'    => '', // this is error message
        ];

        switch ($request->action) {

            case 'orders':
                $response['html'] = '';

                $mailbox = null;
                if ($request->mailbox_id) {
                    $mailbox = Mailbox::find($request->mailbox_id);
                }

                $mailbox_api_enabled = \Edd::isMailboxApiEnabled($mailbox);
                $orders = [];
                
                if (\Edd::isApiEnabled() || $mailbox_api_enabled) {

                    $result = \Edd::apiGetOrders($request->customer_email, $mailbox);

                    if (!empty($result['error'])) {
                        \Log::error('[Edd] '.$result['error']);
                    } elseif (is_array($result['data'])) {
                        $orders = $result['data'];

                        // Cache orders for an hour.
                        $cache_key = 'edd_orders_'.$request->customer_email;
                        if ($mailbox_api_enabled) {
                            $cache_key = 'edd_orders_'.$request->mailbox_id.'_'.$request->customer_email;
                        }

                        \Cache::put($cache_key, $orders, now()->addMinutes(60));
                    }
                }
                $response['html'] = \View::make('edd::partials/orders_list', [
                    'orders'         => $orders,
                    'customer_email' => $request->customer_email,
                    'load'           => false,
                    'url'            => \Edd::getSanitizedUrl('', $mailbox),
                ])->render();

                $response['status'] = 'success';
                break;

            default:
                $response['msg'] = 'Unknown action';
                break;
        }

        if ($response['status'] == 'error' && empty($response['msg'])) {
            $response['msg'] = 'Unknown error occured';
        }

        return \Response::json($response);
    }
}
