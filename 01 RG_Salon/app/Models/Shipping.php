<?php

namespace App\Models;

use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Category
 * @package App\Models
 * @version February 26, 2020, 6:33 am UTC
 *
 * @property string name
 * @property string slug
 */
class Shipping extends Model
{
    use SoftDeletes;

    public $table = 'shippings';


    protected $dates = ['deleted_at'];



    public $fillable = [
        'name', 'email', 'phone','address1','address2','city_id','region_id','area_id','user_id'
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
    public function cities()
    {
        return  $this->belongsTo(City::class,'city_id');
    }

    public function region()
    {
        return  $this->belongsTo(Region::class,'region_id');
    }
    public function area()
    {
        return  $this->belongsTo(Area::class,'area_id');
    }

}
