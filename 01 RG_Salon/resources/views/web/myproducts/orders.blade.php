@extends('web.layouts.app1')
@section('title')
Orders
@endsection

@section('content')
<div class="myaccount-content" style="width:75%;">
    @if(count($order_details)!=0)


    <h3>Order Of Your Product</h3>

    <div class="myaccount-table table-responsive text-center">
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Product</th>
                    <th>Date</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                @foreach($order_details as $key =>$order_detail)
                <?php $order = \App\Models\Order::where('id', $order_detail->order_id)->first();
                $product_order = \App\Models\Product::where('id', $order_detail->product_id)->first();
                ?>
                <tr>
                    <td class="pro-thumbnail"><a href="{!! route('web.product.show',['slug'=>$product_order->product_code]) !!}"><img src="{{imageUrl('storage/'.$product_order->featured_image,90,100,100)}}" alt="Product"></a><br>
                        {{$product_order->title}}
                    </td>


                    <td>{{$order->order_date->format('M d, Y')}}</td>
                    <td>{{$order_detail->quantity}}</td>
                    <td>Rs.{{$order_detail->total}}</td>
                    <td>
                        {{--@if($order_detail->status==0)--}}
                        {{--<h4>New</h4>--}}
                        {{--@elseif($order_detail->status==1)--}}
                        {{--<h4>Approved</h4>--}}
                        {{--@elseif($order_detail->status==3)--}}
                        {{--<h4>Processing</h4>--}}
                        {{--@elseif($order_detail->status==4)--}}
                        {{--<h4>Delivered</h4>--}}
                        {{--@elseif($order_detail->status==5)--}}
                        {{--<h4>Cancelled</h4>--}}
                        {{--@endif--}}
                        <?php $status = ['New Order', 'Approved', 'Cancelled', 'Processing', 'Delivered', 'Cancelled By Seller']; ?>
                        <h4> {{$status[$order_detail->status]}}</h4>
                    </td>
                    <td>

                        <a href="{{route('web.orders.show',['order_id'=>$order_detail->id])}}" class="btn btn-round" style="margin-top: 10px;">View</a>


                    </td>
                </tr>
                @endforeach

            </tbody>
        </table>
        <div class="float-right mr-3">
            {!! $order_details->links(); !!}


        </div>
    </div>





    @endif




    @if(count($my_orders)!=0)

    <h3>Your Orders</h3>
    <div class="myaccount-table table-responsive text-center">
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Product</th>
                    <th>Seller</th>
                    <th>Contact No.</th>
                    <th>Date</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>

            <tbody>
                @foreach($my_orders as $key =>$my_order)
                <?php $my_order_details = \App\Models\OrderDetail::where('order_id', $my_order->id)->get();

                ?>
                @foreach($my_order_details as $my_order_detail)
                <?php
                $my_product_order = \App\Models\Product::find($my_order_detail->product_id);
                ?>
                <tr>
                    <td class="pro-thumbnail"><a href="{!! route('web.product.show',['slug'=>$my_product_order->product_code]) !!}"><img src="{{imageUrl('storage/'.$my_product_order->featured_image,90,100,100)}}" alt="Product"></a><br>
                        {{$my_product_order->title}}
                    </td>
                    <td>
                        {{$my_product_order->user->name}}</td>
                    <td>
                        @if($my_order_detail->status!=2)
                        {{$my_product_order->user->phone}}
                        <br>
                        <a href="#" class="btn" data-toggle="modal" data-target="#exampleModal">Sent Email</a>
                        @endif
                    </td>
                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title" id="exampleModalLabel"><i class="fa fa-envelope" style="font-size: 29px;"></i>&nbsp;Sent Email To Seller</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <form action="{{route('web.sent.mail',['reciever_id'=>$my_product_order->user_id])}}" method="post">
                                        @csrf
                                        <div class="row">

                                            <div class="col-md-12 mb-20">
                                                <input type="text" placeholder="Subject" name="subject" style="width:85%;height: 116%;">
                                            </div>

                                            <div class="col-md-8 mb-20">
                                                <textarea type="text" name="message" rows="5" cols="50" placeholder="Write your message here...."></textarea>
                                            </div>



                                        </div>
                                        <button class="btn btn-primary" style="height:38px;margin-top: -2px;">Send</button>
                                    </form>
                                </div>


                            </div>
                        </div>
                    </div>


                    <td>{{$my_order->order_date->format('M d, Y')}}</td>
                    <td>{{$my_order_detail->quantity}}</td>
                    <td>Rs.{{$my_order_detail->total}}</td>
                    <td>
                        {{--@if($my_order_detail->status==1)--}}
                        {{--<h4>Approved</h4>--}}
                        {{--@elseif($my_order_detail->status==2)--}}
                        {{--<h4>Cancelled</h4>--}}
                        {{--@elseif($my_order_detail->status==3)--}}
                        {{--<h4>Processing</h4>--}}
                        {{--@elseif($my_order_detail->status==4)--}}
                        {{--<h4>Delivered</h4>--}}
                        {{--@elseif($my_order_detail->status==5)--}}
                        {{--<h4>Cancelled By Seller</h4>--}}
                        {{--@endif--}}
                        <?php $status1 = ['New Order', 'Approved', 'Cancelled', 'Processing', 'Delivered', 'Cancelled By Seller']; ?>
                        <h4> {{$status1[$my_order_detail->status]}}</h4>
                    </td>
                    <td>
                        @if($my_order_detail->status==1)
                        <?php
                        $order_number = \Illuminate\Support\Str::random('12') . $my_order_detail->id;
                        \Illuminate\Support\Facades\Session::put('order_number', $order_number); ?>
                        <form action="https://uat.esewa.com.np/epay/main" method="POST">
                            <input value="{{$my_order_detail->total}}" name="tAmt" type="hidden">
                            <input value="{{$my_order_detail->total}}" name="amt" type="hidden">
                            <input value="0" name="txAmt" type="hidden">
                            <input value="0" name="psc" type="hidden">
                            <input value="0" name="pdc" type="hidden">
                            <input value="epay_payment" name="scd" type="hidden">
                            <input value="{{$order_number}}" name="pid" type="hidden">
                            <input value="{{route('web.esewa.success')}}?q=su" type="hidden" name="su">
                            <input value="{{route('web.esewa.failed')}}?q=fu" type="hidden" name="fu">
                            <input value="Pay With Esewa" type="submit" class="btn btn-round">

                        </form>
                        @endif
                        @if($my_order_detail->status==0 || $my_order_detail->status==1)
                        <a href="{{route('web.order.status')}}?id={{$my_order_detail->id}}&status=2" class="btn btn-round cancellation" style="margin-top: 10px;">Cancelled</a>
                        @endif
                        @if($my_order_detail->status==3)
                        <a href="{{route('web.order.status')}}?id={{$my_order_detail->id}}&status=4" class="btn btn-round" style="margin-top: 10px;">Delivered</a>
                        @endif

                    </td>
                </tr>
                @endforeach
                @endforeach
            </tbody>
        </table>
        <div class="float-right mr-3">
            {!! $my_orders->links(); !!}


        </div>
    </div>

    @endif
</div>

@endsection
@section('scripts')
<script type="text/javascript">
    function SubmitForm(frm) {
        frm.submit();
    }
</script>
<script>
    $('.cancellation').click(function(e) {
        e.preventDefault();
        url = $(this).attr('href');

        if (confirm('Do u  want to cancel your order?')) {
            location.href = url;
        }

    });
</script>
@endsection