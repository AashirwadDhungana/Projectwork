<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class City
 * @package App\Models
 * @version April 26, 2020, 10:55 am UTC
 *
 * @property string name
 */
class Area extends Model
{
    use SoftDeletes;

    public $table = 'areas';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'name',
        'city_id'
    ];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'name' => 'string'
    ];

    /**
     * Validation rules
     *
     * @var array
     */
    public static $rules = [
        'name' => 'required'
    ];
    public function city()
    {
        return $this->belongsTo(City::class,'city_id');
    }

}
