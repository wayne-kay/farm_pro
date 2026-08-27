<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $products = Product::with('category')->get();

        foreach ($products as $product) {
            if ($product->image) {
                $product->image = asset('/api/uploads/' . $product->image);
            }
        }

        return response()->json($products);
    }

    /**
     * Display products belonging to the specified category.
     */
    public function byCategory($id)
    {
        $products = Product::with('category')
            ->where('category_id', $id)
            ->get();

        return response()->json($products);
    }

    //add product
    public function store(Request $request)
    {
        $path = '';
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('products', 'public');
        }

        try {
            $product = new Product();
            $product->name = $request->name;
            $product->category_id = $request->category_id;
            $product->price = $request->price;
            $product->image = $path;
            $product->availability = $request->availability ?? 1;
            $product->description = $request->description;
            $product->save();

            return response()->json([
                'message' => 'Product created successfully!',
            ], 201);
        } catch (\Exception $exception) {
            return response()->json([
                'Error' => 'Product creation failed: ',
                $exception,
            ], 500);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(Product $product)
    {
        return response()->json($product->load('category'));
    }

    // update product
    public function update(Request $request, $id)
    {
        $path = '';
        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('products', 'public');
        }

        try {
            $product = Product::where('id', $id)->first();
            $product->name = $request->name;
            $product->category_id = $request->category_id;
            $product->price = $request->price;
            if ($path) {
                $product->image = $path;
            }
            $product->availability = $request->availability;
            $product->description = $request->description;
            $product->save();

            return response()->json([
                'message' => 'Product updated successfully!',
            ], 201);
        } catch (\Exception $exception) {
            return response()->json([
                'Error' => 'Product update failed: ',
                $exception,
            ], 500);
        }
    }

    // delete product
    public function deleteProduct(Request $request, $id)
    {
        try {
            $product = Product::where('id', $id)->first();
            $product->delete();

            return response()->json([
                'message' => 'Product deleted successfully!',
            ], 201);
        } catch (\Exception $exception) {
            return response()->json([
                'Error' => 'Product deletion failed: ',
                $exception,
            ], 500);
        }
    }
}