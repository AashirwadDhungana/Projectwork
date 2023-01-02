@extends('web.layouts.app')
@section('styles')
<style>
    .cart-table .table tbody tr td {

        border-bottom: 0px solid #dddddd;
    }

    .modal-dialog {

        max-width: 733px;
    }

    .modal {

        top: 120px;
    }

    .pay-btn {
        margin-left: 28px;

        background-color: #d0a97e;

        color: #222;

        border-color: #d0a97e;
    }

    .pay-btn:hover {

        background-color: #222;

        color: #d0a97e;

        border-color: #222;
    }

    .cash-btn {
        border-radius: 4px !important;

        margin-top: 2px !important;

        margin-right: 19px !important;
    }
</style>
@endsection

@section('content')


<!-- Cart Section Start -->
<div class="cart-section section position-relative pt-90 pb-60 pt-lg-80 pb-lg-50 pt-md-70 pb-md-40 pt-sm-60 pb-sm-30 pt-xs-50 pb-xs-20 fix">
    <div class="container">
        <div class="row">
            <div class="col-12">
                @if($messages=Session::get('success'))

                <div class="alert alert-success">
                    <p>{{$messages}}</p>
                </div>

                @endif
                @if($messages=Session::get('danger'))
                <div class="alert alert-danger">
                    <p>{{$messages}}</p>
                </div>
                @endif
                @if(isset($message))
                <div class="col-12">
                    <div class="alert alert-success">
                        <p>{{$message}}</p>
                    </div>
                </div>
                @endif
            </div>
        </div>
    </div>

    <?php $user = \Illuminate\Support\Facades\Auth::user();
    $shipping_details = \App\Models\Shipping::where('user_id', $user->id)->orderBY('created_at', 'desc')->first();
    ?>
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="row">

                    <div class="col-lg-6 col-12 mb-5">
                        <div class="cart-table">
                            <table class="table">
                                <tbody>
                                    <?php
                                    $allitems = \Illuminate\Support\Facades\Session::get('checkout_products');

                                    $total_amt = 0;
                                    $shipping_amt = 0;
                                    $unbutton = [];
                                    if (count($allitems) == 0) {
                                        $unvalid_data = 1;
                                        $unbutton[] = 1;
                                    }



                                    ?>
                                    @foreach($allitems as $l=> $u_cart)
                                    <?php
                                    $product = \App\Models\Product::where('product_code', $u_cart['product_code'])->first();
                                    // $s_qty = \App\Models\OrderDetail::select('quantity')->where('product_id', $product->id)->whereIn('status', [0, 1, 3, 4])->sum('quantity');
                                    if ($product != null) {
                                        $s_qty = $product->sold_qty;
                                    } ?>

                                    @if($product!=null)
                                    <?php
                                    if ($product->delivery == 1) {
                                        $no_delivery = 1;
                                    } else {
                                        if ($product->delivery_area == 0) {
                                            if ($shipping_details->city_id != $product->user->city_id) {
                                                $unvalid_data = 1;
                                                $unbutton[] = 1;
                                            }
                                        } elseif ($product->delivery_area == 1) {
                                            if ($shipping_details->region_id != $product->user->region_id) {
                                                $unvalid_data = 1;
                                                $unbutton[] = 1;
                                            }
                                        }
                                    }

                                    ?>
                                    @if(($product->quantity - $s_qty)!=0 && $product->status==3)
                                    <tr>
                                        <td class="pro-thumbnail"><img src="{{imageUrl('storage/'.$product->featured_image,490,700,100)}}" alt="Product"></td>
                                        <td class="pro-title"><a href="#" onclick="return false;">{{$product->title}}</a></td>
                                        <td class="pro-price"><span>Rs.{{$product->price}}</span></td>
                                        <td class="pro-quantity">
                                            <div class="pro-qty"><input type="text" value="{{$u_cart['quantity']}}" name="quantity">
                                                <input type="hidden" value="{{$product->price}}" name="price">
                                                <input type="hidden" value="{{$product->product_code}}" name="product_code">
                                                <input type="hidden" value="{{$l}}" name="key">
                                                <input type="hidden" value="{{$product->quantity-$s_qty}}" name="product-qty"></div>
                                        </td>
                                        <td class="pro-subtotal" id="cart-total{{$l}}"><span>Rs.{{$u_cart['quantity']*$product->price}}</span></td>
                                        <?php $total_amt += $u_cart['quantity'] * $product->price; ?>
                                    </tr>
                                    @if(isset($unvalid_data) && $unvalid_data==1)
                                    <tr>
                                        <td colspan="5" style="padding-top: 0px;!important;">
                                            <p style="color:red;">Product couldnt delivered in your address</p>
                                        </td>

                                    </tr>
                                    @endif
                                    @endif
                                    @endif
                                    @endforeach

                                </tbody>
                            </table>
                        </div>

                    </div>










                    <!-- Cart Summary -->







                    <div class="col-lg-6 col-12 mb-30 d-flex">
                        <div class="cart-summary">
                            <div class="cart-summary-wrap">
                                @if(isset($no_delivery) && $no_delivery==1)
                                @else
                                @if($shipping_details!=null)
                                <h4>Shipping & Billing</h4>
                                <p><i class="fa fa-user" style="color:#d0a97e;"></i></i>&nbsp;{{$shipping_details->name}}<span class="btn" data-toggle="modal" data-target="#exampleModal">Edit</span></p>
                                <p><i class="fa fa-map-marker" style="color:#d0a97e;"></i></i>&nbsp;{{$shipping_details->area->name}},{{$shipping_details->cities->name}},<br>{{$shipping_details->region->name}},Nepal<span class="btn" data-toggle="modal" data-target="#exampleModal">Edit</span></p>
                                <p><i class="fa fa-phone" style="color:#d0a97e;"></i></i>&nbsp;{{$shipping_details->phone}}<span class="btn" data-toggle="modal" data-target="#exampleModal">Edit</span></p>
                                <p><i class="fa fa-envelope" style="color:#d0a97e;"></i></i>&nbsp;{{$shipping_details->email}}<span class="btn" data-toggle="modal" data-target="#exampleModal">Edit</span></p>



                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h3 class="modal-title" id="exampleModalLabel">Edit your shipping address</h3> <a href="{{route('web.shipping.index')}}" class="btn btn-primary" style="margin-left: 20px;">Add new address</a>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>

                                            <div class="modal-body">
                                                <form action="{{route('web.shipping.update',['id'=>$shipping_details->id])}}" class="checkout-form" method="post">
                                                    @csrf
                                                    <div class="row">
                                                        <div class="col-md-4 col-12 mb-20">
                                                            <label>Name*</label>
                                                            <input type="text" placeholder="Name" name="name" value="{{$shipping_details->name}}">
                                                        </div>

                                                        <div class="col-md-4 col-12 mb-20">
                                                            <label>Email Address*</label>
                                                            <input type="email" placeholder="Email Address" name="email" value="{{$shipping_details->email}}">
                                                        </div>

                                                        <div class="col-md-4 col-12 mb-20">
                                                            <label>Phone no*</label>
                                                            <input type="text" placeholder="Phone number" name="phone" value="{{$shipping_details->phone}}">
                                                        </div>

                                                        <?php
                                                        $regions = \App\Models\Region::pluck('name', 'id')->toArray();
                                                        $cities = \App\Models\City::pluck('name', 'id')->toArray();
                                                        $areas = \App\Models\Area::pluck('name', 'id')->toArray(); ?>
                                                        <div class="col-md-4 col-12 mb-20">

                                                            <label>Region*</label>
                                                            {{ Form::select('region_id', $regions,$shipping_details->region_id, array('class' => 'browser-default custom-select','id'=>'select_region','placeholder'=>'Select region')) }}
                                                        </div>
                                                        <div class="col-md-4 col-12 mb-20">

                                                            <label>City*</label>
                                                            @if($shipping_details->city_id!=null || $shipping_details->region_id!=null )
                                                            <?php $cities = \App\Models\City::where('region_id', $shipping_details->region_id)->pluck('name', 'id')->toArray(); ?>
                                                            {{ Form::select('city_id', $cities,$shipping_details->city_id, array('class' => 'browser-default custom-select','id'=>'select_city','placeholder'=>'Select City')) }}
                                                            @else
                                                            {{ Form::select('city_id', $cities,null, array('class' => 'browser-default custom-select','id'=>'select_city','placeholder'=>'Select City','disabled' => 'disabled')) }}
                                                            @endif
                                                        </div>
                                                        <div class="col-md-4 col-12 mb-20">

                                                            <label>Area*</label>

                                                            @if($shipping_details->area_id!=null|| $shipping_details->city_id!=null )
                                                            <?php $areas = \App\Models\Area::where('city_id', $shipping_details->city_id)->pluck('name', 'id')->toArray(); ?>
                                                            {{ Form::select('area_id', $areas,$shipping_details->area_id, array('class' => 'browser-default custom-select','id'=>'select_area','placeholder'=>'Select Area')) }}

                                                            @else
                                                            {{ Form::select('area_id', $areas,null, array('class' => 'browser-default custom-select','id'=>'select_area','placeholder'=>'Select Area','disabled' => 'disabled')) }}

                                                            @endif
                                                        </div>


                                                    </div>
                                                    <button class="btn btn-primary">Save changes</button>
                                                </form>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                                <h2 style="margin-top: 10px;"></h2>
                                @endif
                                @endif












                                <h4 style="margin-top: 35px;">Order Summary</h4>
                                <?php $order_total = \Illuminate\Support\Facades\Session::get('order_total');
                                $order_number = \Illuminate\Support\Str::random('12');
                                \Illuminate\Support\Facades\Session::put('order_number', $order_number); ?>
                                <p>Sub Total <span class="order-total">Rs.{{$order_total}}</span></p>
                                <p>Shipping Cost <span>$00.00</span></p>
                                <h2>Grand Total <span class="order-total">Rs.{{$order_total}}</span></h2>
                            </div>
                            <div class="cart-summary-button">
                                <div class="row">
                                    <div class="col-md-6">
                                        {{--<form action="https://uat.esewa.com.np/epay/main" method="POST">--}}
                                        {{--<input value="{{$order_total}}" name="tAmt" type="hidden">--}}
                                        {{--<input value="{{$order_total}}" name="amt" type="hidden">--}}
                                        {{--<input value="0" name="txAmt" type="hidden">--}}
                                        {{--<input value="0" name="psc" type="hidden">--}}
                                        {{--<input value="0" name="pdc" type="hidden">--}}
                                        {{--<input value="epay_payment" name="scd" type="hidden">--}}
                                        {{--<input value="{{$order_number}}" name="pid" type="hidden">--}}
                                        {{--<input value="{{route('web.esewa.success')}}?q=su" type="hidden" name="su">--}}
                                        {{--<input value="{{route('web.esewa.failed')}}?q=fu" type="hidden" name="fu">--}}
                                        {{--@if(in_array(1,$unbutton))--}}
                                        {{--<input value="Pay With Esewa" type="submit" class="pay-btn btn checkout-btn disabled">--}}
                                        {{--@else--}}
                                        {{--<input value="Pay With Esewa" type="submit" class="pay-btn btn checkout-btn">--}}
                                        {{--@endif--}}
                                        {{--</form>--}}
                                    </div>
                                    <div class="col-md-6">
                                        @if(in_array(1,$unbutton))
                                        <button class="btn cash-btn checkout-btn disabled" data-toggle="modal" data-target="#cod" disabled>Confirm Order</button>
                                        @else
                                        <button class="btn cash-btn checkout-btn" data-toggle="modal" data-target="#cod">Confirm Order</button>
                                        @endif
                                        <div class="modal fade" id="cod" tabindex="-1" role="dialog" aria-labelledby="codLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h3 class="modal-title" id="codLabel">Confirm Your Order</h3>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="{{route('web.order.create')}}" class="checkout-form" method="post">
                                                            @csrf
                                                            <div class="row" style="margin-left: 30px;">
                                                                @if(isset($no_delivery) && $no_delivery==1)
                                                                @else
                                                                <input type="hidden" name="shipping_id" value="{{$shipping_details->id}}">
                                                                @endif
                                                                <input type="checkbox" name="phone" value="1"><label>Visible your name and phone number to seller</label></div>





                                                            <button class="btn cash-btn primary-btn" style="background-color: #222;color:#d0a97e;">Confirm Order</button>

                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            </div>

                        </div>
                    </div>


                </div>

            </div>
        </div>
    </div>

