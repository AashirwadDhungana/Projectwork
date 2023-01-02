@extends('web.layouts.app1')
@section('title')
Orders
@endsection

@section('content')
<div class="myaccount-content" style="width:75%;">
    @if($appointments)


    <h3>My Bookings</h3>

    <div class="myaccount-table table-responsive text-center">
        <table class="table table-bordered">
            <thead class="thead-light">
                <tr>
                    <th>Stylist</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Status</th>
                    <th>Action</th>

                </tr>
            </thead>

            <tbody>
                @foreach($appointments as $key =>$appointment)

                <tr>
                    <td class="pro-thumbnail">
                        {{$appointment->stylist->name}}
                    </td>


                    <td>{{$appointment->date->format('M d, Y')}}</td>
                    <td>{{$appointment->time->format('H:i')}}</td>
                    <td>@if($appointment->status==0)
                        <h4>Booked</h4>
                        @elseif($appointment->status==1)
                        <h4>Cancelled</h4>
                        @endif</td>
                    <td>
                        @if($appointment->status==0)
                        <a href="{{route('web.bookings.status',['id'=>$appointment->id,'status'=>1])}}" class="btn btn-round" style="margin-top: 10px;">Cancelled</a>
                        @endif
                    </td>

                </tr>
                @endforeach

            </tbody>
        </table>
        <div class="float-right mr-3">



        </div>
    </div>





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

        if (confirm('Do u  want to cancel your order?')) {
            location.href = url;
        }

    });
</script>
@endsection