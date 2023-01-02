<div class="table-responsive-sm">
    <table class="table table-striped" id="cities-table">
        <thead>
            <th>Name</th>
            <th>Cities</th>
            <th colspan="3">Action</th>
        </thead>
        <tbody>
        @foreach($regions as $region)
            <?php
            $cities=\App\Models\City::where('region_id',$region->id)->get();
            ?>
            <tr>
                <td>{{ $region->name }}</td>
                <td>
                    @foreach($cities as $city)
                        <div class="row">
                        {{$city->name}}
                        <div class='btn-group' style="margin-top: -7px;">
                            <a href="{{ route('cities.edit', [$city->id]) }}" class='btn btn-ghost-info'><i class="fa fa-edit"></i></a></div>
                        </div>
                        @endforeach
                </td>
                <td>
                    {!! Form::open(['route' => ['regions.destroy', $region->id], 'method' => 'delete']) !!}
                    <div class='btn-group'>
                        {{--<a href="{{ route('cities.show', [$region->id]) }}" class='btn btn-ghost-success'><i class="fa fa-eye"></i></a>--}}
                        <a href="{{ route('regions.edit', [$region->id]) }}" class='btn btn-ghost-info'><i class="fa fa-edit"></i></a>
                        {!! Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-ghost-danger', 'onclick' => "return confirm('Are you sure?')"]) !!}
                    </div>
                    {!! Form::close() !!}
                </td>
            </tr>
        @endforeach
        </tbody>
    </table>
</div>
