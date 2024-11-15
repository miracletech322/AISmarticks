<?php

return [
    'name' => 'Telegram',
    'options' => [
        'events' => [
        	'default' => [
        		'conversation.created',
        		'conversation.assigned',
        		'conversation.customer_replied',
        		'conversation.user_replied',
        	]
        ],
    ],
];
