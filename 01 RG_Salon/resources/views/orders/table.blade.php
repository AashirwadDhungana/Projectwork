<div class="table-responsive-sm">
    <table class="table table-striped" id="categories-table">
        <thead>
            <th>Order Number</th>
            <th>User</th>
            <th>Date</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Total</th>
            <th>Status</th>
            <th>Action</th>
        </thead>
        <tbody>
        @foreach($order_details as $order_detail)
            <?php $order=\App\Models\Order::find($order_detail->order_id);  ?>
            @if($order)
            <tr>
                <td>{{ $order->order_number }}</td>
                <td>{{ $order->user->name }}</td>
                <td>{{ $order->order_date->format('M d, Y')}}</td>
                <td>{{$order_detail->product->title}}</td>
                <td>{{$order_detail->quantity}}</td>
                <td>Rs.{{$order_detail->total }}</td>
                <td> <?php $status=['New Order','Approved','Cancelled By User','Processing','Delivered','Cancelled By Seller']; ?>
                {{$status[$order_detail->status]}}</td>
                <td>
                    <div class='btn-group'>
                        <a href="{{ route('orders.show', [$order_detail->id]) }}" class='btn btn-ghost-success'><i class="fa fa-eye"></i></a>
                    </div>
                </td>
            </tr>
            @endif
        @endforeach
        </tbody>
    </table>
</div>