</div><!-- Cart Section End -->

@endsection
@section('scripts')
<script>
    $('.pro-qty').prepend('<span class="dec qtybtn">-</span>');
    $('.pro-qty').append('<span class="inc qtybtn">+</span>');
    $('.qtybtn').on('click', function() {
        var $button = $(this);
        var oldValue = $button.parent().find("input[name='quantity']").val();
        var key = $button.parent().find("input[name='key']").val();
        var price = $button.parent().find("input[name='price']").val();
        var code = $button.parent().find("input[name='product_code']").val();
        var quantity = $button.parent().find("input[name='product-qty']").val();
        if ($button.hasClass('inc')) {
            if (parseFloat(oldValue) < quantity) {
                var newVal = parseFloat(oldValue) + 1;
            } else {
                var newVal = parseFloat(oldValue);
            }

        } else {
            // Don't allow decrementing below zero
            if (oldValue > 1) {
                var newVal = parseFloat(oldValue) - 1;
            } else {
                newVal = 1;
            }
        }
        var total = newVal * price;
        $button.parent().find("input[name='quantity']").val(newVal);
        $.ajax({
            url: "{!! route('web.order.update.session') !!}",
            method: "GET",
            data: {
                product_code: code,
                qty: newVal
            },
            dataType: 'json',
            success: function(data) {
                $("#cart-total" + key).html('Rs.' + total);
                $('.order-total').html('Rs.' + data.or_total);
            }

        });
    });
