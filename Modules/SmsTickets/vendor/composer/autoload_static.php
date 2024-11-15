<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit5951cf272f69adb08e7424423b6fee61
{
    public static $prefixLengthsPsr4 = array (
        'T' => 
        array (
            'Twilio\\' => 7,
        ),
        'M' => 
        array (
            'Modules\\SmsTickets\\' => 19,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'Twilio\\' => 
        array (
            0 => __DIR__ . '/..' . '/twilio/sdk/src/Twilio',
        ),
        'Modules\\SmsTickets\\' => 
        array (
            0 => __DIR__ . '/../..' . '/',
        ),
    );

    public static $classMap = array (
        'Composer\\InstalledVersions' => __DIR__ . '/..' . '/composer/InstalledVersions.php',
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit5951cf272f69adb08e7424423b6fee61::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit5951cf272f69adb08e7424423b6fee61::$prefixDirsPsr4;
            $loader->classMap = ComposerStaticInit5951cf272f69adb08e7424423b6fee61::$classMap;

        }, null, ClassLoader::class);
    }
}
