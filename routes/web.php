<?php


use App\Http\Controllers\AdminController;
use App\Http\Controllers\Auth\LoginController;

use App\Http\Controllers\HomeController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\SubjectController;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\RazorpayController;


use App\Http\Controllers\TestController;
use App\Http\Middleware\AuthenticatedMiddleware;
use App\Http\Middleware\GuestsMiddleware;
use Illuminate\Auth\Events\Authenticated;

// use Illuminate\Auth\Events\Authenticated;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home')->middleware(GuestsMiddleware::class);

Route::get('/myhome',[HomeController::class,'custom_home']);

Route::get('/admin/login',[AdminController::class,'admin_login']);

Route::post('/admin/store',[AdminController::class,'admin_store'])->name('admin.store');

Route::get('/dashboard',[AdminController::class,'dashboard']);

Route::get('/admin/logout',[AdminController::class,'admin_logout'])->name('admin.logout');

Route::get('/user/logout',[HomeController::class,'user_logout'])->name('user.logout')->middleware(AuthenticatedMiddleware::class);

Route::get('/user/attempt/test',[HomeController::class,'user_attempt_test'])->name('user.attempt')->middleware(AuthenticatedMiddleware::class);

Route::get('/user/payment/',[HomeController::class,'subscription'])->name('user.subscription')->middleware(AuthenticatedMiddleware::class);

Route::get('/user/dashboard',[HomeController::class,'user_dashboard'])->name('user.dashboard')->middleware(AuthenticatedMiddleware::class);

Route::get('/user/edit/details/{id}',[HomeController::class,'user_profile_update'])->name('user.profile')->middleware(AuthenticatedMiddleware::class);




// include all resource route

Route::resource('subject', SubjectController::class)->middleware(AuthenticatedMiddleware::class);

Route::get('/admin/subject/create',[SubjectController::class,'create'])->name('subject.create')->middleware(GuestsMiddleware::class);

Route::get('/subject/create',[SubjectController::class,'create'])->name('subject.create')->middleware(AuthenticatedMiddleware::class);

Route::post('/subject/store',[SubjectController::class,'store'])->name('subject.store')->middleware(GuestsMiddleware::class);

Route::get('admin/subject/show',[SubjectController::class,'show'])->name('subject.show')->middleware(GuestsMiddleware::class);

Route::get('/subject/show',[SubjectController::class,'show'])->name('subject.show')->middleware(AuthenticatedMiddleware::class);

Route::get('/admin/destroy/{id}',[SubjectController::class,'destroy'])->name('subject.destroy')->middleware(GuestsMiddleware::class);

Route::get('/admin/edit/{id}', [SubjectController::class,'edit'])->name('subject.edit')->middleware(GuestsMiddleware::class);

Route::post('/subject/update',[SubjectController::class,'update'])->name('subject.update')->middleware(GuestsMiddleware::class);

Route::get('/admin/add/questions',[QuestionController::class,'create'])->name('add.questions')->middleware(GuestsMiddleware::class);

// Route::get('/add/questions',[QuestionController::class,'create'])->name('add.questions')->middleware(AuthenticatedMiddleware::class);

Route::post('/question/store', [QuestionController::class, 'store'])->name('question.store')->middleware(GuestsMiddleware::class);

Route::get('/admin/question/show',[QuestionController::class,'show'])->name('question.show')->middleware(GuestsMiddleware::class);

// Route::get('/question/show',[QuestionController::class,'show'])->name('question.show')->middleware(AuthenticatedMiddleware::class);

Route::get('/admin/question/destroy/{id}',[QuestionController::class,'destroy'])->name('question.destroy')->middleware(GuestsMiddleware::class);

Route::get('/admin/question/edit/{id}',[QuestionController::class,'edit'])->name('question.edit')->middleware(GuestsMiddleware::class);

Route::post('/question/update',[QuestionController::class,'update'])->name('question.update')->middleware(GuestsMiddleware::class);

Route::get('/admin/test/create',[TestController::class,'create'])->name('test.create')->middleware(GuestsMiddleware::class);

// Route::get('/test/create',[TestController::class,'create'])->name('test.create')->middleware(GuestsMiddleware::class);

Route::post('/test/store',[TestController::class,'store'])->name('test.store')->middleware(GuestsMiddleware::class);

Route::get('/admin/test/show',[TestController::class,'show'])->name('test.show')->middleware(GuestsMiddleware::class);

// Route::get('/test/show',[TestController::class,'show'])->name('test.show')->middleware(AuthenticatedMiddleware::class);
  
Route::get('/test/create/{id}',[TestController::class,'test_create'])->name('test.create')->middleware(GuestsMiddleware::class);

Route::post('/test/question',[TestController::class,'test_question'])->name('test.question')->middleware(GuestsMiddleware::class);

Route::get('/admin/test/list',[TestController::class,'test_list'])->name('test.list')->middleware(GuestsMiddleware::class);

// Route::get('/test/list',[TestController::class,'test_list'])->name('test.list')->middleware(AuthenticatedMiddleware::class);

Route::get('/test/question/list/{id}',[TestController::class,'test_ques_list'])->name('test.question.list')->middleware(AuthenticatedMiddleware::class);
 
Route::get('/test/attempt/{id}/{question_id?}',[TestController::class,'test_attempt'])->name('test.attempt')->middleware(AuthenticatedMiddleware::class);

Route::post('/quiz/answer/save/',[TestController::class,'save_answer'])->name('save.answer')->middleware(AuthenticatedMiddleware::class);

Route::get('/test/result/{id}',[TestController::class,'test_result'])->name('test.result')->middleware(AuthenticatedMiddleware::class);

Route::get('/test/edit/{id}',[TestController::class,'test_edit'])->name('test.edit')->middleware(GuestsMiddleware::class);

Route::post('/test/edit/update',[TestController::class,'test_edit_update'])->name('test.edit.store')->middleware(GuestsMiddleware::class);

//razorpay

Route::get('/product',[RazorpayController::class,'index']);

Route::post('/razorpay-payment',[RazorpayController::class,'store'])->name('razorpay.payment.store');