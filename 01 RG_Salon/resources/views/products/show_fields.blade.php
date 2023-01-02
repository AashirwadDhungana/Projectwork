<?php $photos=\App\Models\Photo::where('product_id',$product->id)->get(); ?>
<div class="row">
    <div class="col-md-7">
        {{--<img src="{{asset('storage/'.$product->featured_image)}}" style="height:400px;width: 100%; display: block;">--}}

    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" style="width:100%;height:500px;">
            <div class="carousel-item active">
                <img class="d-block" src="{{imageUrl('storage/'.$product->featured_image,600,500,100)}}">
            </div>
            @foreach($photos as $photo)
            <div class="carousel-item">
                <img class="d-block" src="{{imageUrl('storage/products/'.$photo->image,600,500,100)}}">
            </div>
           @endforeach
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    </div>
    <div class="col-md-5">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h3><i class="fa fa-align-right"></i> Product Details  {{$product->status==4?'(SOLDOUT)':''}}</h3></div>
            <div class="panel-body facts">
                <table class="table table-striped" style="width:100%" class="toc" id="toc">
                    <tbody>
                    <tr>
                        <th>Name</th>
                        <td>{{$product->title}}</td>
                    </tr>
                    @foreach($product->sub_category as $subCategory)
                    <tr>
                        <th>Sub Category</th>
                        <td>{{$subCategory->name}}</td>
                    </tr>
                    @endforeach
                    <tr>
                        <th>Product Code</th>
                        <td>{{$product->product_code}}</td>
                    </tr>
                    <tr>
                        <th>Quantity</th>
                        <td>{{$product->quantity}}</td>
                    </tr>
                    <tr>
                        <th>Price</th>
                        <td>Rs.{{$product->price}}</td>
                    </tr>
                    <tr>
                        <th>Condition</th>
                        <td>{{$product->condition}}</td>
                    </tr>
                    <tr>
                        <th>Used For</th>
                        <td>{{$product->used_for}}</td>
                    </tr>
                    <tr>
                        <th>Warranty Period</th>
                        <td>{{$product->warranty_period}}</td>
                    </tr>
                    <tr>
                        <th>Expiry Time</th>
                        <td>{{$product->expiry_time}}&nbsp;month</td>
                    </tr>
                    @if($product->delivery==0)
                      <?php  $delivery_area=['within my area','within my city','anywhere in Nepal']; ?>
                    <tr>
                        <th>Delivery Area</th>
                        <td>{{$delivery_area[$product->delivery_area]}}</td>
                    </tr>
                    <tr>
                        <th>Delivery Charge</th>
                        <td>Rs.{{$product->delivery_charge}}</td>
                    </tr>
                        @endif
                    <tr>
                        <?php $status=['','','New Product','Approved Product','Sold out']; ?>
                        <th>Status</th>
                        <td>{{$status[$product->status]}}</td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-12" style="margin-bottom: 20px;margin-top: 40px;">

        <h3>Description</h3>
        {!! $product->description !!}
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        <h4>Attributes</h4>
        <div class="card">
            <div class="card-header">
                <i class="fa fa-align-justify"></i>
                Attributes
            </div>
            <div class="card-body">
                <div class="table-responsive-sm">
                    <table class="table table-striped" id="categories-table">
                        <thead>
                        <th>Feature</th>
                        <th>Value</th>
                        </thead>
                        <tbody>
                        @foreach($product->attribute as $attribute)
                            <tr>
                                <td>{{ $attribute->feature }}</td>
                                <td>{{ $attribute->pivot->value }}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <div class="pull-right mr-3">


                </div>
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="panel panel-default">

            <div class="panel-heading">
                <h3><i class="fa fa-align-right"></i> User Details</h3></div>
            <div class="panel-body facts">
                <?php $user=\App\User::find($product->user_id); ?>
                <table class="table table-striped" style="width:100%" class="toc" id="toc">
                    <tbody>
                    <tr>
                        <th>Name</th>
                        <td>{{$user->name}}</td>
                    </tr>
                        <tr>
                            <th>Email</th>
                            <td>{{$user->email}}</td>
                        </tr>
                    <tr>
                        <th>Phone</th>
                        <td>{{$user->phone}}</td>
                    </tr>
                    <tr>
                        <th>Address</th>
                        <td>{{$user->area->name}},{{$user->cities->name}},<br>{{$user->region->name}}</td>
                    </tr>
                    </tbody>
                </table>

            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-md-6">
        @if($product->status==2)
                <a  href="{!! route('product.approval', ['product_id'=>$product->id,'user_id'=>$user->id,'status'=>1]) !!}"><span class="btn btn-success">Approved</span> </a>
            <a  href="{!! route('product.approval', ['product_id'=>$product->id,'user_id'=>$user->id,'status'=>0]) !!}"><span class="btn btn-danger">Not Approved</span> </a>
            @endif
    </div>
</div>
