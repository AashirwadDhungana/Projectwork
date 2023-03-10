@extends('web.layouts.app1')
@section('styles')
<style>
    input[type="file"] {
        display: block;
    }

    .imageThumb {
        max-height: 75px;
        border: 2px solid;
        padding: 1px;
        cursor: pointer;
    }

    .pip {
        display: inline-block;
        margin: 10px 10px 0 0;
    }

    .img-delete {
        display: block;
        background: #444;
        border: 1px solid black;
        color: white;
        text-align: center;
        cursor: pointer;
    }

    .img-delete:hover {
        background: white;
        color: black;
    }
</style>
@endsection

@section('content')

<!--================login_part Area =================-->
<div class="col-lg-9 col-12 mb-30">
    <div class="myaccount-content">
        <?php $conditions = ['New(not used)', 'Used Few times', 'Excellent', 'Good', 'Not working'];
        $delivery_area = ['within my area', 'within my city', 'anywhere in Nepal'];
        ?>
        <div class="row">
            <h2 class="mb-50">Selected Category:&nbsp;{{$subcategory->name}}</h2>

            <div class="col-lg-8 col-md-8" style="margin-left: 120px;">

                {!! Form::open(['route' => 'web.product.save', 'files' => true,'class'=>'row contact_form']) !!}
                {!! Form::hidden('sub_category_id', $subcategory->id, ['class' => 'form-control']) !!}
                <div class="col-md-2">
                    {!! Form::label('title', 'Title:') !!}
                </div>
                <div class="col-md-10 form-group p_star">
                    {!! Form::text('title', null, ['class' => 'form-control','placeholder'=>'Title','required']) !!}
                </div>
                <div class="col-md-2">
                    {!! Form::label('description', 'Description:') !!}
                </div>
                <div class="col-md-10 form-group p_star">
                    {!! Form::textarea('description', null, ['class' => 'form-control','required']) !!}
                </div>
                <div class="col-md-2">
                    {!! Form::label('featured_image', 'Featured Image:') !!}
                </div>
                <div class="col-md-10 form-group p_star">
                    {!! Form::file('featured_image') !!}
                </div>
                <div class="col-md-2">
                    {!! Form::label('price', 'Price:') !!}
                </div>
                <div class="col-md-10 form-group p_star">
                    {!! Form::text('price', null, ['class' => 'form-control','placeholder'=>'Price','required']) !!}
                </div>
                <div class="col-md-2">
                    {!! Form::label('quantity', 'Quantity:') !!}
                </div>
                <div class="col-md-10 form-group p_star">
                    {!! Form::number('quantity', null, ['class' => 'form-control','placeholder'=>'Quantity','required']) !!}
                </div>
                <div class="col-md-2">
                    {!! Form::label('condition', 'Condition:') !!}
                </div>
                <div class="col-md-10 form-group p_star">
                    {!! Form::select('condition', array_combine($conditions,$conditions), null, ['class' => 'form-control','id'=>'P_conditions','placeholder'=>'Select One','required']) !!}
                </div>
                <div class="col-md-2 used_for">
                    {!! Form::label('used_for', 'Used For:') !!}
                </div>
                <div class="col-md-5 form-group p_star used_for">
                    {!! Form::number('used_for', null, ['class' => 'form-control P_used_for','placeholder'=>'Used For','id'=>'used_for','required']) !!}
                </div>
                <div class="col-md-5 used_for">
                    {!! Form::radio('used', "day", false,['class' => 'P_used_for','id'=>'used_for_1','required']) !!} Day
                    {!! Form::radio('used', "month", false,['class' => 'P_used_for','id'=>'used_for_2']) !!} Month
                    {!! Form::radio('used', "year", false,['class' => 'P_used_for','id'=>'used_for_3']) !!} Year
                </div>
                <div class="col-md-2">
                    {!! Form::label('expiry_time', 'Expiry Time:') !!}
                </div>
                <div class="col-md-8 form-group p_star">
                    {!! Form::number('expiry_time', null, ['class' => 'form-control','placeholder'=>'Expiry Time:','id'=>'expiry_time','required']) !!}
                </div>
                <div class="col-md-2">
                    <label>month</label>
                </div>
                <div class="col-md-2">
                    {!! Form::label('delivery', 'Delivery:') !!}
                </div>
                <div class="col-md-10 form-group">
                    <div class="col-md-5">
                        {!! Form::radio('delivery', "0", false,['id'=>'delivery_radio1','onclick' => 'showform(this)','required']) !!} Yes
                    </div>
                    <div class="col-md-5">
                        {!! Form::radio('delivery', "1", false,['id'=>'delivery_radio2','onclick' => 'showform(this)']) !!}No

                    </div>

                </div>

                <div class="col-md-2 delivery">
                    {!! Form::label('delivery_area', 'Delivery Area:') !!}
                </div>
                <div class="col-md-10 form-group delivery">
                    {!! Form::select('delivery_area', $delivery_area, null, ['id'=>'delivery_area','class' => 'form-control P_delivery_P','required','placeholder'=>'Select One']) !!}
                </div>

                <div class="col-md-2 delivery">
                    {!! Form::label('delivery_charge', 'Delivery Charge:') !!}
                </div>
                <div class="col-md-10 form-group delivery">
                    {!! Form::text('delivery_charge', null, ['id'=>'delivery_charge','class' => 'form-control P_delivery_P','required']) !!}
                </div>
                <div class="col-md-2">
                    {!! Form::label('warranty_period', 'Warranty Period:') !!}
                </div>
                <div class="col-md-5 form-group p_star">
                    {!! Form::number('warranty_period', null, ['class' => 'form-control']) !!}
                </div>
                <div class="col-md-5">
                    {!! Form::radio('warranty', "day", false,['id'=>'warranty_1']) !!} Day
                    {!! Form::radio('warranty', "month", false,['id'=>'warranty_2']) !!} Month
                    {!! Form::radio('warranty', "year", false,['id'=>'warranty_3']) !!} Year
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <table class="table bill_product table-fixed gridView">
                                    <thead>
                                        <tr style="text-align: center;">
                                            <th>Feature</th>
                                            <th>Value</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                        @if(isset($subcategory->attributes))
                                        @foreach($subcategory->attributes as $attribute)
                                        <tr>


                                            <td width="500px">
                                                <div class="form-group has-error product ">
                                                    <h4 style="text-align: center;background-color: white;height:38px;padding-top: 7px;">{{$attribute->feature}}</h4>
                                                    {!! Form::hidden('attribute_id[]', $attribute->id,['class' => 'form-control']) !!}
                                                </div>
                                            </td>

                                            <td width="400px">
                                                <div class="form-group has-error product "> @if($attribute->feature!='Other Features')
                                                    {!! Form::text('value[]', null, ['class' => 'form-control']) !!}
                                                    @else
                                                    {!! Form::textarea('value[]', null, ['class' => 'form-control','rows'=>8]) !!}
                                                    @endif
                                                </div>
                                            </td>

                                        </tr>
                                        @endforeach
                                        @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                </div>
                <div class="col-md-4 form-group">
                    <button class="btn btn-round btn-lg" type="submit">Next</button>

                </div>
                <div class="col-md-6">
                </div>
                {!! Form::close() !!}
            </div>

        </div>
    </div>
