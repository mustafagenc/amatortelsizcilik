<?php

//https://github.com/diglactic/laravel-breadcrumbs

Breadcrumbs::for('home', function ($trail) {
    $trail->push('Ana Sayfa', route('home'));
});

Breadcrumbs::for('questions', function ($trail, $category_id) {

    $category = Cache::remember('exam_category_' . $category_id, 800, function () use($category_id) {
        return ExamCategory::where('id', '=', $category_id)->firstOrFail();
    });

    $trail->parent('home');
    $trail->push($category->name, route('questions', $category_id));
});

Breadcrumbs::for('page', function ($trail, $slug) {

    $page = Cache::remember('page_' . $slug, 60, function () use ($slug) {
        return Page::where('slug', '=', $slug)->firstOrFail();
    });

    $trail->parent('home');
    $trail->push($page->title, route('page', $slug));
});
