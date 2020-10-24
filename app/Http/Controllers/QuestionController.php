<?php
namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;

use App\Helpers\Helper;
use App\Models\ExamCategory;
use App\Models\ExamQuestion;

class QuestionController extends Controller
{

    public function index($category_id)
    {
        $category = Cache::remember('exam_category_' . $category_id, 960, function () use($category_id) {
            return ExamCategory::where('id', '=', $category_id)->firstOrFail();
        });

        if ($category == null) {
            abort(404);
        }

        $questions = Cache::remember('exam_questions_' . $category_id, 960, function () use($category_id) {
            $questions = ExamQuestion::where('category_id', '=', $category_id)->inRandomOrder()->get();
            $questions = $questions->map(function ($question) use($questions) {
                return new ExamQuestion([
                    'id'            => $question->id,
                    'is_active'     => $question->is_active,
                    'question'      => Helper::replace_tags($question->question),
                    'info_link'     => $question->info_link,
                    'category_id'   => $question->category_id,
                    'class_id'      => $question->class_id,
                    'answer_1_true' => $question->answer_1_true,
                    'answer_1'      => Helper::replace_tags($question->answer_1),
                    'answer_2_true' => $question->answer_2_true,
                    'answer_2'      => Helper::replace_tags($question->answer_2),
                    'answer_3_true' => $question->answer_3_true,
                    'answer_3'      => Helper::replace_tags($question->answer_3),
                    'answer_4_true' => $question->answer_4_true,
                    'answer_4'      => Helper::replace_tags($question->answer_4)
                ]);
            });
            return $questions;
        });

        $this->seo()->setTitle($category->name);
        $this->seo()->opengraph()->setUrl(route('questions', $category->id));
        $this->seo()->opengraph()->addProperty('type', 'articles');
        $this->seo()->opengraph()->addImage(asset('images/share.png'), ['height' => 630, 'width' => 1200]);
        $this->seo()->opengraph()->addProperty('locale', 'tr-TR');
        $this->seo()->jsonLd()->setType('Article');
        $this->seo()->jsonLd()->addImage(asset('images/share.png'));

        return view('questions.index', [
                'category'=> $category,
                'questions'=> $questions
            ]);
    }

}