</div>
<!--================login_part end =================-->


@endsection
@section('scripts')
<script>
    console.log($("input[name='delivery']:checked").val());
    if ($('#P_conditions').val() === 'New(not used)') {
        $('.used_for').hide();
        $('.P_used_for').removeAttr('required');
        $('#used_for').val(null);
    }
    if ($("input[name='delivery']:checked").val() == 1) {
        $('.delivery').hide();
        $('#delivery_area').removeAttr('required');
        $('#delivery_charge').removeAttr('required');
        $('#delivery_area').val(null);
        $('#delivery_charge').val(null);
    }
</script>
<script>
    function showform(that) {
        if (that.value == 0) {
            $('.delivery').show();
            $('.P_delivery_P').attr('required', 'required');

        } else {
            $('.delivery').hide();
            $('.P_delivery_P').removeAttr('required');
            $('#delivery_area').val(null);
            $('#delivery_charge').val(null);
        }
    }
</script>
<script>
    $('#expiry_time').keyup(function() {
        if ($(this).val() > 12) {
            alert("The expiry time of your product can't be more than 12 month");
            $('#expiry_time').val("");
            // document.getElementById('expiry_time').style.borderColor = "red";
            // return false;
        }
    });
</script>
<script>
    $(document).on('change', '#P_conditions', function() {
        if ($(this).val() === 'New(not used)') {
            $('.used_for').hide();
            $('.P_used_for').removeAttr('required');
            $('#used_for').val(null);
        } else {
            $('.used_for').show();
            $('.P_used_for').attr('required', 'required');
        }




    });
</script>
@endsection