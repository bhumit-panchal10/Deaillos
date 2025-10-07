<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dealmultiimage extends Model
{
    use HasFactory;
    public $table = 'Dealmultiimage';
    protected $primaryKey = 'Dealimage_id';
    protected $fillable = [
        'Dealimage_id',
        'photo',
        'deal_id',
        'is_primary',
        'Image_type',
        'imagebank_id',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];

    public function getPhotoAttribute($value)
    {
        // Get the created_at date in d-m-y format
        $createdDate = optional($this->created_at)->format('d-m-y');

        // Check if the value already contains the full base URL
        if (str_starts_with($value, asset('upload/deal-images'))) {
            return $value;
        }

        // Check if the value starts with "http" (already a full URL)
        if (str_starts_with($value, 'http')) {
            return $value;
        }

        // Prepend the dynamic path based on created_at date (e.g., upload/deal-images/31-12-24)
        return asset('upload/deal-images/' . $createdDate . '/' . $value);
    }



    public function deal()
    {
        return $this->belongsTo(Deals::class, 'deal_id', 'Dealimage_id');
    }
}
