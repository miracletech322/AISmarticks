<?php
/**
 * Outgoing emails.
 */

namespace Modules\Tags\Entities;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    const COLOR_DEFAULT = 0;
    const COLOR_GREEN   = 1;
    const COLOR_BLUE    = 2;
    const COLOR_ORANGE  = 3;
    const COLOR_VIOLET  = 4;
    const COLOR_RED     = 5;
    const COLOR_BROWN   = 6;
    const COLOR_YELLOW   = 7;
    const COLOR_PINK   = 8;
    const COLOR_LIME   = 9;
    const COLOR_TURQUOISE  = 10;
    const COLOR_LAVENDER   = 11;

    public static $colors = [
        self::COLOR_DEFAULT,
        self::COLOR_RED,
        self::COLOR_GREEN,
        self::COLOR_BLUE,
        self::COLOR_ORANGE,
        self::COLOR_VIOLET,
        self::COLOR_BROWN,
        self::COLOR_YELLOW,
        self::COLOR_PINK,
        self::COLOR_LIME,
        self::COLOR_TURQUOISE,
        self::COLOR_LAVENDER,
    ];

    /**
     * The attributes that are not mass assignable.
     *
     * @var array
     */
    protected $guarded = ['id'];

    public $timestamps = false;

    /**
     * Get tag conversations.
     */
    public function conversations()
    {
        return $this->belongsToMany('App\Conversation');
    }

    /**
     * Get conversation tags.
     * @param  [type] $conversation [description]
     * @return [type]               [description]
     */
    public static function conversationTags($conversation)
    {
        return $conversation->belongsToMany('Modules\Tags\Entities\Tag')->get();
    }

    /**
     * Normalize tag name.
     * @param  [type] $name [description]
     * @return [type]       [description]
     */
    public static function normalizeName($name)
    {
        $name = trim($name);
        // remove non-breaking spaces
        $name = preg_replace("/^\s+/u", '', $name);
        $name = preg_replace("/\s+$/u", '', $name);

        $name = mb_strtolower($name);

        return $name;
    }

    /**
     * Decrease counter.
     * @return [type] [description]
     */
    public function decCounter()
    {
        $this->counter--;
        if ($this->counter < 0) {
            $this->counter = 0;
        }
    }

    /**
     * Get tag link.
     * @return [type] [description]
     */
    public function getUrl()
    {
        return route('conversations.search', ['f' => ['tag' => $this->name]]);
    }

    // Legacy - still used in some modules.
    // Do not use it anymore.
    public static function add($tag_name, $conversation_id)
    {
        return self::attachByName($tag_name, $conversation_id);
    }

    // Attach tag to the conversation.
    public function attachToConversation($conversation_id)
    {
        try {
			error_log('TAG '.$this->id.' Attach to conversation '.json_encode($conversation_id));
            $this->conversations()->attach($conversation_id);
            \Eventy::action('tag.attached', $this, $conversation_id);
        } catch (\Exception $e) {
			error_log('TAG '.$this->id.' Attach to conversation '.json_encode($conversation_id).' error '.json_encode($e->getMessage()));
            // Already attached.
        }
    }

    public static function getOrCreate(array $attributes, array $values = [])
    {
        if (!empty($attributes['name'])) {
            $attributes['name'] = Tag::normalizeName($attributes['name']);
        }
        if (!empty($values['name'])) {
            $values['name'] = Tag::normalizeName($values['name']);
        }

        return Tag::firstOrCreate($attributes, $values);
    }

    public static function attachByName($tag_name, $conversation_id)
    {
		error_log('TAG NAME = '.$tag_name);
		$tag_name = Tag::normalizeName($tag_name);
		error_log('TAG NAME = '.$tag_name);
        if ($tag_name) {
            $tag = Tag::where(['name' => $tag_name])->first();
            if (!$tag) {
                $tag = new Tag();
                $tag->name = $tag_name;
                $tag->counter++;
                $tag->save();
            } else {
                $tag->counter++;
                $tag->save();
            }
			error_log('TAG='.json_encode($tag));
            // Attach tag to the conversation.
            try {
				error_log('Tag attach '.$tag->id.' to conversation '.json_encode($conversation_id));
                $tag->conversations()->attach($conversation_id);
                \Eventy::action('tag.attached', $tag, $conversation_id);
            } catch (\Exception $e) {
				error_log('Exception '.json_encode($e->getMessage()));
                // Already attached
            }
			error_log('TAG return '.json_encode($tag));
            try
			{
				$qa = \DB::select("SELECT * FROM `conversation_tag` WHERE `conversation_id`=? ", [$conversation_id]);
				foreach ($qa as $q) 
				{
					error_log('conversation_tag '.json_encode($q));
				}
				error_log('conversation_tag finish');
			}
			catch (\Exception $e)
			{
				error_log('conversation_tag Exception '.$e->getMessage());
			}
			return $tag;
        } else {
			error_log('NO TAG NAME???');
            return null;
        }
    }

    public static function detachByName($tag_name, $conversation_id)
    {
        $tag_name = Tag::normalizeName($tag_name);
		error_log('TAG detach name '.json_encode($tag_name));
        if ($tag_name) {
            $tag = Tag::where(['name' => $tag_name])->first();
            
            if ($tag) {
				error_log('TAG detach '.$tag->id.' from '.json_encode($conversation_id));
                $tag->conversations()->detach($conversation_id);
                $tag->decCounter();
                if ($tag->counter == 0 && \Eventy::filter('tag.can_delete', true, $tag, $conversation_id)) {
                    $tag->delete();
                } else {
                    $tag->save();
                }
                // Just save to avoid extra checks.
                \Eventy::action('tag.detached', $tag, $conversation_id);
                return true;
            }
        }
        return false;
    }

    public static function canUserEditTags($user)
    {
        return ($user->isAdmin() || $user->hasPermission(\App\User::PERM_EDIT_TAGS));
    }

    public function getColor()
    {
        return (int)$this->color;
    }

    public function setColor($color)
    {
        if (in_array((int)$color, self::$colors)) {
            $this->color = (int)$color;
        }
    }
}
