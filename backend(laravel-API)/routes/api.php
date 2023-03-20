<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


use App\Http\Controllers\apiController;
use App\Http\Controllers\timetableController;
use App\Http\Controllers\supperuserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
//nomal user login and register route

route::post('/register',[apiController::class,'register']);
route::Post('/login',[apiController::class,'login']);
route::get('/test',function(){
    return  response()->json('api is working', 200,);
});


Route::group(['middleware'=>['auth:sanctum']],function(){
//nomal user route

    //nomal user auth
    route::get('/user',[apiController::class,'getUser']);
    route::get('/logout',[apiController::class,'logout']);

    //nomal user operation
    Route::post('timetable',[timetableController::class,'all']);
    Route::post('timetable/today',[timetableController::class,'get_timetable']);
    Route::post('timetable/subject_support/link',[timetableController::class,'subject_support_link']);
    Route::post('timetable/subject_support',[timetableController::class,'subject_support']);
    Route::post('notification/group',[timetableController::class,'notification']);


//admin user route

    //admin user auth
    route::get('/check-admin',[apiController::class,'admin']);
    Route::post('/admin/add',[timetableController::class,'add']);
    Route::post('/admin/edit',[timetableController::class,'edit']);

    //admin user operation
    Route::post('/admin/delete',[timetableController::class,'delete_titmetable']);

//supper suer route

    //supper user auth

    //supper user operation
    Route::get('supperuser/subject_support/add',[supperuserController::class,'add_subject_support']);
    Route::get('supperuser/subject_support/edit',[supperuserController::class,'edit_subject_support']);
    Route::get('supperuser/timetable',[supperuserController::class,'all']);
    route::post('supperuser/delete',[supperuserController::class,'delete']);
    route::post('supperuser/add/admin',[supperuserController::class,'add_admin']);


});
