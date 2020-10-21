<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;

use App\Models\ExamCategory;
use App\Models\ExamQuestion;

class QuestionController extends Controller
{

    //https://jsonld.com/question-and-answer/
    public function index($category_id)
    {
        $category = Cache::remember('exam_category_' . $category_id, 800, function () use($category_id) {
            return ExamCategory::where('id', '=', $category_id)->firstOrFail();
        });

        $questions = Cache::remember('exam_questions_' . $category_id, 60, function () use($category_id) {
            return ExamQuestion::where('category_id', '=', $category_id)->inRandomOrder()->get();
        });

        if ($category == null) {
            abort(404);
        }

        $this->seo()->setTitle($category->name);
        $this->seo()->opengraph()->setUrl(route('questions', $category->id));
        $this->seo()->opengraph()->addProperty('type', 'QAPage');
        $this->seo()->jsonLd()->setType('QAPage');

        return view('questions.index', [
                'category'=> $category,
                'questions'=> $questions
            ]);
    }

}