@extends('layouts.app')

@section('content')
<ol class="breadcrumb">
    <li class="breadcrumb-item">Appointments</li>
</ol>
<div class="container-fluid">
    <div class="animated fadeIn">
        @include('flash::message')
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i>
                        Appointments
                        <a class="pull-right" href="{{ route('stylists.create') }}"><i class="fa fa-plus-square fa-lg"></i></a>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive-sm">
                            <table class="table table-striped" id="categories-table">
                                <thead>
                                    <th>Stylist Name</th>
                                    <th>User Name</th>
                                    <th>Date</th>
                                    <th>Time </th>
                                    <th>Status </th>

                                </thead>
                                <tbody>
                                    @foreach($appointments as $appointment)
                                    <tr>
                                        <td>{{ $appointment->stylist->name }}</td>
                                        <td>{{ $appointment->user->name }}</td>
                                        <td>{{$appointment->date->format('M-d-y')}}</td>
                                        <td>{{$appointment->time->format('h:i A')}}</td>
                                        <td>
                                            @if($appointment->status==0)
                                            <h5>Booked</h5>
                                            @elseif($appointment->status==1)
                                            <h5>Cancelled</h5>
                                            @endif</td>

                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection