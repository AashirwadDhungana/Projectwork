<!-- Shop Toolbar Start -->
<script>
    var page = '<?php echo $page ?>';
    var sort = '<?php echo $sort ?>';
    console.log(productView, sort);
</script>
@if($products->total()!=0)
<div class="row">
    <div class="col">
        <div class="shop-toolbar">
            <div class="product-showing mr-auto">
                <p>Showing {{$products->count()}} of {{$products->total()}}</p>
            </div>
            <div class="product-short">
                <p>Sort by</p>
                <select class="nice-select" id="select_product" name="select_product">
                    <option value="0" {{$sort == '0' ? 'selected' : ''}}>Newest Product</option>
                    <option value="1" {{$sort == '1' ? 'selected' : ''}}>Oldest Product</option>
                </select>
            </div>
        </div>
    </div>
</div><!-- Shop Toolbar End -->

<div class="shop-product-wrap grid row">

    @foreach($products as $product)
    <?php $product_rating = \App\Models\Review::where('product_id', $product->id)->avg('rating');
    //  $s_qty=\App\Models\OrderDetail::select('quantity')->where('product_id',$product->id)->whereIn('status',[1,3,4])->sum('quantity'); 
    $s_qty = $product->sold_qty; ?>
    <!-- Product Item Start -->
    <div class="col-xl-4 col-sm-6 col-12 mb-30">
        <div class="product-item grid">
            <!-- Image -->
            <div class="product-image">
                <!-- Image -->
                <a href="{!! route('web.product.show',['slug'=>$product->product_code]) !!}" class="image"><img src="{{imageUrl('storage/'.$product->featured_image,230,278,100)}}" alt=""></a>
                <!-- Product Action -->


                @if($product->status==3 && ($product->quantity-$product->sold_qty)!=0)

                <div class="product-action">
                    @if(\Illuminate\Support\Facades\Auth::check())
                    @if(\Illuminate\Support\Facades\Auth::user()->id==$product->user_id)

                    @else

                    @if($product->delivery==0)
                    <a href="{{route('web.cart.add',['product_code'=>$product->product_code])}}" class="buy"><i class=" fa fa-cart-plus" style="font-size: 30px;" title="Add To Cart"></i></a>
                    @endif
                    <a href="{{route('web.order.session',['type'=>$product->product_code])}}" class="buy"><i class="fa fa-money" style="font-size: 30px;" title="Buy Now"></i></a>
                    @endif
                    @else

                    @if($product->delivery==0)
                    <a href="{{route('web.cart.add',['product_code'=>$product->product_code])}}" class="buy"><i class="fa fa-cart-plus" style="font-size: 30px;" title="Add To Cart"></i></a>

                    @endif
                    <a href="{{route('web.order.session',['type'=>$product->product_code])}}" class="buy"><i class="fa fa-money" style="font-size: 30px;" title="Buy Now"></i></a>

                    @endif
                </div>
                @endif


            </div>
            <!-- Content -->
            <div class="product-content">
                <div class="head">
                    <!-- Title-->
                    <div class="top">
                        <h4 class="title"><a href="{!! route('web.product.show',['slug'=>$product->product_code]) !!}">{!! $product->title !!}</a></h4>
                    </div>
                    <!-- Price & Ratting -->
                    <div class="bottom">
                        <span class="price">Rs.{!! $product->price !!}</span>
                        <span class="ratting">
                            @for($x = 5; $x > 0; $x--)
                            @php
                            if($product_rating > 0.5){
                            echo ' <i class="fa fa-star"></i>';
                            }elseif($product_rating <= 0 ){ echo '<i class="fa fa-star-o"></i>' ; }else{ echo '<i class="fa fa-star-half-o"></i>' ; } $product_rating--; @endphp @endfor </span> </div> </div> </div> </div> </div> <!-- Product Item End -->

                                @endforeach

                    </div>

                    <div class="row mt-20">
                        <div class="col">

                            {!! $products->links()!!}

                        </div>
                    </div>
                    @else
                    <h4>No product found</h4>
                    @endif