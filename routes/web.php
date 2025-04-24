<?php

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\RecipeController;

Route::get('/',                   [RecipeController::class,'index'])->name('recipes.index');
Route::get('/recipes/{recipe}',   [RecipeController::class,'show'])->name('recipes.show');
Route::get('/search',             [RecipeController::class,'search'])->name('recipes.search'); 

Route::middleware('auth')->group(function () {
    Route::get('/dashboard',      [RecipeController::class,'my'])->name('recipes.my');
    Route::get('/recipes/create', [RecipeController::class,'create'])->name('recipes.create');
    Route::post('/recipes',       [RecipeController::class,'store'])->name('recipes.store');
    Route::get('/recipes/{recipe}/edit', [RecipeController::class,'edit'])->name('recipes.edit');
    Route::put('/recipes/{recipe}',      [RecipeController::class, 'update'])->name('recipes.update');
    Route::get('/recipes/{recipe}', [RecipeController::class,'show'])->whereNumber('recipe')->name('recipes.show');
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
