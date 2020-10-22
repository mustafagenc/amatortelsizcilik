<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;

use App\Models\Contact;
use App\Http\Requests\ContactRequest;

class ContactController extends Controller
{

    public function index(Request $request)
    {
        $this->seo()->setTitle(__('contact.contact'));
        $this->seo()->setDescription(setting('site.description'));
        $this->seo()->opengraph()->setUrl(route('contact'));
        $this->seo()->opengraph()->addProperty('type', 'WebPage');
        $this->seo()->jsonLd()->setType('WebPage');

        return view('contact');
    }

    public function store(ContactRequest $request)
    {
        if (isset($request->validator) && $request->validator->fails()) {
            return response()->json($request->validator->messages(), 400);
        }

        $contact = new Contact();

        if (Auth::check()) {
            $contact->user_id = Auth::id();
        }

        $contact->is_read = false;
        $contact->fullname = $request->fullname;
        $contact->email = $request->email;
        $contact->subject = $request->subject;
        $contact->message = $request->message;
        $contact->save();

        return back()->with('success', __('contact.success'));
    }
}
