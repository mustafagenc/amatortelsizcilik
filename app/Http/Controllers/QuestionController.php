<?php
namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Models\ExamCategory;
use App\Models\ExamQuestion;
use Illuminate\Support\Facades\Cache;

class QuestionController extends Controller
{
    public function index()
    {
        $categories = Cache::remember('exam_categories', config('const.cache_sec_questions'), function () {
            $category_list = [];
            $categories = ExamCategory::all();
            foreach ($categories as $category) {
                $questions = ExamQuestion::where('category_id', '=', $category->id)->inRandomOrder()->limit(5)->get();
                $questions = $questions->map(function ($question) use ($questions) {
                    return [
                        'id' => $question->id,
                        'question' => Helper::replace_tags($question->question),
                    ];
                });
                array_push ($category_list, [
                    'id' => $category->id,
                    'name' => $category->name,
                    'questions' => $questions
                ]);
            }
            return $category_list;
        });

        $this->seo()->setTitle("Soru Bankası");
        $this->seo()->opengraph()->setUrl(route('questions'));
        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        return view('questions.index', ['categories' => $categories]);
    }

    public function detail($category_id)
    {
        $category = Cache::remember('exam_category_' . $category_id, config('const.cache_sec_questions'), function () use ($category_id) {
            return ExamCategory::where('id', '=', $category_id)->firstOrFail();
        });

        if ($category == null) {
            abort(404);
        }

        $questions = Cache::remember('exam_questions_' . $category_id, config('const.cache_sec_questions'), function () use ($category_id) {
            $questions = ExamQuestion::where('category_id', '=', $category_id)->inRandomOrder()->get();
            $questions = $questions->map(function ($question) use ($questions) {
                return new ExamQuestion([
                    'id' => $question->id,
                    'is_active' => $question->is_active,
                    'question' => Helper::replace_tags($question->question),
                    'info_link' => $question->info_link,
                    'category_id' => $question->category_id,
                    'class_id' => $question->class_id,
                    'answer_1_true' => $question->answer_1_true,
                    'answer_1' => Helper::replace_tags($question->answer_1),
                    'answer_2_true' => $question->answer_2_true,
                    'answer_2' => Helper::replace_tags($question->answer_2),
                    'answer_3_true' => $question->answer_3_true,
                    'answer_3' => Helper::replace_tags($question->answer_3),
                    'answer_4_true' => $question->answer_4_true,
                    'answer_4' => Helper::replace_tags($question->answer_4),
                ]);
            });
            return $questions;
        });

        $this->seo()->setTitle($category->name);
        $this->seo()->opengraph()->setUrl(route('questions_detail', $category->id));
        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(config('const.share_image'), config('const.share_image_dimensions'));
        $this->seo()->opengraph()->addProperty('locale', \App::getLocale());
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(config('const.share_image'));

        return view('questions.detail', [
            'category' => $category,
            'questions' => $questions,
        ]);
    }

}
