<?php

namespace Modules\MailSigning\Http\Controllers;

use App\Mailbox;
use Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;

class MailSigningController extends Controller
{
    /**
     * Settings.
     */
    public function settings($mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);
        
        if (!auth()->user()->isAdmin()) {
            \Helper::denyAccess();
        }

        $settings = \MailSigning::getSettings($mailbox);

        if ($settings['protocol'] == \MailSigning::PROTOCOL_PGP) {
            if (!extension_loaded('gnupg')) {
                \Session::flash('flash_error', __('GnuPG PHP extension is missing.'));
            }
        }

        return view('mailsigning::settings', [
            'mailbox'   => $mailbox,
            'settings'   => $settings,
        ]);
    }

    /**
     * Settings save.
     */
    public function settingsSave(Request $request, $mailbox_id)
    {
        $mailbox = Mailbox::findOrFail($mailbox_id);

        $validator = Validator::make($request->all(), []);
        
        if (!empty($request->delete_file)) {
            $file_name = $request->delete_file;
            try {
                \MailSigning::deleteFile($mailbox, $file_name.'.pem');

                $settings[$file_name] = '';

                $mailbox->setMetaParam(MAIL_SIGNING_MODULE, $settings);
                $mailbox->save();

            } catch (\Exception $e) {
                $validator->errors()->add('settings['.$file_name.']', $e->getMessage());
            }
            return redirect()->route('mailboxes.mailsigning.settings', ['mailbox_id' => $mailbox_id])
                ->withErrors($validator)
                ->withInput();
        }

        $settings = $request->settings;
        $prev_settings = \MailSigning::getSettings($mailbox);

        // All .pem
        $files = [
            'smime_cert',
            'smime_key',
            'smime_encrypt_cert',
        ];

        foreach ($files as $file_name) {
            $file = $request->file('settings')[$file_name] ?? null;
            if ($file) {
                try {
                    \MailSigning::saveFile($mailbox, $file, $file_name.'.pem');

                    $settings[$file_name] = $file_name.'.pem';
                    
                } catch (\Exception $e) {
                    $validator->errors()->add('settings['.$file_name.']', $e->getMessage());
                }
            } else {
                $settings[$file_name] = $prev_settings[$file_name];
            }
        }

        $mailbox->setMetaParam(MAIL_SIGNING_MODULE, $settings);
        $mailbox->save();

        \Session::flash('flash_success_floating', __('Settings updated'));

        return redirect()->route('mailboxes.mailsigning.settings', ['mailbox_id' => $mailbox_id])
            ->withErrors($validator)
            ->withInput();
    }
}
