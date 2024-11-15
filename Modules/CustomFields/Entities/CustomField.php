<?php

namespace Modules\CustomFields\Entities;

use Illuminate\Database\Eloquent\Model;
use Watson\Rememberable\Rememberable;

class CustomField extends Model
{
    use Rememberable;

    public static $search_custom_fields = [];

    // This is obligatory.
    public $rememberCacheDriver = 'array';

    const NAME_PREFIX       = 'ccf_';

    // Also mentioned in module.js.
    const MULTISELECT_DELIMITER = ',';

	const TYPE_DROPDOWN   = 1;
	const TYPE_SINGLE_LINE = 2;
	const TYPE_MULTI_LINE = 3;
	const TYPE_NUMBER     = 4;
	const TYPE_DATE       = 5;
    const TYPE_MULTISELECT = 7;
    const TYPE_DROPDOWN_MULTISELECT = 8;
	
	public static $types = [
		self::TYPE_DROPDOWN   => 'Dropdown',
		self::TYPE_SINGLE_LINE => 'Single Line',
        self::TYPE_MULTISELECT => 'Single Line Tags',
		self::TYPE_MULTI_LINE => 'Multi Line',
		self::TYPE_NUMBER     => 'Number',
		self::TYPE_DATE       => 'Date',
		self::TYPE_DROPDOWN_MULTISELECT => "Multiselect Dropdown",
	];

    protected $fillable = [
    	'name', 'type', 'required', 'options'
    ];

	protected $attributes = [
        'type' => self::TYPE_DROPDOWN,
    ];

    protected $casts = [
        'options' => 'array',
    ];

    /**
     * To make types traanslatable.
     */
    public static function getTypes()
    {
    	return [
			1 => __('Dropdown'),
			2 => __('Single Line'),
			3 => __('Multi Line'),
			4 => __('Number'),
			5 => __('Date'),
			8 => __('Multiselect Dropdown')
    	];
    }

    public function setSortOrderLast()
    {
    	$this->sort_order = (int)CustomField::max('sort_order')+1;
    }

    public function getAsText()
    {
        if ($this->type == self::TYPE_DROPDOWN) {
            return $this->options[$this->value] ?? $this->value ?? '';
        } elseif ($this->type == self::TYPE_MULTISELECT || $this->type == self::TYPE_DROPDOWN_MULTISELECT) {
            return str_replace(self::MULTISELECT_DELIMITER, self::MULTISELECT_DELIMITER.' ', $this->value ?? '');
        } else {
            return $this->value ?? '';
        }
    }

    public static function getMailboxCustomFields($mailbox_id, $cache = false)
    {
    	$query = CustomField::where('mailbox_id', $mailbox_id)
            ->orderby('sort_order');
        if ($cache) {
            $query->rememberForever();
        }
        return $query->get();
    }

    public static function getCustomFieldsWithValues($mailbox_id, $conversation_id)
    {
        return CustomField::where('custom_fields.mailbox_id', $mailbox_id)
            ->select(['custom_fields.*', 'conversation_custom_field.value'])
            ->orderby('custom_fields.sort_order')
            ->leftJoin('conversation_custom_field', function ($join) use ($conversation_id) {
                $join->on('conversation_custom_field.custom_field_id', '=', 'custom_fields.id')
                    ->where('conversation_custom_field.conversation_id', '=', $conversation_id);
            })
            ->get();
    }

    public static function getValue($conversation_id, $custom_field_id)
    {
        $field = ConversationCustomField::where('conversation_id', $conversation_id)
            ->where('custom_field_id', $custom_field_id)
            ->first();

        if ($field) {
            return $field->value;
        } else {
            return '';
        }
    }

    public static function setValue($conversation_id, $custom_field_id, $value)
    {
        try {
            $field = ConversationCustomField::firstOrNew([
                'conversation_id' => $conversation_id,
                'custom_field_id' => (int)$custom_field_id,
            ]);

            // Do not set the same value.
            if ($field->value == $value) {
                return null;
            }

            // Format.
            $custom_field = $field->custom_field;
            if (!$custom_field) {
                return false;
            }
            switch ($field->custom_field->type) {
                case self::TYPE_DATE:
                    if ($value) {
                        $date = \Helper::parseDateToCarbon($value, false);
                        if (!$date) {
                            //$value = null;
                            return false;
                        }
                    }
                    break;
            };

            $field->conversation_id = $conversation_id;
            $field->custom_field_id = $custom_field_id;

            if (is_array($value)) {
                // Multiselect.
                $field->value = implode(self::MULTISELECT_DELIMITER, self::prepareMultiselectValues($value));
            } elseif (strstr($custom_field_id, '[')) {
                // Multiselect.
                $values_array = explode(self::MULTISELECT_DELIMITER, $value ?? '');
                $field->value = implode(self::MULTISELECT_DELIMITER, self::prepareMultiselectValues($values_array));
            } else {
                $field->value = $value;
            }
            $field->save();

            \Eventy::action('custom_field.value_updated', $field, $conversation_id);

            return $custom_field;
        } catch (\Exception $e) {
            return false;
        }
    }

