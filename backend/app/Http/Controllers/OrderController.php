<?php

namespace App\Http\Controllers;

use App\Models\Order;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        abort_unless((int) request()->user()->role_id === 1, 403);
        $orders = Order::with('product','user')->get();
        return response()->json($orders);
    }

    /**
     * Display orders belonging to a user.
     */
    public function getOrderPerUser($id)
    {
        $user = request()->user();
        abort_unless((int) $user->role_id === 1 || (int) $user->id === (int) $id, 403);

        $orders = Order::with('product')
            ->where('user_id', $id)
            ->get();

        return response()->json($orders);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validated = $request->validate([
            'user_id' => ['required', 'exists:users,id'],
            'products' => ['required', 'array', 'min:1'],
            'products.*.product_id' => ['required', 'exists:products,id'],
            'products.*.quantity' => ['required', 'integer', 'min:1'],
        ]);

        abort_unless(
            (int) $request->user()->role_id === 1
                || (int) $request->user()->id === (int) $validated['user_id'],
            403
        );

        $products = $validated['products'];
        try {
            foreach ($products as $product) {
                $order = new Order();
                $order->product_id = $product['product_id'];
                $order->user_id = $validated['user_id'];
                $order->quantity = $product['quantity'];
                $order->order_status = 1;
                $order->save();
            }
            return response()->json([
                'message' => 'Order created successfully!',
                
            ], 201);
        } catch (\Exception $exception) {
            return response()->json([
                'error' => 'Order creation failed.',
                'message' => $exception->getMessage(),
            ], 500);
        }    

    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        return response()->json($order->load(['product', 'user']));
    }


    // Update the specified resource in storage.

    public function fulfilOrder($id){
        $order = Order::with('product', 'user')->find($id);
        if (! $order) {
            return response()->json(["error" => "Order not found"], 404);
        }

        $order->order_status = 0;

        try {
            $order->save();
            return response()->json([
                'message' => 'Order updated successfully!',
            ], 200);
        } catch (\Exception $exception) {
            return response()->json([
                "error" => "Order update failed",
                "details" => $exception->getMessage(),
            ], 500);
        }
    }

        

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $order)
    {
        abort_unless((int) request()->user()->role_id === 1, 403);
        $order->delete();
        return response()->json(['message' => 'Order deleted successfully.']);
    }
}