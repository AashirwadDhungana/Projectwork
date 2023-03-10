

<div class="myaccount-content">
    <h3>Account Details</h3>
    <div class="account-details-form">
        <form action="{{route('web.edit-account')}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-lg-4 col-12 mb-20">
                    <input placeholder="Name" type="text" name="name" value="{{$user->name}}">
                    @if ($errors->has('name'))
                        <span class="textred">
                            {{ $errors->first('name') }}
                        </span>
                    @endif
                </div>
                <div class="col-lg-4 col-12 mb-20">
                    <input placeholder="Enter your email" type="email" name="email" value="{{$user->email}}">
                    @if ($errors->has('email'))
                        <span class="textred">
                            {{ $errors->first('email') }}
                        </span>
                    @endif
                </div>

                <div class="col-lg-4 col-12 mb-20">
                    <input placeholder="Phone" type="text" name="phone" value="{{$user->phone}}">
                    @if ($errors->has('phone'))
                    <span class="textred">
                        {{ $errors->first('phone') }}
                    </span>
                    @endif
                </div>
              <div class="col-lg-6 col-12 mb-20">
                    {{ Form::select('region_id', $regions,$user->region_id, array('class' => 'browser-default custom-select','id'=>'select_region','placeholder'=>'Select region')) }}

                </div>
                @if($user->city_id!=null || $user->region_id!=null )
                    <?php $cities=\App\Models\City::where('region_id',$user->region_id)->pluck('name','id')->toArray(); ?>
                    <div class="col-lg-6 col-12 mb-20">
                        {{ Form::select('city_id', $cities,$user->city_id, array('class' => 'browser-default custom-select','id'=>'select_city','placeholder'=>'Select City')) }}
                    </div>
                    @else
                    <div class="col-lg-6 col-12 mb-20">
                        {{ Form::select('city_id', $cities,null, array('class' => 'browser-default custom-select','id'=>'select_city','placeholder'=>'Select City','disabled' => 'disabled')) }}
                    </div>
                @endif
                @if($user->area_id!=null|| $user->city_id!=null )
                    <?php $areas=\App\Models\Area::where('city_id',$user->city_id)->pluck('name','id')->toArray(); ?>
                        <div class="col-lg-6 col-12 mb-20">
                            {{ Form::select('area_id', $areas,$user->area_id, array('class' => 'browser-default custom-select','id'=>'select_area','placeholder'=>'Select Area')) }}
                        </div>
                    @else
                    <div class="col-lg-6 col-12 mb-20">
                        {{ Form::select('area_id', $areas,null, array('class' => 'browser-default custom-select','id'=>'select_area','placeholder'=>'Select Area','disabled' => 'disabled')) }}
                    </div>

                @endif





                {{--<div class="col-lg-4 col-12 mb-20">--}}
                    {{--<input placeholder="Address1" type="text" name="address1" value="{{$user->address1}}">--}}
                    {{--@if ($errors->has('address1'))--}}
                        {{--<span class="textred">--}}
                        {{--{{ $errors->first('address1') }}--}}
                    {{--</span>--}}
                    {{--@endif--}}
                {{--</div>--}}
                {{--<div class="col-lg-4 col-12 mb-20">--}}
                    {{--<input placeholder="Address2" type="text" name="address2" value="{{$user->address2}}">--}}
                    {{--@if ($errors->has('address2'))--}}
                        {{--<span class="textred">--}}
                        {{--{{ $errors->first('address2') }}--}}
                    {{--</span>--}}
                    {{--@endif--}}
                {{--</div>--}}
                <div class="col-lg-4 col-12 mb-20">
                    <input  type="file" name="image">
                </div>
                <div class="col-12">
                    <button  class="btn btn-round btn-lg" type="submit">Save changes</button>
                </div>
            </div>
        </form>
    </div>
</div>