    // If this function is called more than once it will cause duplication of custom fields.
    public static function loadCustomFieldsForConversations($conversations, $only_visible_in_list = false, $all_fields = false)
    {
        // Fetch mailbox by mailbox.
        $mailbox_ids = $conversations->pluck('mailbox_id')->unique()->toArray();

        foreach ($mailbox_ids as $mailbox_id) {

            $ids = [];

            foreach ($conversations as $conversation) {
                if ($conversation->mailbox_id == $mailbox_id) {
                    $ids[] = $conversation->id;
                }
            }
            if (!$ids) {
                return $conversations;
            }

            $cf_query = CustomField::select([
                    'custom_fields.*',
                    'conversation_custom_field.value',
                    'conversation_custom_field.conversation_id'
                ])
                ->where('custom_fields.mailbox_id', $mailbox_id)
                ->orderby('custom_fields.sort_order')
                ->leftJoin('conversation_custom_field', function ($join) use ($ids) {
                    $join->on('conversation_custom_field.custom_field_id', '=', 'custom_fields.id')
                        ->whereIn('conversation_custom_field.conversation_id', $ids);
                });
            if ($only_visible_in_list) {
                $cf_query->where('custom_fields.show_in_list', true);
            }
            
            foreach ($cf_query->get() as $custom_field) {
                foreach ($conversations as $i => $conversation) {
                    $custom_fields = [];
                    if (isset($conversation->custom_fields)) {
                        $custom_fields = $conversation->custom_fields;
                    }
                    if ($conversation->id == $custom_field->conversation_id) {
                        // If artificial field with this ID has been added before,
                        // remove it and replace with the real one.
                        if ($all_fields) {
                            foreach ($custom_fields as $i => $artificial_field) {
                                if ($artificial_field->id == $custom_field->id) {
                                    unset($custom_fields[$i]);
                                    break;
                                }
                            }
                        }

                        $duplicate = false;
                        // If this function is called more than once it will cause duplication of custom fields.
                        foreach ($custom_fields as $i => $sub_custom_field) {
                            if ($sub_custom_field->id == $custom_field->id) {
                                $duplicate = true;
                                break;
                            }
                        }
                        if (!$duplicate) {
                            $custom_fields[] = $custom_field;
                        }
                    } elseif ($all_fields) {
                        // Add artificial field.
                        if (!in_array($custom_field->id, array_column($custom_fields, 'id'))) {
                            $new_custom_field = clone $custom_field;
                            $new_custom_field->value = '';
                            if ($only_visible_in_list) {
                                if ($custom_field->show_in_list) {
                                    $custom_fields[] = $new_custom_field;
                                }
                            } else {
                                $custom_fields[] = $new_custom_field;
                            }
                        }
                    }

                    $conversation->custom_fields = $custom_fields;
                }
            }
        }

        return $conversations;
    }

    public function getNameEncoded()
    {
        return self::NAME_PREFIX.$this->id;
    }

    public static function getSearchCustomFields()
    {
        if (self::$search_custom_fields) {
            return self::$search_custom_fields;
        }
        $mailbox_ids = auth()->user()->mailboxesIdsCanView();

        if ($mailbox_ids) {
            $custom_fields = CustomField::whereIn('mailbox_id', $mailbox_ids)
                // groupBy('name') does not work in PostgreSQL.
                ->distinct('name')
                ->get();

            $names = [];
    
            if (count($custom_fields)) {

                foreach ($custom_fields as $i => $custom_field) {
                    $name = $custom_field->name;

                    // Add ID to the name if there are several custom fields with the same name.
                    if (in_array($name, $names)) {
                        $name .= ' {'.$custom_field->mailbox_id.'}';
                    } else {
                        $names[] = $custom_field->name;
                    }

                    $custom_fields[$i]->name = '#'.$name;
                }
                self::$search_custom_fields = $custom_fields;
                return $custom_fields;
            }
        }

        return [];
    }

    public static function explodeMultiselectValue($value)
    {
        $values = explode(self::MULTISELECT_DELIMITER, $value ?? '');
        return self::prepareMultiselectValues($values);
    }

    public function getMultiselectValues()
    {
        return self::explodeMultiselectValue($this->value ?? '');
    }

    public function isSet()
    {
        return $this->value !== '' && $this->value !== null;
    }

    public static function prepareMultiselectValues($values)
    {
        foreach ($values as $i => $value) {
            $values[$i] = trim($value ?? '');
            if (!$values[$i]) {
                unset($values[$i]);
            }
        }
        return $values;
    }
}