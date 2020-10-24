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
        $this->seo()->opengraph()->addImage(asset('images/share.png'), ['height' => 630, 'width' => 1200]);
        $this->seo()->opengraph()->addProperty('locale', 'tr-TR');
        $this->seo()->jsonLd()->setType('WebPage');
        $this->seo()->jsonLd()->addImage(asset('images/share.png'));

        return view('home');
    }


}
