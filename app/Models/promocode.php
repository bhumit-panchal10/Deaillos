<?php

namespace App\Models;

use App\Models\Categories;
use App\Models\SubCategories;
use App\Models\StateMaster;
use App\Models\CityMaster;
use App\Models\Vendor;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class promocode extends Model
{
    use HasFactory;
    public $table = 'promocodes';
    protected $primaryKey = 'promo_id';
    protected $fillable = [
        'promo_id',
        'GUID',
        'code',
        'description',
        'pro_img',
        'dis_per',
        'link',
        'vendorid',
        'state_id',
        'city_id',
        'category_id',
        'subcat_id',
        'start_date',
        'end_date',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];
    public function category()
    {
        return $this->belongsTo(Categories::class, 'category_id', 'Categories_id');
    }

    public function subcategory()
    {
        return $this->belongsTo(SubCategories::class, 'subcat_id', 'iSubCategoryId');
    }

    public function state()
    {
        return $this->belongsTo(StateMaster::class, 'state_id', 'stateId');
    }

    public function city()
    {
        return $this->belongsTo(CityMaster::class, 'city_id', 'cityId');
    }

    public function vendor()
    {
        return $this->belongsTo(Vendor::class, 'vendorid', 'vendor_id');
    }
}
