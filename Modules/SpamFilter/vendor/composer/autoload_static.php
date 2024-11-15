<?php

// autoload_static.php @generated by Composer

namespace Composer\Autoload;

class ComposerStaticInit5a41748400a3cd3615a3adaea123c19e
{
    public static $prefixLengthsPsr4 = array (
        'P' => 
        array (
            'PHPAntiSpam\\' => 12,
        ),
        'M' => 
        array (
            'Modules\\SpamFilter\\' => 19,
        ),
    );

    public static $prefixDirsPsr4 = array (
        'PHPAntiSpam\\' => 
        array (
            0 => __DIR__ . '/..' . '/bgruszka/phpantispam/src',
        ),
        'Modules\\SpamFilter\\' => 
        array (
            0 => __DIR__ . '/../..' . '/',
        ),
    );

    public static function getInitializer(ClassLoader $loader)
    {
        return \Closure::bind(function () use ($loader) {
            $loader->prefixLengthsPsr4 = ComposerStaticInit5a41748400a3cd3615a3adaea123c19e::$prefixLengthsPsr4;
            $loader->prefixDirsPsr4 = ComposerStaticInit5a41748400a3cd3615a3adaea123c19e::$prefixDirsPsr4;

        }, null, ClassLoader::class);
    }
}
