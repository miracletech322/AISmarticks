<?php

namespace Modules\SatRatings\Http\Controllers;

use App\Mailbox;
use App\Thread;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Validator;

class SatRatingsController extends Controller
{
    /**
     * Edit ratings.
     * @return Response
     */
    public function settings($id)
    {
        $mailbox = Mailbox::findOrFail($id);

        return view('satratings::settings', [
            'mailbox' => $mailbox,
            'settings' => \SatRatingsHelper::getMailboxSettings($mailbox),
        ]);
    }

    public function settingsSave($id, Request $request)
    {
        $mailbox = Mailbox::findOrFail($id);

        // Permissions are checked in the route
        //$this->authorize('update', $mailbox);

        $request->merge([
            'ratings' => ($request->filled('ratings') ?? false)
        ]);

        if ($request->ratings) {
            $post = $request->all();
            // Text may contain just <br/>, so we need to check it without tags
            $post['ratings_text'] = strip_tags($post['ratings_text']);
            $validator = Validator::make($post, [
                'ratings_text' => 'required|string',
            ]);
            $validator->setAttributeNames([
                'ratings_text' => __('Ratings Text')
            ]); 

            if ($validator->fails()) {
                return redirect()->route('mailboxes.sat_ratings', ['id' => $id])
                            ->withErrors($validator)
                            ->withInput();
            }
        }

        $mailbox->fill($request->all());

        $meta = $mailbox->meta;
        $meta['sr'] = [
            'add' => $request->settings['add'],
            'saving_mode' => $request->settings['saving_mode'],
        ];
        $mailbox->meta = $meta;

        $mailbox->save();

        \Session::flash('flash_success_floating', __('Settings updated'));

        return redirect()->route('mailboxes.sat_ratings', ['id' => $id]);
    }

    /**
     * Ratings translations.
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function trans($id)
    {
        $mailbox = Mailbox::findOrFail($id);

        $trans = \Helper::jsonToArray($mailbox->ratings_trans);
        if (!$trans) {
            $trans = \SatRatingsHelper::getDefaultTrans();
        } else {
            // Make sure that array has all keys
            $trans = array_merge(\SatRatingsHelper::getDefaultTrans(), $trans);
        }

        return view('satratings::trans', [
            'mailbox' => $mailbox,
            'trans'   => $trans,
            'default' => \SatRatingsHelper::getDefaultTrans(),
        ]);
    }

    public function transSave($id, Request $request)
    {
        $mailbox = Mailbox::findOrFail($id);

        // Permissions are checked in the route

        // Build validation rules
        // $rules = [];
        // foreach (\SatRatingsHelper::getDefaultTrans() as $field => $value) {
        //     $rules[] = [
        //         'trans.'.$field => 'required|string',
        //     ];
        // }

        $validator = Validator::make($request->all(), [
            'trans.*' => 'required|string'
        ]);
        // $validator->setAttributeNames([
        //     'ratings_text' => __('Ratings Text')
        // ]); 

        if ($validator->fails()) {
            return redirect()->route('mailboxes.sat_ratings_trans', ['id' => $id])
                        ->withErrors($validator)
                        ->withInput();
        }

        $mailbox->ratings_trans = json_encode($request->trans);

        $mailbox->save();

        \Session::flash('flash_success_floating', __('Translations saved'));

        return redirect()->route('mailboxes.sat_ratings_trans', ['id' => $id]);
    }

    /**
     * Record rating.
     * @param  [type] $id [description]
     * @return [type]     [description]
     */
    public function record($thread_id, $hash, $rating = null)
    {
        // Skip HEAD requests.
        if (request()->method() == 'HEAD') {
            return response('');
        }

        $trans = \SatRatingsHelper::getDefaultTrans();

        $thread = Thread::find($thread_id);
        if (!$thread || !\Hash::check($thread_id, base64_decode($hash))) {
            return view('satratings::record', ['trans' => $trans, 'error' => 'Invalid request']);
        }

        $mailbox = $thread->conversation->mailbox;

        $trans = \SatRatingsHelper::getTranslations($mailbox);

        $show_success_title = true;
        if (\SatRatingsHelper::getMailboxSettings($mailbox)['saving_mode'] == \SatRatingsHelper::SAVING_MODE_INSTANT) {
            \SatRatingsHelper::rate($thread, $rating);
        } else {
            $show_success_title = false;
        }

        return view('satratings::record', [
            'trans' => $trans,
            'rating' => $rating,
            'show_success_title' => $show_success_title,
        ]);
    }

    /**
     * Save feedback with comment.
     */
    public function recordSave($thread_id, $hash, $rating = null)
    {
        $thread = Thread::find($thread_id);
        // first_name - robots test
        if (!$thread || !\Hash::check($thread_id, base64_decode($hash)) || !empty(request()->first_name)) {
            $trans = \SatRatingsHelper::getDefaultTrans();
            return view('satratings::record', ['trans' => $trans, 'error' => 'Invalid request']);
        }

        $mailbox = $thread->conversation->mailbox;

        $rating = (int)$rating;
        if (!empty(request()->rating)) {
            $rating = (int)request()->rating;
        }
        if ($rating < 1 || $rating > 3) {
            $rating = \SatRatingsHelper::RATING_GREAT;
        }

        $rating_changed = false;
        if ($thread->rating != $rating) {
            $rating_changed = true;
        }

        $thread->rating = $rating;
        if (!empty(request()->comment)) {
            $thread->rating_comment = request()->comment;
            $rating_changed = true;
        }
        $thread->save();

        if (\SatRatingsHelper::getMailboxSettings($mailbox)['saving_mode'] == \SatRatingsHelper::SAVING_MODE_ON_SUBMIT) {
            \Eventy::action('satratings.rated', $thread, $rating);
        }

        \Eventy::action('satratings.feedback_sent', $thread, $rating, $thread->rating_comment, $rating_changed);

        return redirect()->route('sat_ratings.thanks', ['thread_id' => $thread_id]);
    }

    /**
     * Thank you page.
     * @param  [type] $thread_id [description]
     */
    public function thanks($thread_id)
    {
        $trans = [];

        $thread = Thread::find($thread_id);
        
        if (!$thread) {
            $trans = \SatRatingsHelper::getDefaultTrans();
        } else {
            $mailbox = $thread->conversation->mailbox;
            $trans = \SatRatingsHelper::getTranslations($mailbox);
        }

        return view('satratings::thanks', ['trans' => $trans]);
    }
}
