<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Idol extends Model
{
    protected $table = 'idol';

    protected $fillable = [
        'nama',
        'date',
        'venue',
        'city',
        'country',
    ];

    public $timestamps = true;
}
