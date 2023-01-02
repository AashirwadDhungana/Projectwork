<?php

namespace App\Models;

use App\User;
use Eloquent as Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Appointment extends Model
{
    use SoftDeletes;

    public $table = 'appointments';


    protected $dates = ['deleted_at', 'date', 'time'];



    public $fillable = [
        'user_id', 'stylist_id', 'date', 'time', 'status'
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
    public function stylist()
    {
        return $this->belongsTo(Stylist::class, 'stylist_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
