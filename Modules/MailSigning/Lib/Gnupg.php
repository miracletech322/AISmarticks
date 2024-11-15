<?php

namespace Modules\MailSigning\Lib;

class Gnupg
{
    protected $res;

    public function __construct()
    {
        $this->res = gnupg_init();
    }

    public function __call($method, $args) {

        $function = "gnupg_".$method;

        if (function_exists($function)) {

            array_unshift($args, $this->res);
            return call_user_func_array($function, $args);
        }

        return null;
    }
}