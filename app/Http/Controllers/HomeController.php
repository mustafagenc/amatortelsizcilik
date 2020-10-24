<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Http\Requests\SearchRequest;
use App\Models\ExamQuestion;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Str;
use Spatie\ArrayToXml\ArrayToXml;
use TCG\Voyager\Models\Page;

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

    public function open_search()
    {
        $result = Cache::remember('open_search', config('const.cache_sec_general'), function () {
            $array = [
                'ShortName' => setting('site.title'),
                'Description' => setting('site.description'),
                'Url' => [
                    '_attributes' => [
                        'type' => 'text/html',
                        'method' => 'get',
                        'template' => route('search', ['q' => '{searchTerms}'])]
                ],
                'Image' => [
                    '_attributes' => ['width' => '96', 'height' => '96'],
                    '_value' => asset('images/favicon/favicon-96x96.png')
                ],
                'Developer' => 'Mustafa Genc',
                'Contact' => 'info@amatortelsizcilik.com',
                'InputEncoding' => 'UTF-8',
                'moz:SearchForm' => route('search', ['q' => '{searchTerms}']),
                'moz:UpdateInterval' => 7
            ];

            return ArrayToXml::convert($array, [
                'rootElementName' => 'OpenSearchDescription',
                '_attributes' => [
                    'xmlns' => 'http://a9.com/-/spec/opensearch/1.1/', 'xmlns:moz' => 'http://www.mozilla.org/2006/browser/search/',
                ],
            ], true, 'UTF-8', '1.0', ['formatOutput' => true]);
        });

        return response($result, 200, ['Content-Type' => 'application/xml']);
    }

    public function search(SearchRequest $request)
    {
        if (isset($request->validator) && $request->validator->fails()) {
            return back()->with('modal_error', "illegal operation");
        }

        $this->seo()->setTitle(__('all.search_result'));
        $this->seo()->setDescription(setting('site.description'));
        $this->seo()->opengraph()->setUrl(route('search'));
        $this->seo()->opengraph()->addProperty('type', 'WebPage');
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('WebPage');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        $search_results = [];
        $query = $request->q;

        $pages = Cache::remember('search_result_pages_' . Str::slug($query, ''), config('const.cache_sec_search_result'), function () use ($query) {
            $pages = Page::where('title', 'LIKE', '%' . $query . '%')->get();
            $pages = $pages->map(function ($page) use ($pages) {
                return [
                    'id' => $page->id,
                    'icon' => '<i class="fas fa-file-alt"></i>',
                    'url' => route('page', $page->slug),
                    'title' => Helper::replace_tags($page->title),
                    'description' => Helper::replace_tags($page->excerpt),
                ];

            })->toArray();
            return $pages;
        });

        if (count($pages) > 0) {
            $search_results = array_merge($search_results, $pages);
        }

        $questions = Cache::remember('search_result_questions_' . Str::slug($query, ''), config('const.cache_sec_search_result'), function () use ($query) {
            $questions = ExamQuestion::where('question', 'LIKE', '%' . $query . '%')->get();
            $questions = $questions->map(function ($question) use ($questions) {
                return [
                    'id' => $question->category_id,
                    'icon' => '<i class="far fa-question-circle"></i>',
                    'url' => route('questions', $question->category_id) . '#question-' . $question->id,
                    'title' => Helper::replace_tags($question->question),
                    'description' => '',
                ];
            })->toArray();
            return $questions;
        });

        if (count($questions) > 0) {
            $search_results = array_merge($search_results, $questions);
        }

        $search_results = $this->paginate($search_results);

        if (count($search_results) <= 0) {
            return view('search', compact('search_results'))->withMessage('No Details found. Try to search again!');
        }

        return view('search', compact('search_results'));
    }

    public function paginate($items, $perPage = 10, $page = null)
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, ['path' => route('search')]);
    }

}
