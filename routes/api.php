<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ApiController;
use App\Http\Controllers\Api\VendorApiController;
use App\Http\Controllers\Api\OpenAIImageController;
use App\Http\Controllers\Api\FrontApiController;
use App\Http\Controllers\Api\CustomerApiController;
use Illuminate\Support\Facades\Artisan;
use App\Mail\MyTestEmail;
use Illuminate\Support\Facades\Mail;


Route::get('/clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    Artisan::call('config:clear');
    return 'Cache is cleared';
});


//vendor api
Route::post('/new-registration', [VendorApiController::class, 'vendor_new_registration'])->name('vendor_new_registration');
Route::post('/login', [VendorApiController::class, 'login']);
Route::post('/verifyOTP', [VendorApiController::class, 'verifyOTP'])->name('verifyOTP');
Route::post('/vendor/change/password', [VendorApiController::class, 'change_password'])->name('change_password');
Route::post('/generate-image', [OpenAIImageController::class, 'generateImage'])->name('generateImage');
Route::post('/vendor/forgot/password', [VendorApiController::class, 'forgot_password'])->name('forgot_password');
Route::post('/vendor/forgot/password/verifyOTP', [VendorApiController::class, 'forgot_password_verifyOTP'])->name('forgot_password_verifyOTP');
Route::post('/logout', [VendorApiController::class, 'logout']);
Route::post('/vendor/profile', [VendorApiController::class, 'profiledetails'])->name('profiledetails');
Route::post('/vendor/profile/update', [VendorApiController::class, 'profileUpdate'])->name('profileUpdate');
Route::post('/vendor/dashboard', [VendorApiController::class, 'vendorDashboard'])->name('vendorDashboard');
Route::post('/vendor/getMonthlySubscriptions', [VendorApiController::class, 'getMonthlySubscriptions'])->name('getMonthlySubscriptions');
Route::post('/vendor/userEngagementChart', [VendorApiController::class, 'userEngagementChart'])->name('userEngagementChart');


//Customer api
Route::post('/customer-registration', [CustomerApiController::class, 'customer_new_registration'])->name('customer_new_registration');
Route::post('/customerlogin', [CustomerApiController::class, 'login']);
Route::post('/customerverifyOTP', [CustomerApiController::class, 'verifyOTP'])->name('verifyOTP');
Route::post('/customer/forgot/password', [CustomerApiController::class, 'forgot_password'])->name('forgot_password');
Route::post('/customer/change/password', [CustomerApiController::class, 'change_password'])->name('change_password');
Route::post('/customer/forgot/password/verifyOTP', [CustomerApiController::class, 'forgot_password_verifyOTP'])->name('forgot_password_verifyOTP');
Route::post('/customerlogout', [CustomerApiController::class, 'logout']);
Route::post('/customer/profile', [CustomerApiController::class, 'profiledetails'])->name('profiledetails');
Route::post('/customer/profile/update', [CustomerApiController::class, 'profileUpdate'])->name('profileUpdate');
Route::post('/customersubscribedeal', [CustomerApiController::class, 'customersubscribedeal'])->name('customersubscribedeal');
Route::post('/customer/subscribe/deal/detail', [CustomerApiController::class, 'customersubscribedealdetail'])->name('customersubscribedealdetail');
Route::post('/customer/reviewadd', [CustomerApiController::class, 'reviewadd'])->name('reviewadd');

//front api
Route::get('/Front/getimages', [FrontApiController::class, 'getImages'])->name('getImages');
Route::post('/Front/getuploadimages', [FrontApiController::class, 'getuploadimages'])->name('getuploadimages');
Route::post('/Adddesortitle', [FrontApiController::class, 'Adddesortitle'])->name('Adddesortitle');
Route::post('/Front/Addoption', [FrontApiController::class, 'Addoption'])->name('Addoption');
Route::get('/Front/ShowOption', [FrontApiController::class, 'ShowOption'])->name('ShowOption');
Route::post('/Front/UpdateOption', [FrontApiController::class, 'UpdateOption'])->name('UpdateOption');
Route::post('/Front/DeleteOption', [FrontApiController::class, 'DeleteOption'])->name('DeleteOption');
Route::post('/Front/AddUploadImage', [FrontApiController::class, 'AddPhoto'])->name('AddPhoto');
Route::post('/Front/UploadImagedelete', [FrontApiController::class, 'deleteImage'])->name('deleteImage');
Route::post('/Front/DisplayLocation', [FrontApiController::class, 'DisplayLocation'])->name('DisplayLocation');
Route::post('/Front/UpdateLocation', [FrontApiController::class, 'UpdateLocation'])->name('UpdateLocation');
Route::post('/Front/AddBusinessInfo', [FrontApiController::class, 'AddBusinessInfo'])->name('AddBusinessInfo');
Route::post('/Front/ShowBusinessInfo', [FrontApiController::class, 'ShowBusinessInfo'])->name('ShowBusinessInfo');

