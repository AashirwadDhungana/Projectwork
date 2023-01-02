<?php

namespace App\Http\Controllers\Web;

use App\Http\Controllers\Controller;
use App\Mail\SentMail;
use App\Models\Cart;
use App\Models\Notification;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Payment;
use App\Models\Product;
use App\Models\Shipping;
use App\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;


class OrderController extends Controller
{


    public function cartSession($type)
    {
        if (Auth::check()) {
            $check_product = [];
            $or_total = 0;

            if ($type == 'Multiple') {

                $allcarts__d = Cart::where('user_id', Auth::user()->id)->get();
                foreach ($allcarts__d as $u_cart) {
                    $checkout_p = [];
                    $product = \App\Models\Product::where('id', $u_cart->product_id)->first();
                    if ($product->status == 3 && ($product->quantity - $product->sold_qty) != 0) {
                        $checkout_p['product_code'] = $product->product_code;
                        $checkout_p['quantity'] = $u_cart->quantity;
                        $or_total += $product->price * $checkout_p['quantity'];
                        $check_product[] = $checkout_p;
                    }
                }
                \Illuminate\Support\Facades\Session::put('checkout_products', $check_product);
                \Illuminate\Support\Facades\Session::put('order_total', $or_total);

                \Illuminate\Support\Facades\Session::put('nodelivery', 0);
            } else {
                $single_product = \App\Models\Product::where('product_code',  $type)->first();
                if ($single_product != null && $single_product->status == 3) {
                    $checkout_p['product_code'] = $type;
                    $checkout_p['quantity'] = 1;
                    $or_total += $single_product->price * $checkout_p['quantity'];
                    $check_product[] = $checkout_p;
                    \Illuminate\Support\Facades\Session::put('checkout_products', $check_product);
                    \Illuminate\Support\Facades\Session::put('order_total', $or_total);
                    if ($single_product->delivery == 1) {
                        $nodelivery = 1;
                        \Illuminate\Support\Facades\Session::put('nodelivery', $nodelivery);
                    } else {
                        $nodelivery = 0;
                        \Illuminate\Support\Facades\Session::put('nodelivery', $nodelivery);
                    }
                }
            }


            return redirect()->route('web.order.checkout');
        } else {
            return view('web.profile.login-register');
        }
    }

    public function updateSession(Request $request)
    {
        $check_product = [];
        $or_total = 0;
        if (request()->ajax()) {
            $product_code = $request->get('product_code');
            $quantity = $request->get('qty');
            $session_data = \Illuminate\Support\Facades\Session::get('checkout_products');
            foreach ($session_data as $session) {
                $checkout_p = [];

                if ($session['product_code'] == $product_code) {
                    $pro_duct = \App\Models\Product::where('product_code', $product_code)->first();
                    $checkout_p['product_code'] = $product_code;
                    $checkout_p['quantity'] = $quantity;
                    $or_total += $pro_duct->price * $checkout_p['quantity'];
                } else {
                    $pro_duct = \App\Models\Product::where('product_code', $session['product_code'])->first();
                    $checkout_p['product_code'] = $session['product_code'];
                    $checkout_p['quantity'] = $session['quantity'];
                    $or_total += $pro_duct->price * $checkout_p['quantity'];
                }
                $check_product[] = $checkout_p;
            }
            \Illuminate\Support\Facades\Session::put('checkout_products', $check_product);
            \Illuminate\Support\Facades\Session::put('order_total', $or_total);
            return response()->json(['or_total' => $or_total,]);
        }
    }
    public function checkout(Request $request)
    {
        if (Auth::check()) {
            $nodelivery  = \Illuminate\Support\Facades\Session::get('nodelivery');
            if ($nodelivery != 1) {
                $shipping = \App\Models\Shipping::where('user_id', Auth::user()->id)->first();
                if ($shipping == null) {

                    return view('web.shipping');
                } else {
                    return view('web.order');
                }
            } else {
                return view('web.order');
            }
        }
    }

    public function create(Request $request)
    {
        $input = $request->all();
        $input['order_number'] = Str::random('8');
        $input['total'] = \Illuminate\Support\Facades\Session::get('order_total');
        $input['order_date'] = Carbon::now();
        $input['user_id'] = Auth::user()->id;
        if (isset($request->phone))
            $input['phone_status'] = $request->phone;
        else
            $input['phone_status'] = 0;
        $order = Order::create($input);
        $order_products = \Illuminate\Support\Facades\Session::get('checkout_products');
        foreach ($order_products as $order_product) {
            $product = \App\Models\Product::where('product_code', $order_product['product_code'])->first();

            if ($product != null) {
                $detail['order_id'] = $order->id;
                $detail['product_id'] = $product->id;
                $detail['quantity'] = $order_product['quantity'];
                $detail['status'] = 0;
                $detail['total'] = $order_product['quantity'] * $product->price;
                OrderDetail::create($detail);
                $input['message'] = 'New order for ' . $product->title;
                $input['user_id'] = $product->user_id;
                $input['url'] = url('/orders');
                $input['status'] = 1;
                Notification::create($input);

                $product->sold_qty += $order_product['quantity'];
                $product->save();
                $reciever = User::find($product->user_id);
                $mail_data['sub'] = 'New Order';
                $mail_data['message'] = 'New order for ' . $product->title . ' Please check website and review all details of buyer.';


                if ($reciever) {
                    $sender = User::find(Auth::user()->id);
                    $mail_data['email'] = 'hamroshop@gmail.com';
                    $mail_data['name'] = 'Hamro Shop';
                    $mail_data['reciever_name'] = $reciever->name;


                    Mail::to($reciever->email)->send(new SentMail($mail_data));
                }
            }
        }

        return redirect('/')->with('success', 'Your order is confirmed! Wait for seller response');
    }


