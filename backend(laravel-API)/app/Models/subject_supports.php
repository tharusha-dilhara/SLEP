<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subject_supports extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'batch',
        'group_no',
        'date',
        'mod_name',
        'link',
    ];
}
