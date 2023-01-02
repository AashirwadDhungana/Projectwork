<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Stylist extends Model
{
    use SoftDeletes;

    public $table = 'stylists';


    protected $dates = ['deleted_at', 'start_time', 'end_time'];



    public $fillable = [
        'name', 'specialist', 'start_time', 'end_time', 'image'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [];

    /**
     * Validation rules
     *
     * @var array
     */
}
