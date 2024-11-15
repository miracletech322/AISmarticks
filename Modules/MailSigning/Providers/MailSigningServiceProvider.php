<?php

namespace Modules\MailSigning\Providers;

use App\Mailbox;
use Illuminate\Support\ServiceProvider;
use Illuminate\Database\Eloquent\Factory;
use Illuminate\Support\Facades\Storage;

define('MAIL_SIGNING_MODULE', 'mailsigning');

class MailSigningServiceProvider extends ServiceProvider
{
    const PROTOCOL_SMIME = 'smime';
    const PROTOCOL_PGP = 'pgp';

    const MODE_SIGN = 'sign';
    const MODE_SIGN_ENCRYPT = 'sign_encrypt';

    const FILES_FOLDER = 'mailsigning';
    const STORAGE_DISK = 'private';

    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Boot the application events.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerConfig();
        $this->registerViews();
        $this->registerFactories();
        $this->loadMigrationsFrom(__DIR__ . '/../Database/Migrations');
        $this->hooks();
    }

    /**
     * Module hooks.
     */
    public function hooks()
    {
        // Add module's JS file to the application layout.
        \Eventy::addFilter('javascripts', function($javascripts) {
            //$javascripts[] = \Module::getPublicPath(CUST_MODULE).'/js/laroute.js';
            $javascripts[] = \Module::getPublicPath(MAIL_SIGNING_MODULE).'/js/module.js';
            return $javascripts;
        });

        // Add item to the mailbox menu
        \Eventy::addAction('mailboxes.settings.menu', function($mailbox) {
            if (auth()->user()->isAdmin()) {
                echo \View::make('mailsigning::partials/settings_menu', ['mailbox' => $mailbox])->render();
            }
        }, 100);

        \Eventy::addFilter('menu.selected', function($menu) {
            $menu['mailsigning'] = [
                'mailboxes.mailsigning.settings',
            ];
            return $menu;
        });

        \Eventy::addFilter('mail.process_swift_message', function($can_send, $message) {
            if (!$can_send) {
                return $can_send;
            }

            // Get mailbox by sender.
            $from = $message->getFrom();
            if (count($from) != 1) {
                return true;
            }
            $mailbox_email = array_keys($from)[0];
            if (!strstr($mailbox_email, '@')) {
                return true;
            }
            $mailbox_name = $from[$mailbox_email];

            $mailbox = Mailbox::where('email', $mailbox_email)->first();
            if (!$mailbox) {
                return true;
            }
            
            if (!self::isSigningActive($mailbox) && !self::isEncriptionActive($mailbox)) {
                return true;
            }

            $settings = \MailSigning::getSettings($mailbox);

            $do_encrypt = false;

            if (self::isEncriptionActive($mailbox) && $settings['mode'] == self::MODE_SIGN_ENCRYPT) {
                $do_encrypt = true;
            }

            if ($do_encrypt) {
                $headers = $message->getHeaders();

                $mail_type_header = $headers->get('X-FreeScout-Mail-Type');

                if (!$mail_type_header) {
                    $do_encrypt = false;
                } else {
                    $mail_type = $mail_type_header->getFieldBody();
                    if ($mail_type == 'test.mailbox') {
                        // Do nothing.
                    } else {
                        if ($settings['encrypt'] == 'customer' && $mail_type != 'customer.message') {
                            $do_encrypt = false;
                        }
                        if ($settings['encrypt'] == 'customer_user' && !in_array($mail_type,['customer.message', 'user.notification'])) {
                            $do_encrypt = false;
                        }
                    }
                }
            }

            if ($settings['protocol'] == self::PROTOCOL_SMIME) {
                
                $smime_signer = new \Swift_Signers_SMimeSigner();
                
                // Sign.
                if (self::isSigningActive($mailbox)) {
                    
                    if ($settings['smime_pass']) {
                        $smime_signer->setSignCertificate(self::getFilePath($mailbox, $settings['smime_cert']), [self::getFilePath($mailbox, $settings['smime_key']), $settings['smime_pass']]);
                    } else {
                        $smime_signer->setSignCertificate(self::getFilePath($mailbox, $settings['smime_cert']), self::getFilePath($mailbox, $settings['smime_key']));
                    }
                }

                // Encrypt.
                if ($do_encrypt) {
                    $smime_signer->setEncryptCertificate(self::getFilePath($mailbox, $settings['smime_encrypt_cert']));
                }

                $message->attachSigner($smime_signer);
                
            } else {

                $openpgp_signer = \Modules\MailSigning\Lib\SwiftSignersOpenPgpSigner::newInstance($settings['pgp_email'], $recipientKeys = array(), $settings['pgp_path']);

                $openpgp_signer->setGnupgHome($settings['pgp_path']);
                $openpgp_signer->addSignature($settings['pgp_email'], $settings['pgp_pass']);

                $openpgp_signer->setEncrypt($do_encrypt);

                $message->attachSigner($openpgp_signer);
            }
            return true;
        }, 20, 2);
    }

    public static function getSettings($mailbox)
    {
        $settings = $mailbox->meta[MAIL_SIGNING_MODULE] ?? [];

        $settings['protocol'] = $settings['protocol'] ?? self::PROTOCOL_SMIME;
        $settings['mode'] = $settings['mode'] ?? self::MODE_SIGN;
        $settings['smime_cert'] = $settings['smime_cert'] ?? '';
        $settings['smime_key'] = $settings['smime_key'] ?? '';
        $settings['smime_pass'] = $settings['smime_pass'] ?? '';
        $settings['smime_encrypt_cert'] = $settings['smime_encrypt_cert'] ?? '';
        $settings['encrypt'] = $settings['encrypt'] ?? 'customer';
        $settings['pgp_path'] = $settings['pgp_path'] ?? '';
        $settings['pgp_email'] = $settings['pgp_email'] ?? '';
        $settings['pgp_pass'] = $settings['pgp_pass'] ?? '';
        
        $settings['test_email'] = $settings['test_email'] ?? '';

        return $settings;
    }

    public static function isSigningActive($mailbox)
    {
        $settings = self::getSettings($mailbox);

        if ($settings['protocol'] == self::PROTOCOL_SMIME) {
            if ($settings['smime_cert'] && $settings['smime_key']) {
                return true;
            }
        } else {
            if ($settings['pgp_path'] && $settings['pgp_email']) {
                return true;
            }
        }

        return false;
    }

    public static function isEncriptionActive($mailbox)
    {
        $settings = self::getSettings($mailbox);

        if ($settings['mode'] != \MailSigning::MODE_SIGN_ENCRYPT) {
            return false;
        }

        if ($settings['protocol'] == self::PROTOCOL_SMIME) {
            if ($settings['smime_encrypt_cert']) {
                return true;
            }
        } else {
            if ($settings['pgp_path'] && $settings['pgp_email']) {
                return true;
            }
        }

        return false;
    }

    public static function saveFile($mailbox, $uploaded_file, $file_name)
    {
        return $uploaded_file->storeAs(self::FILES_FOLDER.DIRECTORY_SEPARATOR.$mailbox->id, $file_name, ['disk' => self::STORAGE_DISK]);
    }

    public static function deleteFile($mailbox, $file_name)
    {
        return Storage::disk(self::STORAGE_DISK)->delete(self::FILES_FOLDER.DIRECTORY_SEPARATOR.$mailbox->id.DIRECTORY_SEPARATOR.$file_name);
    }

    public static function getFilePath($mailbox, $file_name)
    {
        return Storage::disk(self::STORAGE_DISK)->path(self::FILES_FOLDER.DIRECTORY_SEPARATOR.$mailbox->id.DIRECTORY_SEPARATOR.$file_name);
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        $this->registerTranslations();
    }

    /**
     * Register config.
     *
     * @return void
     */
    protected function registerConfig()
    {
        $this->publishes([
            __DIR__.'/../Config/config.php' => config_path('mailsigning.php'),
        ], 'config');
        $this->mergeConfigFrom(
            __DIR__.'/../Config/config.php', 'mailsigning'
        );
    }

    /**
     * Register views.
     *
     * @return void
     */
    public function registerViews()
    {
        $viewPath = resource_path('views/modules/mailsigning');

        $sourcePath = __DIR__.'/../Resources/views';

        $this->publishes([
            $sourcePath => $viewPath
        ],'views');

        $this->loadViewsFrom(array_merge(array_map(function ($path) {
            return $path . '/modules/mailsigning';
        }, \Config::get('view.paths')), [$sourcePath]), 'mailsigning');
    }

    /**
     * Register translations.
     *
     * @return void
     */
    public function registerTranslations()
    {
        $this->loadJsonTranslationsFrom(__DIR__ .'/../Resources/lang');
    }

    /**
     * Register an additional directory of factories.
     * @source https://github.com/sebastiaanluca/laravel-resource-flow/blob/develop/src/Modules/ModuleServiceProvider.php#L66
     */
    public function registerFactories()
    {
        if (! app()->environment('production')) {
            app(Factory::class)->load(__DIR__ . '/../Database/factories');
        }
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return [];
    }
}
