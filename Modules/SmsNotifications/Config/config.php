<?php

return [
    'name' => 'SmsNotifications',
    'system' => env('SMSNOTIFICATIONS_SYSTEM', ''),
    'twilio_sid' => env('SMSNOTIFICATIONS_TWILIO_SID', ''),
    'twilio_token' => env('SMSNOTIFICATIONS_TWILIO_TOKEN', ''),
    'twilio_phone_number' => env('SMSNOTIFICATIONS_TWILIO_PHONE_NUMBER', ''),
    'api_key' => env('SMSNOTIFICATIONS_API_KEY', ''),
    'phone_number' => env('SMSNOTIFICATIONS_PHONE_NUMBER', ''),
];
