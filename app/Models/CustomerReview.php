<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;


class CustomerReview extends Model
{
    use HasFactory;
    public $table = 'Customer_Review';
    protected $primaryKey = 'Customer_Review_id';
    protected $fillable = [
        'Customer_Review_id',
        'review',
        'customer_id',
        'deal_id',
        'vendor_id',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];
}
