<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DealsOption extends Model
{
    use HasFactory;
    public $table = 'DealOption';
    protected $primaryKey = 'deal_option_id';
    protected $fillable = [
        'deal_option_id',
        'option_title',
        'regular_price',
        'pricecut_price',
        'monthly_voucher_cap',
        'item_sold',
        'deal_id',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];
    public function deal()
    {
        return $this->belongsTo(Deals::class, 'deal_id', 'deal_option_id'); // Adjust keys if necessary
    }
}
