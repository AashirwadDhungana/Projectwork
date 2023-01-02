<?php

namespace App\Http\Controllers\Web;

use App\Esewa;
use App\Http\Controllers\Controller;
use App\Mail\SentMail;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Payment;
use App\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;


class EsewaController extends Controller
{

    public function completed(Request $request)
    {
        $oid = substr($request->oid, 12);
        $order_detail = OrderDetail::find($oid);
        $order_detail->status = 3;
        $order_detail->save();
        $order = Order::find($order_detail->order_id);
        $data['order_id'] = $oid;
        $data['date'] = Carbon::now();
        $data['amount'] = $request->amt;
        $data['payment_method'] = 'Esewa';
        $data['transaction_id'] = $request->refId;
        $data['status'] = 'Success';
        Payment::create($data);

        $reciever = User::find($order->user_id);
        $mail_data['sub'] = 'Payment Success';
        $mail_data['message'] = 'Your Payment of product titled "' . $order_detail->product->title . '"has been successfully received.';


        if ($reciever) {
            $mail_data['email'] = 'hamroshop@gmail.com';
            $mail_data['name'] = 'Hamro Shop';
            $mail_data['reciever_name'] = $reciever->name;


            Mail::to($reciever->email)->send(new SentMail($mail_data));
        }
        $mail_data = [];
        $reciever1 = User::find($order_detail->product->user_id);
        $mail_data['sub'] = 'Payment Received';
        $mail_data['message'] = 'The Payment of your product titled "' . $order_detail->product->title . '"has been successfully received from ' . $order->user->name
            . 'Please delivered your product soon to recieve payment';


        if ($reciever1) {
            $mail_data['email'] = 'hamroshop@gmail.com';
            $mail_data['name'] = 'Hamro Shop';
            $mail_data['reciever_name'] = $reciever1->name;


            Mail::to($reciever1->email)->send(new SentMail($mail_data));
        }
        return redirect('/')->with('success', 'Your payment is successfully done');
    }

    /**
     * @param $order_id
     * @param Request $request
     */
    public function failed(Request $request)
    {
        return redirect('/')->with('erroe', 'Your payment is failed');
    }
}
