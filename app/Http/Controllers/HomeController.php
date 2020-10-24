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
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('WebPage');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        return view('home');
    }


}
