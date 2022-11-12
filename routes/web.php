<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\PublishController;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/',[DashboardController::class,'baranglist']);
Route::get('/dashboard',[DashboardController::class,'index']);
Route::get('/baranglist/{bag?}/{id?}',[DashboardController::class,'baranglist']);
Route::post('/barangsave/save',[DashboardController::class,'barangsave']);
Route::post('/barangsaveedit/save',[DashboardController::class,'barangsaveedit']);
Route::get('/deletebarang/{id}',[DashboardController::class,'deletebarang']);
Route::get('/viewbarang/{id}',[DashboardController::class,'viewbarang']);


Route::get('/transaksi',[DashboardController::class,'belilist']);
Route::get('/tambahbeli',[DashboardController::class,'tambahbeli']);
Route::post('/belisave/save', [DashboardController::class, 'belisave']);
Route::get('/deletebeli/{id}',[DashboardController::class,'deletebeli']);
Route::post('/belisaveall/save', [DashboardController::class, 'belisaveall']);
Route::get('/viewbeli/{id}',[DashboardController::class,'viewbeli']);
