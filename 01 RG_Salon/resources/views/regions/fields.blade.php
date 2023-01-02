<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control']) !!}
</div>
<div class="form-group col-sm-6">
    {!! Form::label('city_id', 'City') !!}
    @if(isset($region))
        {!! Form::select('city_id[]',$cities,$selected_cities, ['class' => 'form-control js-multiple','multiple'=>'multiple']) !!}
    @else
        {!! Form::select('city_id[]',$cities, null, ['class' => 'form-control js-multiple','multiple'=>'multiple']) !!}
    @endif

</div>
<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('regions.index') }}" class="btn btn-secondary">Cancel</a>
</div>