    public function changeStatus(Request $request)
    {

        if (Auth::check()) {
            $order_detail = OrderDetail::find($request->id);
            $status = $order_detail->status;
            $order_detail->status = $request->status;
            $order_detail->save();
            if ($status == 1 && $order_detail->status == 2) {
                $input['message'] = 'The order of' . $order_detail->product->title .  ' which u had approved has been cancelled by' . Auth::user()->name;
                $input['user_id'] = $order_detail->product->user_id;
                $input['url'] = url('/orders');
                $input['status'] = 1;
                Notification::create($input);
                $reciever = User::find($order_detail->product->user_id);
                $mail_data['sub'] = 'Cancellation of Order';
                $mail_data['message'] =
                    'The order of' . $order_detail->product->title .  ' which u had approved has been cancelled by' . Auth::user()->name;


                if ($reciever) {
                    $mail_data['email'] = 'hamroshop@gmail.com';
                    $mail_data['name'] = 'Hamro Shop';
                    $mail_data['reciever_name'] = $reciever->name;


                    Mail::to($reciever->email)->send(new SentMail($mail_data));
                }
                return redirect()->route('web.orders');
            }
            if ($order_detail->status == 1) {
                $order_P = Order::find($order_detail->order_id);
                $input['message'] = 'Your order of ' . $order_detail->product->title .  ' has been approved by seller. Now you can pay through E-sewa';
                $input['user_id'] = $order_P->user->id;
                $input['url'] = url('/orders');
                $input['status'] = 1;
                Notification::create($input);
                $reciever = User::find($order_P->user->id);
                $mail_data['sub'] = 'Approval of  Order';
                $mail_data['message'] = 'Your order of ' . $order_detail->product->title .  ' has been approved by seller. Now you can pay through E-sewa';


                if ($reciever) {
                    $mail_data['email'] = 'hamroshop@gmail.com';
                    $mail_data['name'] = 'Hamro Shop';
                    $mail_data['reciever_name'] = $reciever->name;


                    Mail::to($reciever->email)->send(new SentMail($mail_data));
                }
                return redirect()->route('web.orders');
            }
            // elseif ($order_detail->status != 2) {
            //     $product = Product::find($order_detail->product_id);
            //     if ($product) {
            //         $approved_qty = OrderDetail::select('quantity')->where('product_id', $product->id)->whereIn('status', [1, 3,])->sum('quantity');
            //         $remained_qty = $product->quantity - $approved_qty;
            //         if ($remained_qty == 0) {
            //             $allorders = OrderDetail::where('product_id', $product->id)->whereIn('status', [0, 3, 4])->get();
            //             foreach ($allorders as $allorder) {
            //                 $allorder_details = OrderDetail::find($allorder->id);
            //                 $allorder_details->status = 5;
            //                 $allorder_details->save();
            //             }
            //             $product->status = 4;
            //             $product->save();
            //         }
            //         return redirect()->route('web.orders');
            //     }
            // }
            if ($request->status == 2 || $request->status == 5) {
                $product = Product::find($order_detail->product_id);
                $orderDetailing = Order::find($order_detail->order_id);
                if ($product) {
                    $product->sold_qty = $product->sold_qty - $order_detail->quantity;
                    $product->save();
                    if ($request->status == 2) {
                        $input['message'] = 'The order of ' .  $product->title .  ' has been cancelled by Buyer';
                        $input['user_id'] = $order_detail->product->user_id;
                        $input['url'] = url('/orders');
                        $input['status'] = 1;
                        Notification::create($input);
                        $reciever = User::find($order_detail->product->user_id);
                        $mail_data['sub'] = 'Cancellation of Order';
                        $mail_data['message'] = 'The order of ' .  $product->title .  ' has been cancelled by Buyer';


                        if ($reciever) {
                            $mail_data['email'] = 'hamroshop@gmail.com';
                            $mail_data['name'] = 'Hamro Shop';
                            $mail_data['reciever_name'] = $reciever->name;


                            Mail::to($reciever->email)->send(new SentMail($mail_data));
                        }
                    }
                    if ($request->status == 5) {
                        $input['message'] = 'Your  order of ' .  $product->title .  ' has been cancelled by Seller';
                        $input['user_id'] = $orderDetailing->user_id;
                        $input['url'] = url('/orders');
                        $input['status'] = 1;
                        Notification::create($input);
                        $reciever = User::find($orderDetailing->user_id);
                        $mail_data['sub'] = 'Cancellation of Order';
                        $mail_data['message'] = 'Your  order of ' .  $product->title .  ' has been cancelled by Seller';


                        if ($reciever) {
                            $mail_data['email'] = 'hamroshop@gmail.com';
                            $mail_data['name'] = 'Hamro Shop';
                            $mail_data['reciever_name'] = $reciever->name;


                            Mail::to($reciever->email)->send(new SentMail($mail_data));
                        }
                    }
                }
            }

            return redirect()->route('web.orders');
        }
    }
}
