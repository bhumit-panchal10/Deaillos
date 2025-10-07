<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Categories extends Model
{
    use HasFactory;
    public $table = 'Categories';
    protected $primaryKey = 'Categories_id';
    protected $fillable = [
        'Categories_id',
        'Category_name',
        'Categories_slug',
        'Categories_img',
        'Categories_icon',
        'isequence',
        'display_homepage',
        'iStatus',
        'isDelete',
        'strIP',
        'created_at',
        'updated_at'

    ];

    // Categories.php
    public function subcategories()
    {
        return $this->hasMany(SubCategories::class, 'iCategoryId', 'Categories_id');
    }


    public function getCategoriesiconAttribute($value)
    {
        if ($value) {
            // Test if the asset path is generated correctly
            return url('upload/category-icons/' . $value);  // You can also use 'asset()' if you prefer
        }
        return null; // Handle cases where there's no image
    }
}
