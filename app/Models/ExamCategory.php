<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ExamCategory extends Model
{
    protected $table = 'exam_categories';

    protected $fillable = [
        'name'
    ];


}
