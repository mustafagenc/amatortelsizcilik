<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;
use App\Helpers\Helper;
use TCG\Voyager\Models\Post;

class PostController extends Controller
{
    public function index($slug = null)
    {
        $posts = Post::paginate(10);

        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        return view('posts.index', compact('posts'));
    }

    public function detail($slug)
    {
        $post = Cache::remember('post_' . $slug, config('const.cache_sec_pages'), function () use ($slug) {
            return Post::where('slug', '=', $slug)->firstOrFail();
        });

        if ($post == null) {
            abort(404);
        }

        $this->seo()->setTitle($post->title);
        $this->seo()->setDescription($post->meta_description);
        $this->seo()->opengraph()->setUrl(route('page', $post->slug));
        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        return view('posts.detail', compact('post'));
    }

}
