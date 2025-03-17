<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\ProductController;

Route::get('/categories', [CategoryController::class, 'index'])->middleware('auth:sanctum');
Route::get('/category/product/{id}', [CategoryController::class, 'fetchProductUnderCategory'])->middleware('auth:sanctum');
Route::get('/products', [ProductController::class, 'index'])->middleware('auth:sanctum');
Route::get('/product/{id}', [ProductController::class, 'viewProduct'])->middleware('auth:sanctum');


Route::get('/favorites', [FavoriteController::class, 'index'])->middleware('auth:sanctum');

Route::post('/product/favorite/{id}', [FavoriteController::class, 'addToFavorite'])->middleware('auth:sanctum');

Route::get('/carts', [CartController::class, 'index'])->middleware('auth:sanctum');


Route::post('/product/cart/{id}', [CartController::class, 'addToCart'])->middleware('auth:sanctum');
Route::post('/product/cart/remove/{id}', [CartController::class, 'removeProductFromCart'])->middleware('auth:sanctum');



Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
