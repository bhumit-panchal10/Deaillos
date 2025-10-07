<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OfferImage extends Model
{
    use HasFactory;
    public $table = 'offer_image';
    protected $fillable = [
        'offerimage_id',
        'offer_image',
        'link',
        'is_align',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];
}
