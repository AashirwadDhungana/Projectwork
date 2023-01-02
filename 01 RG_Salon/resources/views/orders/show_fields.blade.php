<?php $order=\App\Models\Order::find($order_detail->order_id);  ?>
@if($order)
<div class="row">
    <div class="col-md-6">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h3><i class="fa fa-align-right"></i> Order Details</h3></div>
            <div class="panel-body facts">
                <table class="table table-striped" style="width:100%" class="toc" id="toc">

                        <tbody>
                        <tr>
                            <th>Order Number</th>
                            <td>{{$order->order_number}}</td>
                        </tr>
                        <tr>
                            <th>Date</th>
                            <td>{{$order->order_date->format('M d, Y')}}</td>
                        </tr>
                        <tr>
                            <th>User</th>
                            <td>{{$order->user->name}}</td>
                        </tr>
                        <tr>
                            <th>Contact</th>
                            <td>{{$order->user->email}}<br>{{$order->user->phone}}</td>
                        </tr>
                        <tr>
                            <th>Product</th>
                            <td>{{$order_detail->product->title}}<br>
                            <a  href="{{ route('products.show', [$order_detail->product->id]) }}"><span class="btn btn-success">Detail</span> </a>
                            </td>
                        </tr>
                        <tr>
                            <th>Price</th>
                            <td>Rs.{{$order_detail->product->price}}</td>
                        </tr>
                        <tr>
                            <th>Quantity</th>
                            <td>{{$order_detail->quantity}}</td>
                        </tr>
                        <tr>
                            <th>Total</th>
                            <td>Rs.{{$order_detail->total}}</td>
                        </tr>
                        @if($order->shipping_id==Null)
                        <tr>
                            <th>Delivery</th>
                            <td>No Delivery</td>
                        </tr>
                        @endif
                        <tr>
                            <?php $status=['New Order','Approved','Cancelled By User','Processing','Delivered','Cancelled By Seller']; ?>
                            <th>Status</th>
                            <td>{{$status[$order_detail->status]}}</td>
                        </tr>
                        </tbody>
                </table>

            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h3><i class="fa fa-align-right"></i> Seller Details</h3></div>
            <div class="panel-body facts">
                <table class="table table-striped" style="width:100%" class="toc" id="toc">
                    <?php $seller=$order_detail->product->user ?>
                    @if($seller)

                            <tbody>
                            <tr>
                                <th>Name</th>
                                <td>{{$seller->name}}</td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td>{{$seller->email}}</td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td>{{$seller->phone}}</td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td>{{$seller->area->name}},{{$seller->cities->name}},<br>{{$seller->region->name}}</td>
                            </tr>
                            <tr>
                                <th>Member Since</th>
                                <td>{!! $seller->created_at->format('M d, Y') !!}
                                </td>
                            </tr>
                            </tbody>
                        @endif

                </table>

            </div>
        </div>
    </div>
</div>

<div class="row" style="margin-top: 20px;">
    <?php $shipping=$order->shipping; ?>
    @if($shipping!=Null)
<div class="col-md-6">
    <div class="panel panel-default">

        <div class="panel-heading">
            <h3><i class="fa fa-align-right"></i> Shipping Details</h3></div>
        <div class="panel-body facts">
            <table class="table table-striped" style="width:100%" class="toc" id="toc">

                    <tbody>
                    <tr>
                        <th>Name</th>
                        <td>{{$shipping->name}}</td>
                    </tr>
                    <tr>
                        <th>Email</th>
                        <td>{{$shipping->email}}</td>
                    </tr>
                    <tr>
                        <th>Phone</th>
                        <td>{{$shipping->phone}}</td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>{{$shipping->area->name}},{{$shipping->cities->name}},<br>{{$shipping->region->name}}</td>
                    </tr>
                    </tbody>

            </table>

        </div>
    </div>
</div>
        @endif
</div>
@endif