Route::post('/Front/Deallist', [FrontApiController::class, 'Deallist'])->name('Deallist');
Route::post('/Front/OptionList', [FrontApiController::class, 'OptionList'])->name('OptionList');
Route::post('/Front/DealPublish', [FrontApiController::class, 'DealPublish'])->name('DealPublish');
Route::post('/Front/Showtitleordescription', [FrontApiController::class, 'Showtitleordescription'])->name('Showtitleordescription');
Route::post('/Front/ManageDeal', [FrontApiController::class, 'ManageDeal'])->name('ManageDeal');
Route::get('/states', [FrontApiController::class, 'statelist'])->name('statelist');
Route::post('/city', [FrontApiController::class, 'citylist'])->name('citylist');
Route::get('/categories', [FrontApiController::class, 'categories'])->name('categories');
Route::post('/subcategories', [FrontApiController::class, 'subcategories'])->name('subcategories');
Route::post('/Front/PromocodeAdd', [FrontApiController::class, 'promocodeadd'])->name('promocodeadd');
Route::post('/Front/PromocodeList', [FrontApiController::class, 'promocodelist'])->name('promocodelist');
Route::post('/Front/PromocodeShow', [FrontApiController::class, 'promocodeshow'])->name('promocodeshow');
Route::post('/Front/Updatepromocode', [FrontApiController::class, 'Updatepromocode'])->name('Updatepromocode');
Route::post('/Front/Deletepromocode', [FrontApiController::class, 'Deletepromocode'])->name('Deletepromocode');
Route::post('/Front/FrontPromocodelist', [FrontApiController::class, 'FrontPromocodelist'])->name('FrontPromocodelist');
Route::post('/Front/DeleteDeal', [FrontApiController::class, 'DeleteDeal'])->name('DeleteDeal');
Route::post('/promo-codes/search', [FrontApiController::class, 'promocodesearch'])->name('promocodesearch');
Route::post('/Front/Dealsearch', [FrontApiController::class, 'Dealsearch'])->name('Dealsearch');
Route::post('/Front/DisplayHomePageDeal', [FrontApiController::class, 'DisplayHomePageDeal'])->name('DisplayHomePageDeal');
Route::post('/Front/Topmenu', [FrontApiController::class, 'Topmenu'])->name('Topmenu');
Route::post('/Front/DealDetail', [FrontApiController::class, 'DealDetail'])->name('DealDetail');
Route::post('/Front/dealimagedelete', [FrontApiController::class, 'dealimagedelete'])->name('dealimagedelete');

Route::post('/Front/OfferImageDisaplay', [FrontApiController::class, 'OfferImageDisaplay'])->name('OfferImageDisaplay');
Route::post('/Front/HeaderImageDisaplay', [FrontApiController::class, 'HeaderImageDisaplay'])->name('HeaderImageDisaplay');

Route::post('/Front/contactmailsend', [FrontApiController::class, 'contactmailsend'])->withoutMiddleware(['auth']);
//->name('contactmailsend');

Route::post('/Front/Cmschange', [FrontApiController::class, 'Cmschange'])->name('Cmschange');
Route::post('/Front/PromocodeDetail', [FrontApiController::class, 'PromocodeDetail'])->name('PromocodeDetail');

Route::get('/testroute', function () {
    $name = "Funny Coder";

    // The email sending is done using the to method on the Mail facade
    Mail::to('dev2.apolloinfotech@gmail.com')->send(new MyTestEmail($name));
});


Route::get('/run-scheduled-notifications', function () {
    Artisan::call('send:scheduled-notifications');
    return 'Scheduled ride notifications command has been executed.';
});
