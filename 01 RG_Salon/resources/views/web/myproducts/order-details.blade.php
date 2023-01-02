@extends('web.layouts.app1')
@section('title')
Orders
@endsection

@section('content')
<div class="myaccount-content" style="width:75%;">
    @if(isset($o_detail))
    <?php


    $product = \App\Models\Product::where('id', $o_detail->product_id)->whereIn('status', [3, 4])->first(); ?>

    <h3>Order Details</h3>
    <div class="row">
        <div class="col-md-4">
            <address>
                <p>Product Name: <strong>{{$product->title}}</strong></p>
                <p>Quantity: <strong>{{$o_detail->quantity}}</strong></p>
                <p>Price: <strong>{{$product->price}}</strong></p>
                <p>Total: <strong>{{$o_detail->total}}</strong></p>
                <p>Date: <strong>{{$o_detail->order_date->format('M d, Y')}}</strong></p>
                <p>Status:
                    @if($o_detail->status==0)
                    <strong>New order</strong>
                    @elseif($o_detail->status==1)
                    <strong>Approved</strong>
                    @elseif($o_detail->status==3)
                    <strong>Processing</strong>
                    @elseif($o_detail->status==4)
                    <strong>Delivered</strong>
                    @elseif($o_detail->status==5)
                    <strong>Cancelled</strong>
                    @endif
                </p>
            </address>
        </div>

        <div class="col-md-8">
            <address>
                @if($o_detail->phone_status==1)
                <?php

                $user_p = App\User::where('id', $o_detail->user_id)->first();
                ?>
                <p>Name: <strong>{{$user_p->name}}</strong></p>
                <p>Phone: <strong>{{$user_p->phone}}</strong></p>
                @endif
                @if($product->delivery==0)
                @if($o_detail->shipping_id!=null)
                <p>Shipping address: <strong>{{$o_detail->shipping->area->name}},{{$o_detail->shipping->cities->name}},{{$o_detail->shipping->region->name}}</strong></p>
                @endif
                <p>Shipping Name: <strong>{{$o_detail->shipping->name}}</strong></p>
                @if($o_detail->status!=5)
                @if($o_detail->phone_status==1)
                <p>Shipping Phone: <strong>{{$o_detail->shipping->phone}}</strong></p>
                @endif
                @endif
                @endif
                @if($o_detail->status!=5)
                <a href="#" class="buy btn" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-envelope" style="font-size: 22px;"></i>&nbsp;&nbsp;&nbsp;Sent Email</a>
                @endif
            </address>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3 class="modal-title" id="exampleModalLabel"><i class="fa fa-envelope" style="font-size: 29px;"></i>&nbsp;Sent Email To Buyer</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <form action="{{route('web.sent.mail',['reciever_id'=>$o_detail->user_id])}}" method="post">
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

    </div>
    @if($o_detail->status==0)
    <a href="{{route('web.order.status')}}?id={{$o_detail->order_detail_id}}&status=1" class="btn btn-round d-inline-block" id="approved"><i class="fa fa-edit"></i>Approved</a>
    <a href="{{route('web.order.status')}}?id={{$o_detail->order_detail_id}}&status=5" class="btn btn-round d-inline-block cancellation"><i class="fa fa-edit"></i>Cancelled</a>
    @endif
    @if($o_detail->status==1)
    <a href="{{route('web.order.status')}}?id={{$o_detail->order_detail_id}}&status=3" class="btn btn-round d-inline-block"><i class="fa fa-edit"></i>Processing</a>
    <!-- <a href="{{route('web.order.status')}}?id={{$o_detail->order_detail_id}}&status=4" class="btn btn-round d-inline-block"><i class="fa fa-edit"></i>Delivered</a> -->
    @endif
    <!-- @if($o_detail->status==3)
    <a href="{{route('web.order.status')}}?id={{$o_detail->order_detail_id}}&status=4" class="btn btn-round d-inline-block"><i class="fa fa-edit"></i>Delivered</a>
    @endif -->

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

        if (confirm('Do u  want to cancel this order?')) {
            location.href = url;
        }

    });
</script>
<script>
    $('#approved').click(function(e) {
        e.preventDefault();
        url = $(this).attr('href');

        if (confirm('Are you sure about approval of this order?')) {
            location.href = url;
        }

    });
</script>
@endsection