<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HeaderImage extends Model
{
    use HasFactory;
    public $table = 'headerimage';
    protected $fillable = [
        'header_image_id',
        'header_image',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];
}
