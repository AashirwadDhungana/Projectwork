<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Product;
use App\Models\SubCategory;
use App\Repositories\ProductRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

class MyOrderController extends Controller
{
    public function __construct(ProductRepository $productRepo)
    {
        $this->productRepository = $productRepo;
        $this->middleware('permission:user-dashboard');
    }



    public function index()
    {
        if (Auth::check()) {
            $user = Auth::user();
            $order_details = Order::join('order_details', 'order_details.order_id', 'orders.id')->join('products', 'order_details.product_id', 'products.id')->where('products.user_id', Auth::user()->id)->whereIn('order_details.status', [0, 1, 3, 4, 5])->select('order_details.*')->paginate(10);
            $my_orders = Order::where('user_id', Auth::user()->id)->paginate(10);
            return view('web.myproducts.orders', compact('order_details', 'my_orders'));
        }
    }

    public function show($order_id)

    {
        if (Auth::check()) {
            $user = Auth::user();
            $o_detail = Order::join('order_details', 'order_details.order_id', 'orders.id')->join('products', 'order_details.product_id', 'products.id')->select('orders.*', 'order_details.id as order_detail_id', 'order_details.product_id', 'order_details.quantity', 'order_details.status')->where('products.user_id', $user->id)->where('order_details.id', $order_id)->whereIn('order_details.status', [0, 1, 3, 4, 5])->first();
            if ($o_detail != null) {

                return view('web.myproducts.order-details', compact('o_detail'));
            } else {
                return redirect('/');
            }
        }
    }
}
