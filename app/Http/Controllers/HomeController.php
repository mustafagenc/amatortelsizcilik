<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{

    public function index()
    {
        $this->seo()->setDescription(setting('site.description'));
        $this->seo()->opengraph()->setUrl(route('home'));
        $this->seo()->opengraph()->addProperty('type', 'WebPage');
        $this->seo()->jsonLd()->setType('WebPage');

        return view('home');
    }


}
