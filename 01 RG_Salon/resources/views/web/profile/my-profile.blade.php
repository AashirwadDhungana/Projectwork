@extends('web.layouts.app1')
@section('styles')
    <style>
        .custom-select
        {
            height: calc(2.25rem + 7px);
            border-radius: 2.25rem;
            border: 1px solid #ebebeb;
        }
    </style>
    @endsection
@section('content')
    <?php $user=\Illuminate\Support\Facades\Auth::user();
    $regions=\App\Models\Region::pluck('name','id')->toArray();
    $cities=\App\Models\City::pluck('name','id')->toArray();
    $areas=\App\Models\Area::pluck('name','id')->toArray();
    ?>

    <div class="col-lg-9 col-12 mb-30">
        <div class="myaccount-content">
            <div class="float-right">
                @if($user->image==null)
                    <img src="{{ imageUrl('web/assets/images/7.png',120,120,100) }}">
                    @else
                    <img src="{{ imageUrl('storage/'.$user->image,120,120,100) }}">
                @endif
            </div>
            <div class="welcome">
                <p>Hello&nbsp;<strong>{{$user->name}},<br></strong></p>
            </div>
                <p class="mb-0">Thank you for Login!<br>From your account dashboard, you can easily add,edit  and view your ad and purchase details and edit your password and account details.</p>
        </div>
        @include('web.profile.my-account')
    </div>
@endsection
@section('scripts')
    <script>
        $(document).ready(function() {

            $(document).on('change', '#select_region', function (event) {
                var region = $(this).val();
                var type='region'
                if (region) {
                    $.ajax({
                        url: "/select/address",
                        method: "GET",
                        data: {region: region,type:type},
                        success: function (res) {
                            $('#select_city').removeAttr('disabled');
                            $('#select_city').empty();
                            $("#select_city").append('<option>Select City</option>');
                            if (res) {
                                $.each(res, function (key, value) {
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
            $(document).on('change', '#select_city', function (event) {
                var city = $(this).val();
                var type='city'
                if (city) {
                    $.ajax({
                        url: "/select/address",
                        method: "GET",
                        data: {city: city,type:type},
                        success: function (res) {
                            $('#select_area').removeAttr('disabled');
                            $('#select_area').empty();
                            $("#select_area").append('<option>Select Area</option>');

                            if (res) {
                                $.each(res, function (key, value) {
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
