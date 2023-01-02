@extends('web.layouts.app')
@section('styles')
<style>

</style>
@endsection
@section('content')
<!-- Product Section Start -->
<div class="product-section section pt-40 pb-50">
    <div class="container">
        <div class="section-title left mb-30 mb-xs-40">
            <h1>Hair Stylists</h1>
        </div>

        <div class="shop-product-wrap grid row">




            @foreach($stylists as $stylist)

            <div class="col-xl-3 col-lg-4 col-sm-6 col-12 mb-30">
                <div class="product-item">
                    <!-- Image -->
                    <div class="product-image">
                        <!-- Image -->
                        <a href="#" class="image"><img src="{{imageUrl('storage/'.$stylist->image,230,278,100)}}" alt=""></a>
                        <!-- Product Action -->

                        <div class="product-action">


                            <div class="buttons">
                                <a href="#" class="buy" data-toggle="modal" data-target="{{'#exampleModal'.$stylist->id}}">Book Now</a>

                            </div>



                        </div>

                    </div>
                    <!-- Content -->
                    <div class="product-content">
                        <div class="head">
                            <!-- Title-->
                            <div class="top">
                                <h4 class="title"><a href="#">{{$stylist->name}}</a></h4>
                            </div>
                            <div class="top">
                                <h4 class="title"><a href="#">{{$stylist->specialist}}</a></h4>
                            </div>
                            <!-- Price & Ratting -->
                            <div class="bottom">
                                <span class="price">{{$stylist->start_time->format('h:i A')}}-{{$stylist->end_time->format('h:i A')}}</span>
                                <span class="ratting">





                            </div>



                        </div>
                    </div><!-- Product Section End -->
                    <div class="modal fade" id="{{'exampleModal'.$stylist->id}}" tabindex="-1" role="dialog" aria-labelledby="{{'#exampleModalLabel'.$stylist->id}}" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 class="modal-title" id="{{'#exampleModalLabel'.$stylist->id}}"><i class="fa fa-envelope" style="font-size: 29px;"></i>&nbsp;{{$stylist->name}}</h3>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>

                                <div class="modal-body">
                                    <form action="{{route('web.stylists.booking',['id'=>$stylist->id])}}" method="post">
                                        @csrf
                                        <div class="row">
                                            <input type="hidden" name="stylist_id" value={{$stylist->id}}>

                                            <div class="col-md-12 mb-20">
                                                <input type="date" placeholder="Choose Date" name="date" style="width:85%;height: 116%;">
                                            </div>

                                            <div class="col-md-12 mb-20">
                                                <input type="time" placeholder="Choose Time" name="time" style="width:85%;height: 116%;">
                                            </div>



                                        </div>
                                        <button class="btn btn-primary" style="height:38px;margin-top: -2px;">Book</button>
                                    </form>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>

            </div>
            @endforeach
            <div class="row mt-20">
                <div class="col">

                    {!! $stylists->links()!!}

                </div>
            </div>

        </div>
    </div>
</div>
@endsection