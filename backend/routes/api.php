<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrderController;

  //public routes
  Route::post('register', [AuthController::class, 'register']);
  Route::post('login', [AuthController::class, 'login']);
  Route::get('fetchAllCategories', [CategoryController::class, 'index']);
  Route::get('fetchAllProducts', [ProductController::class, 'index']);
  Route::get('fetchProductsPerCategory/{id}', [ProductController::class, 'byCategory']);
  Route::get('uploads/{path}', function ($path) {
    $filepath = storage_path('app/public/' . $path);
    if (!file_exists($filepath)) {
      abort(404, 'File not found.');
    }

    return response()->file($filepath);
  })->where('path', '.*');

  //private routes
  Route::middleware('auth:sanctum')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    Route::get('fetchAllOrders', [OrderController::class, 'index']);
    Route::post('completeOrder/{id}', [OrderController::class, 'fulfilOrder']);
    Route::get('fetchOrderPerUser/{id}', [OrderController::class, 'getOrderPerUser']);
    Route::post('saveNewOrder', [OrderController::class, 'store']);

    Route::get('orders/{order}', [OrderController::class, 'show']);
    Route::post('orders/{order}', [OrderController::class, 'update']);
    Route::delete('orders/{order}', [OrderController::class, 'destroy']);
    Route::post('products', [ProductController::class, 'store']);
    Route::get('products/{product}', [ProductController::class, 'show']);
    Route::post('products/{id}', [ProductController::class, 'update']);
    Route::delete('products/{id}', [ProductController::class, 'deleteProduct']);
   
  });