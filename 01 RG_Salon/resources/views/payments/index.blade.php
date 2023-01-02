@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li class="breadcrumb-item">Payments</li>
</ol>
<div class="container-fluid">
    <div class="animated fadeIn">
        @include('flash::message')
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i>
                        Payments
                    </div>
                    <div class="card-body">
                        <form name="myform" action="{{route('payments.index')}}" method="get">
                            <div class="pull-left" style="margin-bottom: 20px;">
                                <div class="wrapper">
                                    <input type="date" name="date" onchange="sendform();" value="{{isset($date)?$date:''}}" />
                                </div>


                            </div>
                            <div class="pull-right" style="margin-bottom: 15px;">
                                <div class="wrapper">


                                    <input type="text" value="{{isset($search)?$search:''}}" name="search" />

                                    <button>Search</button>
                                </div>
                            </div>
                        </form>
                        <div class="table-responsive-sm">
                            <table class="table table-striped" id="categories-table">
                                <thead>
                                    <th>Order Number</th>
                                    <th>Product</th>
                                    <th>User</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                    <th>Payment Method</th>
                                    <th>Transaction</th>
                                    <th>Status</th>
                                </thead>
                                <tbody>
                                    @foreach($payments as $payment)
                                    <?php $orderDetail = \App\Models\OrderDetail::find($payment->order_id);
                                    $order = \App\Models\Order::find($orderDetail->order_id); ?>
                                    <tr>
                                        <td>{{ $order->order_number }}</td>
                                        <td>{{ $orderDetail->product->title }}</td>
                                        <td>{{ $order->user->name }}</td>
                                        <td>{{ $payment->date->format('M d, Y') }}</td>
                                        <td>{{ $payment->amount }}</td>
                                        <td>{{ $payment->payment_method }}</td>
                                        <td>{{ $payment->transaction_id }}</td>
                                        <td>{{ $payment->status }}</td>

                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                        <div class="pull-right mr-3">

                            {!! $payments->appends(array('date' => $date,'search'=>$search))->links(); !!}

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script type="text/javascript">
    function sendform() {
        document.myform.submit();
    }
</script>
@endsection