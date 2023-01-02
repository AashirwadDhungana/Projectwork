<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use Flash;
use Response;

class OrderController extends AppBaseController
{
    private $orderModel;

    public function __construct(OrderDetail $order)
    {
        $this->orderModel = $order;
        $this->middleware('permission:Manage admin panel');
    }

    public function index(Request $request)
    {
        $search=$request->search;
        $date=$request->date;
        if($search!=null || $date!=null)
        {
            $search_data = explode(' ', $search);
            $order_details =OrderDetail::join('orders','order_details.order_id','orders.id')->join('users','users.id','orders.user_id')->join('products','products.id','order_details.product_id')->orwhere('orders.order_number',$search)->orwhere('orders.order_date',$date)->orwhere(function ($q) use ($search_data) {
                foreach ($search_data as $value) {
                    if (isset($search_data)) {
                        $q->where('users.name', 'like', "%{$value}%");
                    }

                }
            })->orwhere(function ($q) use ($search_data) {
                foreach ($search_data as $value) {
                    if (isset($search_data)) {
                        $q->where('products.title', 'like', "%{$value}%");
                    }

                }
            })->paginate(10);


        }
        else {
            $order_details = $this->orderModel->whereIn('status', [0, 1, 3, 4, 5])->paginate(10);
        }
        return view('orders.index',compact('order_details','search','date'));

    }

    public function show($id)
    {
        $order_detail = $this->orderModel->whereIn('status',[0,1,3,4,5])->find($id);

        if (empty($order_detail)) {
            Flash::error('Order not found');

            return redirect(route('orders.index'));
        }

        return view('orders.show')->with('order_detail', $order_detail);
    }

}
