<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExamQuestion extends Model
{
    protected $table = 'exam_questions';

    protected $fillable = [
        'is_active',
        'question',
        'info_link',
        'category_id',
        'class_id',
        'answer_1_true',
        'answer_1',
        'answer_2_true',
        'answer_2',
        'answer_3_true',
        'answer_3',
        'answer_4_true',
        'answer_4',
    ];

    public function category()
    {
        return $this->hasOne(ExamCategory::class, 'id', 'category_id');
    }

}
