<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\ExamCategory;
use App\Models\ExamQuestion;
use Illuminate\Support\Facades\Cache;
use Validator;
use App\Helpers\Helper;
use App\Http\Resources\Question as QuestionResource;

class QuestionController extends BaseController
{

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function detail($id)
    {
        $category = Cache::remember('exam_category_' . $id, config('const.cache_sec_questions'), function () use ($id) {
            return ExamCategory::where('id', '=', $id)->firstOrFail();
        });

        if (is_null($category)) {
            return $this->sendError('Category not found.');
        }

        $questions = Cache::remember('exam_questions_' . $id, config('const.cache_sec_questions'), function () use ($id) {
            $questions = ExamQuestion::where('category_id', '=', $id)->inRandomOrder()->get();
            $questions = $questions->map(function ($question) use ($questions) {
                return new ExamQuestion([
                    'id' => $question->id,
                    'is_active' => $question->is_active,
                    'question' => $question->question,
                    'info_link' => $question->info_link,
                    'category_id' => $question->category_id,
                    'class_id' => $question->class_id,
                    'answer_1_true' => $question->answer_1_true,
                    'answer_1' => $question->answer_1,
                    'answer_2_true' => $question->answer_2_true,
                    'answer_2' => $question->answer_2,
                    'answer_3_true' => $question->answer_3_true,
                    'answer_3' => $question->answer_3,
                    'answer_4_true' => $question->answer_4_true,
                    'answer_4' => $question->answer_4,
                ]);
            });
            return $questions;
        });

        return $this->sendResponse($questions, 'Questions retrieved successfully.');
    }

}
