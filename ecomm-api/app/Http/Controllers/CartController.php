<?php

namespace App\Http\Controllers;

use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function index()
    {
        try {
            $products = Cart::with('product.category')->where('user_id', auth()->id())->get();
            return response([
                'status' => 'success',
                'products' => $products
            ]);
        } catch (\Exception $e) {
            return response([
                'status' => 'error',
                'message' => $e->getMessage()
            ]);
        }
    }

    public function addToCart($product_id)
    {
        try {
            $check_cart = Cart::where('user_id', auth()->id())->where('product_id', $product_id)->first();
            if ($check_cart) {
                return response([
                    'status' => 'success',
                    'message' => 'Product already in cart!'
                ]);
            }
            $product = Cart::create([
                'user_id' => auth()->id(),
                'product_id' => $product_id
            ]);

            return response([
                'status' => 'success',
                'product' => $product
            ]);
        } catch (\Exception $e) {
            return response([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }


    public function removeProductFromCart($product_id)
    {
        try {
            $check_cart =
                Cart::where('user_id', auth()->id())->where('product_id', $product_id)->first();
            if (empty($check_cart)) {
                return response([
                    'status' => 'error',
                    'message' => 'Product not found'
                ], 404);
            }
            Cart::where('user_id', auth()->id())->where('product_id', $product_id)->delete();
            return response([
                'status' => 'success',
                'message' => 'Product removed from cart'
            ], 404);
        } catch (\Exception $e) {
            return response([
                'status' => 'error',
                'message' => $e->getMessage()
            ], 500);
        }
    }
}
