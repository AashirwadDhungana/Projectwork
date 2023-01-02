@extends('layouts.app')

@section('content')
    <ol class="breadcrumb">
        <li class="breadcrumb-item">Orders</li>
    </ol>
    <div class="container-fluid">
        <div class="animated fadeIn">
             @include('flash::message')
             <div class="row">
                 <div class="col-lg-12">
                     <div class="card">
                         <div class="card-header">
                             <i class="fa fa-align-justify"></i>
                             Orders
                         </div>
                         <div class="card-body">
                             <form name="myform" action="{{route('orders.index')}}" method="get">
                                 <div class="pull-left" style="margin-bottom: 20px;">
                                     <div class="wrapper">
                                         <input type="date"  name="date" onchange="sendform();" value="{{isset($date)?$date:''}}"/>
                                     </div>


                                 </div>
                                 <div class="pull-right" style="margin-bottom: 15px;">
                                     <div class="wrapper">


                                         <input type="text" value="{{isset($search)?$search:''}}" name="search"/>

                                         <button>Search</button>
                                     </div>
                                 </div>
                             </form>
                             @include('orders.table')
                              <div class="pull-right mr-3">
                                  {!! $order_details->appends(array('date' => $date,'search'=>$search))->links();  !!}
                              </div>
                         </div>
                     </div>
                  </div>
             </div>
         </div>
    </div>
@endsection
@section('scripts')
    <script type="text/javascript">
        function sendform()
        {
            document.myform.submit();
        }
    </script>
@endsection