</script>
<script>
    $(document).ready(function() {

        $(document).on('change', '#select_region', function(event) {
            var region = $(this).val();
            var type = 'region'
            if (region) {
                $.ajax({
                    url: "/select/address",
                    method: "GET",
                    data: {
                        region: region,
                        type: type
                    },
                    success: function(res) {
                        $('#select_city').removeAttr('disabled');
                        $('#select_city').empty();
                        $("#select_city").append('<option>Select City</option>');
                        if (res) {
                            $.each(res, function(key, value) {
                                $('#select_city').append($("<option/>", {
                                    value: key,
                                    text: value
                                }));
                            });
                        }
                    }
                })
            }
        });
        $(document).on('change', '#select_city', function(event) {
            var city = $(this).val();
            var type = 'city'
            if (city) {
                $.ajax({
                    url: "/select/address",
                    method: "GET",
                    data: {
                        city: city,
                        type: type
                    },
                    success: function(res) {
                        $('#select_area').removeAttr('disabled');
                        $('#select_area').empty();
                        $("#select_area").append('<option>Select Area</option>');

                        if (res) {
                            $.each(res, function(key, value) {
                                $('#select_area').append($("<option/>", {
                                    value: key,
                                    text: value
                                }));
                            });
                        }
                    }
                })
            }
        });

    });
</script>
@endsection