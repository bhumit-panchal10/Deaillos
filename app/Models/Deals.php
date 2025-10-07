<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Categories;
use App\Models\SubCategories;
use App\Models\StateMaster;
use App\Models\CityMaster;
use App\Models\DealsOption;

class Deals extends Model
{
    use HasFactory;
    public $table = 'Deals';
    protected $primaryKey = 'Deals_id';
    protected $fillable = [
        'Deals_id',
        'user_id',
        'vendorid',
        'deal_description',
        'deal_address',
        'deal_state_id',
        'deal_city_id',
        'deal_category_id',
        'deal_sub_category_id',
        'display_start_date',
        'display_end_date',
        'offer_start_date',
        'offer_end_date',
        'deals_slug',
        'Map_link',
        'GUID',
        'main_title',
        'business_desc',
        'business_website',
        'business_type',
        'Is_publish',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];

    public function options()
    {
        return $this->hasMany(DealsOption::class, 'deal_id', 'Deals_id'); // Adjust the foreign key and local key if necessary
    }

    public function images()
    {
        return $this->hasMany(Dealmultiimage::class, 'deal_id', 'Deals_id'); // Adjust the foreign key and local key if necessary
    }

    public function vendor()
    {
        return $this->hasOne(Vendor::class, 'vendor_id', 'vendorid'); // vendor.deal_id matches deals.Deals_id
    }

    public function category()
    {
        return $this->belongsTo(Categories::class, 'deal_category_id', 'Categories_id');
    }

    public function subcategory()
    {
        return $this->belongsTo(SubCategories::class, 'deal_sub_category_id', 'iSubCategoryId');
    }

    public function state()
    {
        return $this->belongsTo(StateMaster::class, 'deal_state_id', 'stateId');
    }

    public function city()
    {
        return $this->belongsTo(CityMaster::class, 'deal_city_id', 'cityId');
    }

    public function vendorname()
    {
        return $this->belongsTo(Vendor::class, 'vendorid', 'vendor_id');
    }

    public function reviews()
    {
        return $this->hasMany(CustomerReview::class, 'deal_id', 'Deals_id');
    }
}
