<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>RG Salon</title>
    <meta name="csrf-token" content="{{ csrf_token() }}" />
    <meta name="robots" content="noindex, follow" />
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Favicon -->
    {{--<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">--}}

    <!-- CSS
	============================================ -->

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{asset('web/assets/css/bootstrap.min.css')}}">

    <!-- Icon Font CSS -->
    <link rel="stylesheet" href="{{asset('web/assets/css/font-awesome.min.css')}}">

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="{{asset('web/assets/css/plugins.css')}}">

    <!-- Helper CSS -->
    <link rel="stylesheet" href="{{asset('web/assets/css/helper.css')}}">
<!-- owl-carousel.css -->
<link rel="stylesheet" href="{{asset('web/assets/css/owl-carousel.css')}}">
    <!-- Main Style CSS -->
    <link rel="stylesheet" href="{{asset('web/assets/css/style.css')}}">
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.4.0/min/dropzone.min.css">
    <!-- Modernizer JS -->
    @yield('styles')
    <script src="{{asset('web/assets/js/vendor/modernizr-2.8.3.min.js')}}"></script>
</head>

<body>
    <div class="main-wrapper">

        <!-- Header Section Start -->
        <div class="header-section section bg-theme">
            <div class="container">
                <div class="row">

                    <!-- Header Logo -->
                    @if(!\Illuminate\Support\Facades\Auth::check())
                    <div class="col">
                        <div class="header-logo">
                            <a href="#" onclick="return false;">
                                {{--<img src="assets/images/logo.png" alt="">--}}
                            </a>
                        </div>
                    </div>
                    @endif

                    <?php $allcategories = \App\Models\Category::all(); ?>
                    <!-- Main Menu -->
                    <div class="col d-none d-lg-block">
                        <nav class="main-menu" style="margin-right: 427px;">
                            <ul>
                                <li><a href="{{url('/')}}">HOME</a>
                                </li>
                                <li><a href="#" onclick="return false;">SHOP</a>
                                    <ul class="mega-menu">
                                        @foreach($allcategories as $cat)

                                        <li class="col"><a href="#">{{$cat->name}}</a>
                                            <ul>
                                                @foreach($cat->subcategories as $subcat) <li><a href="{!! route('web.products.index',['cat_slug'=>$subcat->slug]) !!}">{{$subcat->name}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach
                                    </ul>
                                </li>

                                @if(!\Illuminate\Support\Facades\Auth::check())
                                <li><a href="{{route('web.login-register')}}">LOGIN</a></li>
                                @else
                                <li><a href="{{route('web.my-profile')}}">MyAccount</a></li>
                                @endif
                                @if(\Illuminate\Support\Facades\Auth::check())
                                <li><a href="{{route('web.stylists.index')}}">Appointment</a></li>
                                @endif
                            </ul>
                        </nav>
                    </div>

                    <!-- Header Action -->
                    @if(\Illuminate\Support\Facades\Auth::check())
                    <!-- Header Action -->
                    <div class="col">

                        <div class="header-action">
                            <!-- Wishlist -->
                            <!-- Cart Wrap Start-->
                            <div class="header-cart-wrap">
                                <?php $unseen_no = \App\Models\Notification::where('user_id', \Illuminate\Support\Facades\Auth::user()->id)->where('status', 1)->count(); ?>
                                <!-- Cart Toggle -->
                                @if(isset($unseen_no) && $unseen_no!=0)
                                <a href="#" onclick="return false;" class="header-notification-toggle" onMouseOver="this.style.color='#000'" onMouseOut="this.style.color='#000'">
                                    <p style="margin-bottom: -23px !important;

margin-left: 18px !important;color: #222;font-weight: bold;font-size: 17px;" id="notify_result">{{$unseen_no}}</p><i class="fa fa-bell-o" style="font-size: 24px;margin-right: 20px;margin-top: 10px;"></i>
                                </a>
                                @else
                                <a href="#" onclick="return false;" class="header-notification-toggle" onMouseOver="this.style.color='#000'" onMouseOut="this.style.color='#000'"><i class="fa fa-bell-o" style="font-size: 24px;margin-right: 20px;margin-top: 19px;"></i></a>
                                @endif




                                <!-- Header Mini Cart Start -->
                                <div class="notification">
                                    <!-- Mini Cart Head -->
                                    <div class="mini-cart-head">
                                        <h3>Your Notification</h3>
                                    </div>
                                    <!-- Mini Cart Body -->
                                    <div class="mini-cart-body">
                                        <div class="mini-cart-body-inner" style=" overflow-y:scroll!important;">
                                            <ul>
                                                @if(isset($user_notifications))
                                                @foreach($user_notifications as $notification)
                                                @if($notification->status==1 || $notification->status==3 )
                                                <li class="mini-cart-product" style="background-color: #d0a97e;">
                                                    <a href="{{route('web.notification',$notification->id)}}">
                                                        <p class="title" style="color:#fff;"><i class="fa fa-arrow-circle-right"></i>&nbsp;{{$notification->message}}</p>
                                                    </a>

                                                </li>
                                                @elseif($notification->status==2)
                                                <li class="mini-cart-product">
                                                    <a href="{{route('web.notification',$notification->id)}}">
                                                        <p class="title" style="color:#fff;"><i class="fa fa-arrow-circle-right"></i>&nbsp;{{$notification->message}}</p>
                                                    </a>

                                                </li>
                                                @endif

                                                @endforeach
                                                @endif
                                            </ul>
                                        </div>
                                    </div>
                                </div><!-- Header Mini Cart End -->
                            </div>
                            <div class="header-cart-wrap" style="margin-top: 10px;">
                                <!-- Cart Toggle -->
                                <button class="header-cart-toggle"><span class="icon">cart</span></button>
                                <!-- Header Mini Cart Start -->
                                <div class="header-mini-cart">
                                    <!-- Mini Cart Head -->
                                    <div class="mini-cart-head">
                                        <h3>Your cart</h3>
                                    </div>
                                    <!-- Mini Cart Body -->
                                    <div class="mini-cart-body">
                                        <div class="mini-cart-body-inner custom-scroll">
                                            <ul>
                                                @if(isset($user_carts))
                                                <?php $total = 0; ?>
                                                @foreach($user_carts as $cart)
                                                <?php $item = \App\Models\Product::where('id', $cart->product_id)->first(); ?>

                                                @if(isset($item))
                                                @if(($item->quantity - $item->sold_qty)!=0 && $item->status==3)
                                                <!-- Mini Cart Product -->
                                                <li class="mini-cart-product">
                                                    <div class="image">
                                                        <img src="{{imageUrl('storage/'.$item->featured_image,90,100,100)}}" alt="{{$item->title}}"><a href="{{route('web.cart.delete',['id'=>$cart->id])}}"> <button class="remove"><i class="fa fa-trash-o"></i></button></a>


                                                    </div>
                                                    <div class="content">
                                                        <span class="title">{{$item->title}}</span>
                                                        <span>{{$cart->quantity}} x Rs.{{$item->price}}</span>
                                                    </div>
                                                </li>
                                                <?php
                                                $total += $cart->quantity * $item->price; ?>
                                                @endif
                                                @endif
                                                @endforeach
                                                @endif
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Mini Cart Footer -->
                                    <div class="mini-cart-footer">
                                        @if(isset($total))
                                        <h4>Subtotal: Rs.{{$total}}</h4>
                                        @endif
                                        <div class="buttons">
                                            <a href="{{route('web.cart.index')}}">View cart</a>
                                        </div>
                                    </div>
                                </div><!-- Header Mini Cart End -->
                            </div><!-- Cart Wrap End-->
                        </div>
                    </div>
                    @endif


                    <div class="col-12 d-block d-lg-none">
                        <div class="mobile-menu"></div>
                    </div>

                </div>
            </div>
        </div><!-- Header Section End -->