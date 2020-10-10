<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Cache;

Auth::routes();
Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::get('/', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
Route::get('questions/{category_id}', [App\Http\Controllers\QuestionController::class, 'index'])->name('questions');
Route::get('{slug}', function($slug){
    $page = Cache::remember('page_' . $slug, 60, function () use($slug) {
        return TCG\Voyager\Models\Page::where('slug', '=', $slug)->firstOrFail();
    });
	return view('page', compact('page'));
});

// Route::prefix('exam')->group(function () {

//     Route::get('/', function () {
//         return view('exam.index');
//     })->name('exam');

// });
