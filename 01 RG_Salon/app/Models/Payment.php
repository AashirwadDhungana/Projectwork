<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Payment extends Model
{
    use SoftDeletes;


    public $table = 'payments';


    protected $dates = ['deleted_at','date'];



    public $fillable = [
        'order_id',
        'date',
        'amount',
        'payment_method',
        'transaction_id',
        'status'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [

    ];

    /**
     * Validation rules
     *
     * @var array
     */

}
