<!-- Name Field -->
<div class="form-group col-sm-6">
    {!! Form::label('name', 'Name:') !!}
    {!! Form::text('name', null, ['class' => 'form-control']) !!}
</div>


<!-- Specialist Field -->
<div class="form-group col-sm-6">
    {!! Form::label('specialist', 'Specialist:') !!}
    {!! Form::text('specialist', null, ['class' => 'form-control']) !!}
</div>
<!-- Time range Field -->
<div class="form-group col-sm-6">
    {!! Form::label('start_time', 'Start Time:') !!}
    {!! Form::time('start_time', null, ['class' => 'form-control']) !!}
</div>
<!-- Time range Field -->
<div class="form-group col-sm-6">
    {!! Form::label('end_time', 'End Time:') !!}
    {!! Form::time('end_time', null, ['class' => 'form-control']) !!}
</div>
<!-- Time range Field -->
<div class="form-group col-sm-6">
    {!! Form::label('image', 'Image:') !!}
    {!! Form::file('image', null, ['class' => 'form-control']) !!}
</div>
<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('categories.index') }}" class="btn btn-secondary">Cancel</a>
</div>