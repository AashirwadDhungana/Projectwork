<div class="product-section magazine_section section pb-lg-80 pb-md-70">
    <div class="container">

        <!-- Section Title Start -->
        <div class="row">
            <div class="col">
                <div class="section-title float-left mb-30 mb-xs-40">
                    <h1>New Products</h1>
                </div>
                <!-- <div class="float-right mb-30 mb-xs-40">
                    <a href="#" class="btn btn-lg btn-round">View All</a>
                </div> -->
            </div>
        </div><!-- Section Title End -->

        <div class="row">

            <!-- Product Slider 4 Column Start-->
            <div class="product-slider product-slider-4 section">
                @foreach($newproducts as $newproduct)
                <?php $product_rating = \App\Models\Review::where('product_id', $newproduct->id)->avg('rating');
                //  $s_qty=\App\Models\OrderDetail::select('quantity')->where('product_id',$product->id)->whereIn('status',[1,3,4])->sum('quantity'); 
                $s_qty = $newproduct->sold_qty; ?>
                <!-- Product Item Start -->
                <div class="col">
                    <div class="product-item">
                        <!-- Image -->
                        <div class="product-image">
                            <!-- Image -->
                            <a href="{!! route('web.product.show',['slug'=>$newproduct->product_code]) !!}" class="image"><img src="{{imageUrl('storage/'.$newproduct->featured_image,230,278,100)}}" alt=""></a>
                            <!-- Product Action -->
                            @if($newproduct->status==3 && ($newproduct->quantity-$newproduct->sold_qty)!=0)

                            <div class="product-action">
                                @if(\Illuminate\Support\Facades\Auth::check())
                                @if(\Illuminate\Support\Facades\Auth::user()->id==$newproduct->user_id)

                                @else

                                @if($newproduct->delivery==0)
                                <a href="{{route('web.cart.add',['product_code'=>$newproduct->product_code])}}" class="buy"><i class=" fa fa-cart-plus" style="font-size: 30px;" title="Add To Cart"></i></a>
                                @endif
                                <a href="{{route('web.order.session',['type'=>$newproduct->product_code])}}" class="buy"><i class="fa fa-money" style="font-size: 30px;" title="Buy Now"></i></a>
                                @endif
                                @else

                                @if($newproduct->delivery==0)
                                <a href="{{route('web.cart.add',['product_code'=>$newproduct->product_code])}}" class="buy"><i class="fa fa-cart-plus" style="font-size: 30px;" title="Add To Cart"></i></a>

                                @endif
                                <a href="{{route('web.order.session',['type'=>$newproduct->product_code])}}" class="buy"><i class="fa fa-money" style="font-size: 30px;" title="Buy Now"></i></a>

                                @endif
                            </div>
                            @endif
                        </div>
                        <!-- Content -->
                        <div class="product-content">
                            <div class="head">
                                <!-- Title -->
                                <div class="top">
                                    <h4 class="title"><a href="{!! route('web.product.show',['slug'=>$newproduct->product_code]) !!}">{!! $newproduct->title !!}</a></h4>
                                </div>
                                <!-- Price & Ratting -->
                                <div class="bottom">
                                    <span class="price">Rs.{!! $newproduct->price !!}</span>
                                    <span class="ratting">
                                        @for($x = 5; $x > 0; $x--)
                                        @php
                                        if($product_rating > 0.5){
                                        echo ' <i class="fa fa-star"></i>';
                                        }elseif($product_rating <= 0 ){ echo '<i class="fa fa-star-o"></i>' ; }else{ echo '<i class="fa fa-star-half-o"></i>' ; } $product_rating--; @endphp @endfor </div> </div> </div> </div> </div> <!-- Product Item End -->
                                            @endforeach

                                </div><!-- Product Slider 4 Column Start-->
                            </div>
                        </div>
                    </div><!-- Product Section End -->