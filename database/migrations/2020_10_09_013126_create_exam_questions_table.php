<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExamQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('exam_questions', function (Blueprint $table) {
            $table->id();

            $table->boolean('is_active');
            $table->text('question');

            $table->integer('category_id');
            $table->integer('class_id');

            $table->boolean('answer_1_true');
            $table->text('answer_1');
            $table->boolean('answer_2_true');
            $table->text('answer_2');
            $table->boolean('answer_3_true');
            $table->text('answer_3');
            $table->boolean('answer_4_true');
            $table->text('answer_4');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('exam_questions');
    }
}
