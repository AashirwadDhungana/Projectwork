<div class="table-responsive-sm">
    <table class="table table-striped" id="categories-table">
        <thead>
            <th>Name</th>
            <th>Specialist</th>
            <th>Image</th>
            <th>Time range</th>
            <th colspan="3">Action</th>
        </thead>
        <tbody>
            @foreach($stylists as $stylist)
            <tr>
                <td>{{ $stylist->name }}</td>
                <td>{{ $stylist->specialist }}</td>
                <td><img src="{{url('storage/'.$stylist->image)}}" width="100" height="100"></td>
                <td>{{ $stylist->start_time->format('h:i A') }}-{{ $stylist->end_time->format('h:i A') }}</td>
                <td>
                    {!! Form::open(['route' => ['stylists.destroy', $stylist->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        <a href="{{ route('stylists.edit', [$stylist->id]) }}" class='btn btn-ghost-info'><i class="fa fa-edit"></i></a>
                        {!! Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-ghost-danger', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>