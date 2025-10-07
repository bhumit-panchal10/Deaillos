<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\StateController;
use App\Http\Controllers\CityController;
use App\Http\Controllers\AreaController;

use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\CustomerController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\RolesController;
use App\Http\Controllers\DealController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\VendorController;

use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\CategoriesController;
use App\Http\Controllers\SubCategoriesController;
use App\Http\Controllers\FaqController;
use App\Http\Controllers\CMSController;
use App\Http\Controllers\ImageController;
use App\Http\Controllers\PromocodeController;
use App\Http\Controllers\OptionController;
use App\Http\Controllers\OfferImageController;
use App\Http\Controllers\HeaderImageController;



Route::get('/', function () {
    return view('auth.login');
});

Route::group(['middleware' => 'auth'], function () {
    Route::get('admin.php', function () {
        return view('dashboard.home');
    });
    Route::get('admin.php', function () {
        return view('dashboard.home');
    });
});

Auth::routes();
Route::get('/clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    return 'Cache is cleared';
});

Route::get('/phpinfo', function () {
    phpinfo();
});


Route::get('/admin/login', [LoginController::class, 'login'])->name('admin.login');
Route::post('/login', [LoginController::class, 'authenticate'])->name('authenticate');
Route::get('/logout', [LoginController::class, 'logoutPage'])->name('logout_page');
Route::any('/log-out', [LoginController::class, 'logout'])->name('logout');

Route::group(['namespace' => 'App\Http\Controllers\Auth'], function () {
    // -----------------------------login----------------------------------------//
    // Route::controller(LoginController::class)->group(function () {
    //     Route::get('/admin/login', 'login')->name('login');
    //     Route::post('/login', 'authenticate')->name('authenticate');
    //     Route::get('/logout', 'logout')->name('logout');
    //     Route::get('logout/page', 'logoutPage')->name('logout/page');
    // });

    // ------------------------------ register ----------------------------------//
    Route::controller(RegisterController::class)->group(function () {
        Route::get('/register', 'register')->name('register');
        Route::post('/register', 'storeUser')->name('register');
    });

    // ----------------------------- forget password ----------------------------//
    Route::controller(ForgotPasswordController::class)->group(function () {
        Route::get('forget-password', 'getEmail')->name('forget-password');
        Route::post('forget-password', 'postEmail')->name('forget-password');
    });

    // ----------------------------- reset password -----------------------------//
    Route::controller(ResetPasswordController::class)->group(function () {
        Route::get('reset-password/{token}', 'getPassword');
        Route::post('reset-password', 'updatePassword');
    });
});


// Dashboard routes
Route::get('/home', [HomeController::class, 'index'])->middleware('auth')->name('home');
Route::get('/profile', [HomeController::class, 'getProfile'])->middleware('auth')->name('profile');
Route::post('/updateprofile', [HomeController::class, 'updateProfile'])->middleware('auth')->name('updateprofile');
Route::get('/Changepassword', [HomeController::class, 'changePassword'])->middleware('auth')->name('Changepassword');
Route::post('/Change_password', [HomeController::class, 'changePassword_update'])->middleware('auth')->name('Change_password');

