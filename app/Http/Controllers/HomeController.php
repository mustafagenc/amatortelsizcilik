<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    // public function __construct()
    // {
    //     $this->middleware('auth');
    // }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // $this->seo()->setTitle('Home');
        $this->seo()->setDescription(setting('site.description'));
        $this->seo()->opengraph()->setUrl(route('home'));
        $this->seo()->opengraph()->addProperty('type', 'WebPage');
        $this->seo()->jsonLd()->setType('WebPage');

        return view('home');
    }
}
