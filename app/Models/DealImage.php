<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DealImage extends Model
{
    use HasFactory;
    public $table = 'Deal_images';
    protected $fillable = [
        'deal_image_id',
        'deals_id',
        'user_id',
        'image_url',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];
}
