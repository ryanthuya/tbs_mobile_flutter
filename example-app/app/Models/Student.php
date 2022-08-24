<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    protected $table = 'students';
     protected $primaryKey = 'id';
    use HasFactory;
    protected $fillable = [
    'name',
    'age'
    ];
    public $timestamps = false;
}