//State Master
Route::prefix('admin')->name('state.')->middleware('auth')->group(function () {
    Route::get('/state/index', [StateController::class, 'index'])->name('index');
    Route::post('/state/store', [StateController::class, 'store'])->name('store');
    Route::get('/state/edit/{id?}', [StateController::class, 'edit'])->name('edit');
    Route::post('/state/update', [StateController::class, 'update'])->name('update');
    Route::delete('/state/delete', [StateController::class, 'delete'])->name('delete');
    Route::delete('/state/deleteselected', [StateController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/state/updateStatus', [StateController::class, 'updateStatus'])->name('updateStatus');
});

//City Master
Route::prefix('admin')->name('city.')->middleware('auth')->group(function () {
    Route::get('/city/index', [CityController::class, 'index'])->name('index');
    Route::post('/city/store', [CityController::class, 'store'])->name('store');
    Route::get('/city/edit/{id?}', [CityController::class, 'edit'])->name('edit');
    Route::post('/city/update', [CityController::class, 'update'])->name('update');
    Route::delete('/city/delete', [CityController::class, 'delete'])->name('delete');
    Route::delete('/city/deleteselected', [CityController::class, 'deleteselected'])->name('deleteselected');
});

//Area Master
Route::prefix('admin')->name('area.')->middleware('auth')->group(function () {
    Route::any('/area/index', [AreaController::class, 'index'])->name('index');
    Route::any('/state/city/mapping', [AreaController::class, 'state_city_mapping'])->name('state_city_mapping');
    Route::get('/area/add', [AreaController::class, 'add'])->name('add');
    Route::post('/area/store', [AreaController::class, 'store'])->name('store');
    Route::get('/area/edit/{id?}', [AreaController::class, 'edit'])->name('edit');
    Route::post('/area/update/{id?}', [AreaController::class, 'update'])->name('update');
    Route::delete('/area/delete', [AreaController::class, 'delete'])->name('delete');
    Route::delete('/area/deleteselected', [AreaController::class, 'deleteselected'])->name('deleteselected');
});

//categories Master
Route::prefix('admin')->name('categories.')->middleware('auth')->group(function () {
    Route::any('/categories/index', [CategoriesController::class, 'index'])->name('index');
    Route::get('/categories/add', [CategoriesController::class, 'add'])->name('add');
    Route::post('/categories/store', [CategoriesController::class, 'store'])->name('store');
    Route::get('/categories/edit/{id?}', [CategoriesController::class, 'edit'])->name('edit');
    Route::post('/categories/update/{id?}', [CategoriesController::class, 'update'])->name('update');
    Route::delete('/categories/delete', [CategoriesController::class, 'delete'])->name('delete');
    Route::delete('/categories/deleteselected', [CategoriesController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/categories/updateStatus', [CategoriesController::class, 'updateStatus'])->name('updateStatus');
});

Route::prefix('admin')->name('sub_categories.')->middleware('auth')->group(function () {
    Route::any('/sub_categories/index', [SubCategoriesController::class, 'index'])->name('index');
    Route::get('/sub_categories/add', [SubCategoriesController::class, 'add'])->name('add');
    Route::post('/sub_categories/store', [SubCategoriesController::class, 'store'])->name('store');
    Route::get('/sub_categories/edit/{id?}', [SubCategoriesController::class, 'edit'])->name('edit');
    Route::post('/sub_categories/update/{id?}', [SubCategoriesController::class, 'update'])->name('update');
    Route::delete('/sub_categories/delete', [SubCategoriesController::class, 'delete'])->name('delete');
    Route::delete('/sub_categories/deleteselected', [SubCategoriesController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/sub_categories/updateStatus', [SubCategoriesController::class, 'updateStatus'])->name('updateStatus');
});

Route::prefix('admin')->name('image.')->middleware('auth')->group(function () {
    Route::any('/image/index', [ImageController::class, 'index'])->name('index');
    Route::get('/image/add', [ImageController::class, 'add'])->name('add');
    Route::post('/image/store', [ImageController::class, 'store'])->name('store');
    Route::get('/image/edit/{id?}', [ImageController::class, 'edit'])->name('edit');
    Route::post('/image/update/{id?}', [ImageController::class, 'update'])->name('update');
    Route::delete('/image/delete', [ImageController::class, 'delete'])->name('delete');
    Route::delete('/image/deleteselected', [ImageController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/image/updateStatus', [ImageController::class, 'updateStatus'])->name('updateStatus');
    Route::any('/image/category_subcategory_mapping', [ImageController::class, 'category_subcategory_mapping'])->name('category_subcategory_mapping');
});

Route::prefix('admin')->name('offerimage.')->middleware('auth')->group(function () {
    Route::any('/offerimage/index', [OfferImageController::class, 'index'])->name('index');
    Route::get('/offerimage/add', [OfferImageController::class, 'add'])->name('add');
    Route::post('/offerimage/store', [OfferImageController::class, 'store'])->name('store');
    Route::get('/offerimage/edit/{id?}', [OfferImageController::class, 'edit'])->name('edit');
    Route::post('/offerimage/update/{id?}', [OfferImageController::class, 'update'])->name('update');
    Route::delete('/offerimage/delete', [OfferImageController::class, 'delete'])->name('delete');
    Route::delete('/offerimage/deleteselected', [OfferImageController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/offerimage/updateStatus', [OfferImageController::class, 'updateStatus'])->name('updateStatus');
});

Route::prefix('admin')->name('headerimage.')->middleware('auth')->group(function () {
    Route::any('/headerimage/index', [HeaderImageController::class, 'index'])->name('index');
    Route::get('/headerimage/add', [HeaderImageController::class, 'add'])->name('add');
    Route::post('/headerimage/store', [HeaderImageController::class, 'store'])->name('store');
    Route::get('/headerimage/edit/{id?}', [HeaderImageController::class, 'edit'])->name('edit');
    Route::post('/headerimage/update/{id?}', [HeaderImageController::class, 'update'])->name('update');
    Route::delete('/headerimage/delete', [HeaderImageController::class, 'delete'])->name('delete');
    Route::delete('/headerimage/deleteselected', [HeaderImageController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/headerimage/updateStatus', [HeaderImageController::class, 'updateStatus'])->name('updateStatus');
});


Route::prefix('admin')->name('vendor.')->middleware('auth')->group(function () {
    Route::get('/vendor/index', [VendorController::class, 'index'])->name('index');
    Route::get('/vendor/add', [VendorController::class, 'add'])->name('add');
    Route::post('/vendor/store', [VendorController::class, 'store'])->name('store');
    Route::get('/vendor/edit/{vendor_id?}', [VendorController::class, 'edit'])->name('edit');
    Route::post('/vendor/update/{vendor_id?}', [VendorController::class, 'update'])->name('update');
    Route::delete('/vendor/delete', [VendorController::class, 'delete'])->name('delete');
    Route::delete('/vendor/deleteselected', [VendorController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/vendor/updateStatus', [VendorController::class, 'updateStatus'])->name('updateStatus');
});


Route::prefix('admin')->name('promocode.')->middleware('auth')->group(function () {

    Route::get('/promocode/index/{id?}', [PromocodeController::class, 'index'])->name('index');
    Route::get('/promocode/promocodelist', [PromocodeController::class, 'promocodelist'])->name('promocodelist');
    Route::get('/promocode/add/{id?}', [PromocodeController::class, 'add'])->name('add');
    Route::post('/promocode/store', [PromocodeController::class, 'store'])->name('store');
    Route::get('/promocode/edit/{id?}', [PromocodeController::class, 'edit'])->name('edit');
    Route::post('/promocode/update/{vendor_id?}', [PromocodeController::class, 'update'])->name('update');
    Route::delete('/promocode/delete', [PromocodeController::class, 'delete'])->name('delete');
    Route::delete('/promocode/deleteselected', [PromocodeController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/promocode/updateStatus', [PromocodeController::class, 'updateStatus'])->name('updateStatus');
});

//Faq Master
Route::prefix('admin')->name('faq.')->middleware('auth')->group(function () {
    Route::get('/faq/index', [FaqController::class, 'index'])->name('index');
    Route::get('/faq/add', [FaqController::class, 'add'])->name('add');
    Route::post('/faq/store', [FaqController::class, 'store'])->name('store');
    Route::get('/faq/edit/{id?}', [FaqController::class, 'edit'])->name('edit');
    Route::get('/faq/view/{id?}', [FaqController::class, 'view'])->name('view');
    Route::post('/faq/update/{id?}', [FaqController::class, 'update'])->name('update');
    Route::delete('/faq/delete', [FaqController::class, 'delete'])->name('delete');
    Route::delete('/faq/deleteselected', [FaqController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/faq/updateStatus', [FaqController::class, 'updateStatus'])->name('updateStatus');
});

//Career Master

//CMS
Route::prefix('admin')->name('cms.')->middleware('auth')->group(function () {
    Route::get('/cms/index', [CMSController::class, 'index'])->name('index');
    Route::get('/cms/edit/{id?}', [CMSController::class, 'edit'])->name('edit');
    Route::post('/cms/update/{id?}', [CMSController::class, 'update'])->name('update');
});

Route::prefix('admin')->name('deal.')->middleware('auth')->group(function () {
    Route::get('/deal/index/{id?}', [DealController::class, 'index'])->name('index');
    Route::get('/deal/deallist', [DealController::class, 'deallist'])->name('deallist');
    Route::get('/deal/add/{id?}/{dealid?}', [DealController::class, 'add'])->name('add');
    Route::post('/deal/store', [DealController::class, 'store'])->name('store');
    Route::get('/deal/edit/{id?}', [DealController::class, 'edit'])->name('edit');
    Route::post('/deal/update/{id?}', [DealController::class, 'update'])->name('update');
    Route::delete('/deal/delete', [DealController::class, 'delete'])->name('delete');
    Route::delete('/deal/deleteselected', [DealController::class, 'deleteselected'])->name('deleteselected');
    Route::post('dealimage-delete/{id}', [DealController::class, 'dealimage'])->name('imagedelete');

    Route::any('/deal/category_subcategory_mapping', [DealController::class, 'category_subcategory_mapping'])->name('category_subcategory_mapping');
});

Route::prefix('admin')->name('option.')->middleware('auth')->group(function () {
    Route::get('/option/index/{id?}', [OptionController::class, 'index'])->name('index');
    Route::get('/option/add/{id?}', [OptionController::class, 'add'])->name('add');
    Route::post('/option/store', [OptionController::class, 'store'])->name('store');
    Route::get('/option/edit/{id?}', [OptionController::class, 'edit'])->name('edit');
    Route::get('/option/view/{id?}', [OptionController::class, 'view'])->name('view');
    Route::post('/option/update/{id?}', [OptionController::class, 'update'])->name('update');
    Route::delete('/option/delete', [OptionController::class, 'delete'])->name('delete');
    Route::delete('/option/deleteselected', [OptionController::class, 'deleteselected'])->name('deleteselected');
    Route::any('/option/updateStatus', [OptionController::class, 'updateStatus'])->name('updateStatus');
});
