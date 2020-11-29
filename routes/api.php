<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\LoginController;
use App\Http\Controllers\API\QuestionController;


// Route::post('register', [RegisterController::class, 'register']);
Route::post('login', [LoginController::class, 'login']);
Route::get('questions/{id}', [App\Http\Controllers\API\QuestionController::class, 'detail'])->name('api_questions_detail');

// Route::middleware('auth:api')->group( function () {

// });
