<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use TCG\Voyager\Models\Page;

class PageController extends Controller
{
    public function index($slug)
    {
        $page = Cache::remember('page_' . $slug, 60, function () use ($slug) {
            return Page::where('slug', '=', $slug)->firstOrFail();
        });

        if ($page == null) {
            abort(404);
        }

        $this->seo()->setTitle($page->title);
        $this->seo()->setDescription($page->meta_description);
        $this->seo()->opengraph()->setUrl(route('page', $page->slug));
        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(asset('images/share.png'), ['height' => 630, 'width' => 1200]);
        $this->seo()->opengraph()->addProperty('locale', 'tr-TR');
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(asset('images/share.png'));

        return view('page', compact('page'));
    }
}
