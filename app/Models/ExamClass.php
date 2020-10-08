<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExamClass extends Model
{
    protected $table = 'exam_classes';

    protected $fillable = [
        'name', 'point'
    ];

}
