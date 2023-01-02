<?php

namespace App\Http\Controllers;

use App\Http\Requests\CreateCategoryRequest;
use App\Http\Requests\UpdateCategoryRequest;
use App\Models\Payment;
use App\Models\SubCategory;
use App\Repositories\CategoryRepository;
use App\Http\Controllers\AppBaseController;
use Illuminate\Http\Request;
use Flash;
use Illuminate\Support\Facades\DB;
use Psy\Util\Str;
use Response;

class PaymentController extends AppBaseController
{
    private $paymentModel;

    public function __construct(Payment $payment)
    {
        $this->paymentModel = $payment;
        $this->middleware('permission:Manage admin panel');
    }

    public function index(Request $request)
    {
        $search=$request->search;
        $date=$request->date;
        if($search!=null || $date!=null)
        {
            $search_data = explode(' ', $search);
            $payments =Payment::join('orders','payments.order_id','orders.id')->join('users','users.id','orders.user_id')->orwhere('orders.order_number',$search)->orwhere('payments.date',$date)->orwhere(function ($q) use ($search_data) {
                foreach ($search_data as $value) {
                    if (isset($search_data)) {
                        $q->where('users.name', 'like', "%{$value}%");
                    }

                }
            })->paginate(10);


        }
        else
        {
            $payments = $this->paymentModel->paginate(10);
        }



        return view('payments.index',compact('search','date'))
            ->with('payments', $payments);
    }

}
