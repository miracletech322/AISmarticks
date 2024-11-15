<?php
namespace App;

use Illuminate\Database\Eloquent\Model;

class LicenseLimit extends Model
{
    protected $fillable = ['email', 'mailbox', 'max_admin', 'max_user', 'workflow'];
    public $timestamps = false;

    public static function getLimits()
    {
        $limits = self::where(['id' => 1])->first();
        if (empty($limits))
		{
			LicenseLimit::updateOrCreate(['id' => 1], ['email' => '', 'mailbox' => 0, 'max_admin' => 2, 'max_user' => 0, 'workflow' => 0]);
			$limits = self::where(['id' => 1])->first();
        }
		return $limits;
    }
}