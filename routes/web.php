<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;

use App\Models\ExamCategory;
use App\Models\ExamQuestion;


Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('search', ['uses' => 'App\Http\Controllers\HomeController@search', 'as' => 'search']);
Route::get('mors', ['uses' => 'App\Http\Controllers\HomeController@mors', 'as' => 'mors']);
Route::get('tamap', ['uses' => 'App\Http\Controllers\HomeController@tamap', 'as' => 'tamap']);
Route::get('opensearch.xml', ['uses' => 'App\Http\Controllers\HomeController@open_search', 'as' => 'open_search']);

Route::get('questions', [App\Http\Controllers\QuestionController::class, 'index'])->name('questions');
Route::get('questions/{category_id}', [App\Http\Controllers\QuestionController::class, 'detail'])->name('questions_detail');

Route::get('posts', [App\Http\Controllers\PostController::class, 'index'])->name('posts');
Route::get('posts/{slug}', [App\Http\Controllers\PostController::class, 'index'])->name('posts.category');
Route::get('post/{slug}', [App\Http\Controllers\PostController::class, 'detail'])->name('post.detail');

Route::get('contact', ['uses' => 'App\Http\Controllers\ContactController@index', 'as' => 'contact']);
Route::Post('contact/store', ['uses' => 'App\Http\Controllers\ContactController@store', 'as' => 'contact.store']);
Route::get('show_only_true/{status}', ['uses' => 'App\Http\Controllers\HomeController@show_only_true', 'as' => 'trueanswers']);

Auth::routes();
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/sitemap', function() {
	$sitemap = App::make('sitemap');
	$sitemap->setCache('laravel.sitemap', 60);
	if (!$sitemap->isCached()) {

		$sitemap->add(URL::to(''), '2020-10-21T20:10:00+02:00', '1.0', 'daily');
        $sitemap->add(route('contact'), '2020-10-21T20:10:00+02:00', '1.0', 'weekly');
        $sitemap->add(route('mors'), '2020-10-21T20:10:00+02:00', '1.0', 'weekly');
        $sitemap->add(route('questions'), '2020-11-03T20:10:00+02:00', '1.0', 'weekly');
        $sitemap->add(route('tamap'), '2020-12-01T20:10:00+02:00', '1.0', 'weekly');
        $sitemap->add(route('posts'), '2020-12-01T20:10:00+02:00', '1.0', 'weekly');

        $categories = ExamCategory::orderBy('created_at', 'desc')->get();
		foreach ($categories as $category) {
            $sitemap->add(route('questions', $category->id), $category->created_at->tz('UTC')->toAtomString(), '1.0', 'weekly', null);
		}

        $posts = TCG\Voyager\Models\Post::orderBy('created_at', 'desc')->get();
		foreach ($posts as $post) {
            $sitemap->add(route('post.detail', $post->slug), $post->created_at->tz('UTC')->toAtomString(), '1.0', 'weekly', null);
		}

        $pages = TCG\Voyager\Models\Page::orderBy('created_at', 'desc')->get();
		foreach ($pages as $page) {
            $sitemap->add(route('page', $page->slug), $page->created_at->tz('UTC')->toAtomString(), '1.0', 'weekly', null);
		}
	}
	return $sitemap->render('xml');
});

Route::get('{slug}', [App\Http\Controllers\PageController::class, 'index'])->name('page');

