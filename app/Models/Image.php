<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    use HasFactory;

    protected $table = 'images';

    // Relación uno a muchos
    public function comments()
    {
        return $this->hasMany('App\Models\Comment')->orderBy('id', 'desc');
    }

    // Relación uno a muchos
    public function likes()
    {
        return $this->hasMany('App\Models\Like');
    }

    // Relación de muchos a uno
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }
    
}
