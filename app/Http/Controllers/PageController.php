<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use TCG\Voyager\Models\Page;
use App\Helpers\Helper;

class PageController extends Controller
{
    public function index($slug)
    {
        $page = Cache::remember('page_' . $slug, config('const.cache_sec_pages'), function () use ($slug) {
            return Page::where('slug', '=', $slug)->firstOrFail();
        });

        if ($page == null) {
            abort(404);
        }

        $this->seo()->setTitle($page->title);
        $this->seo()->setDescription($page->meta_description);
        $this->seo()->opengraph()->setUrl(route('page', $page->slug));
        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        return view('page', compact('page'));
    }
}
