<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CityMaster;
use App\Models\Driver;
use App\Models\DriverDetail;
use App\Models\NewsLetters;
use App\Models\StateMaster;
use App\Models\Vehicle;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\PushNotificationController;
use App\Models\ActiveTrip;
use App\Models\Customer;
use App\Models\DriverLedger;
use App\Models\TripDriverHit;
use App\Models\TripTimeAt;
use App\Models\DriverPaymentToCompany;
use App\Models\PassMaster;
use App\Models\DriverTags;
use App\Models\AreaMaster;
use App\Models\CMSMaster;
use App\Models\SMSTemplate;
use App\Models\PassPurchase;
use App\Models\TripRateExperience;
use App\Models\DriverDocumentsEditRequest;
use App\Models\GuidelineResources;
use GuzzleHttp\Client;
use App\Models\Vendor;
use App\Models\UserSubscribeDeal;
use App\Models\Deals;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;


class VendorApiController extends Controller

// class DriverApiController extends PushNotificationController
{


    public function vendorDashboard(Request $request)
    {
        $vendorId = $request->vendor_id ?? ''; // or use token auth, etc.

        // Total unique subscribed users
        $subscribedUsersCount = UserSubscribeDeal::where('vendorid', $vendorId)
            ->where('isDelete', 0)
            ->distinct('Customer_GUID')
            ->count('Customer_GUID');

        // Total deals by vendor
        $totalDealsCount = Deals::where('vendorid', $vendorId)
            ->where('isDelete', 0)
            ->count();

        // Active deals (validity in range & status = active)
        $activeDealsCount = Deals::where('vendorid', $vendorId)
            ->where('isDelete', 0)
            ->where('iStatus', 1)
            ->whereDate('display_end_date', '>=', now())
            ->count();

        return response()->json([
            'subscribed_users' => $subscribedUsersCount,
            'total_deals' => $totalDealsCount,
            'active_deals' => $activeDealsCount,
        ]);
    }

    public function getMonthlySubscriptions(Request $request)
    {
        $vendorId = $request->vendor_id;

        $monthlySubscriptions = DB::table('user_subscribe_deal')
            ->select(
                DB::raw('MONTH(created_at) as month'),
                DB::raw('COUNT(Customer_GUID) as user_count')
            )
            ->where('vendorid', $vendorId)
            ->where('isDelete', 0)
            ->whereYear('created_at', now()->year)
            ->groupBy(DB::raw('MONTH(created_at)'))
            ->orderBy(DB::raw('MONTH(created_at)'))
            ->get();
        //dd($monthlySubscriptions);

        // Convert month number to name
        $data = $monthlySubscriptions->map(function ($item) {
            return [
                'month' => date('M', mktime(0, 0, 0, $item->month, 10)),
                'count' => $item->user_count
            ];
        });

        return response()->json($data);
    }

    public function userEngagementChart(Request $request)
    {
        $vendorId = $request->vendor_id;

        $query = UserSubscribeDeal::where('vendorid', $vendorId)
            ->where('isDelete', 0);

        $now = Carbon::now();

        // Active: dealvalidity_todate still in future
        $activeUsers = (clone $query)
            ->whereDate('dealvalidity_todate', '>=', $now)
            ->distinct('Customer_GUID')
            ->count('Customer_GUID');

        // Inactive: deal expired
        $inactiveUsers = (clone $query)
            ->whereDate('dealvalidity_todate', '<', $now)
            ->distinct('Customer_GUID')
            ->count('Customer_GUID');

        // New: created within last 30 days
        $newUsers = (clone $query)
            ->whereDate('created_at', '>=', $now->subDays(30))
            ->distinct('Customer_GUID')
            ->count('Customer_GUID');

        //dd($newUsers);
        return response()->json([
            'Active Users' => $activeUsers,
            'Inactive Users' => $inactiveUsers,
            'New Users' => $newUsers,
        ]);
    }

    public function vendor_new_registration(Request $request)
    {
        // dd($request);
        try {

            $request->validate([
                "vendorname" => 'required',
                "vendormobile" => 'required|digits:10|unique:vendor,vendormobile',
                "businessname" => 'required',
                "vendoraddress" => 'required',
                "vendorstate" => 'required',
                "ip_address" => 'required',
                "vendorcity" => '',
                // "vendoremail" => 'required|email|unique:vendor,email',
                "vendoremail" => 'required|email',
                "businesscategory" => 'required',
                "password" => 'required',
                "confirm_password" => 'required|same:password'



            ]);
            $otp = mt_rand(100000, 999999);
            $expiry_date = now()->addMinutes(3);

            $existingVendor = Vendor::where(function ($query) use ($request) {
                $query->where('email', $request->vendoremail)
                    ->orWhere('vendormobile', $request->vendormobile);
            })->first();
            // dd($existingVendor);

            // if ($existingVendor && $existingVendor->isOtpVerified == 0) {
            //     $existingVendor->delete();
            // } 
            // else
            if ($existingVendor) {
                return response()->json([
                    'success' => false,
                    'message' => 'A customer with this email or mobile number already exists.',
                ], 409); // 409 Conflict HTTP status code
            }
            $Vendordata = array(

                "vendorname" => $request->vendorname,
                "vendormobile" => $request->vendormobile,
                "businessname" => $request->businessname,
                "vendoraddress" => Str::title($request->vendoraddress),
                "vendorstate" => $request->vendorstate,
                "vendorcity" => $request->vendorcity ?? 0,
                "vendorcity_name" => $request->vendorcity_name,
                "email" => $request->vendoremail,
                "ip_address" => $request->ip_address,
                "password" => Hash::make($request->confirm_password),
                "latitude" => $request->latitude,
                "longitude" => $request->longitude,
                "vendorsocialpage" => $request->vendorsocialpage,
                'businesscategory' => $request->businesscategory,
                'businessubcategory' => $request->businessubcategory,
                'otp' => $otp,
                'expiry_time' => $expiry_date,
                'strIP' => $request->ip(),
            );

            $Vendor = Vendor::create($Vendordata);


            $data = array(
                'otp' => $otp,
                "vendorname" => $request->vendorname
            );

            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();

            $msg = array(
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $request->vendoremail,
                'Subject' => $sendEmailDetails->strSubject
            );
            // 
            Mail::send('emails.OTPmail', ['data' => $data], function ($message) use ($msg) {
                $message->from($msg['FromMail'], $msg['Title']);
                $message->to($msg['ToEmail'])->subject($msg['Subject']);
            });
            DB::commit();
            return response()->json([
                'success' => true,
                'message' => 'Registration Successfully. OTP sent to the email.',
            ], 200);
        } catch (ValidationException $e) {
            DB::rollBack();
            // Format validation errors as a single string
            $errorMessage = implode(', ', Arr::flatten($e->errors()));

            return response()->json([
                'success' => false,
                'message' => $errorMessage,
            ], 422);
        } catch (\Throwable $th) {
            DB::rollBack();

            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function verifyOTP(Request $request)
    {
        try {
            $request->validate([
                'vendoremail' => 'required|email',
                "vendormobile" => '',
                'otp' => 'required',
            ]);

            $password = mt_rand(100000, 999999);


            // Retrieve the vendor based on the email and OTP
            $vendor = Vendor::where([
                'email' => $request->vendoremail,
                'otp' => $request->otp,
            ])->first();
            // dd($vendor);

            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP is invalid. Please enter a valid OTP.',
                ], 400);
            }

            // Check if the OTP has expired
            $expiryTime = Carbon::parse($vendor->expiry_time);
            if (now()->greaterThan($expiryTime)) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP has expired.',
                ], 400);
            }

            // Mark the OTP as verified and update the last login time
            $vendor->update([
                'isOtpVerified' => 1,
                // 'password' =>  Hash::make($password),
                'last_login' => now(),
            ]);

            $data = array(
                "name" =>  $vendor->vendorname
            );
            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();
            $msg = array(
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $request->vendoremail,
                'Subject' => $sendEmailDetails->strSubject
            );

            Mail::send('emails.welcomemail', ['data' => $data], function ($message) use ($msg) {
                $message->from($msg['FromMail'], $msg['Title']);
                $message->to($msg['ToEmail'])->subject($msg['Subject']);
            });
            // Prepare vendor details to return
            $vendorDetails = $vendor->only(['vendor_id', 'vendorname', 'isOtpVerified', 'vendormobile', 'email', 'businessname', 'vendoraddress', 'vendorsocialpage', 'businesscategory', 'businessubcategory', 'is_changepasswordfirsttime']);

            return response()->json([
                'success' => true,
                'message' => 'OTP is valid.',
                'vendor_details' => $vendorDetails,

            ], 200);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    public function login(Request $request)
    {
        try {
            // Validate the request inputs
            $request->validate([
                'vendoremail' => 'nullable|email', // Optional email validation
                'vendormobile' => 'nullable|digits_between:10,15', // Optional mobile validation
                'vendorpassword' => 'required',
            ]);

            // Ensure at least one of the inputs (email or mobile) is provided
            if (!$request->vendoremail && !$request->vendormobile) {
                return response()->json([
                    'success' => false,
                    'message' => 'Please provide either an email or mobile number.',
                ], 422);
            }

            // Determine the input type and set the field type
            $input = $request->vendoremail ?? $request->vendormobile;
            $fieldType = $request->vendoremail ? 'email' : 'vendormobile';

            $credentials = [
                $fieldType => $input,
                'password' => $request->vendorpassword,
            ];

            // Fetch the vendor by email or mobile
            $vendor = Vendor::where($fieldType, $input)->first();
            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => 'Vendor not found.',
                ], 404);
            }

            // Attempt to authenticate using the provided credentials
            if (Auth::guard('vendorapi')->attempt($credentials)) {
                $authenticatedVendor = Auth::guard('vendorapi')->user();

                $data = [
                    "vendor_id" => $authenticatedVendor->vendor_id,
                    "vendorname" => $authenticatedVendor->vendorname,
                    "vendormobile" => $authenticatedVendor->vendormobile,
                    "vendorimg" => $authenticatedVendor->vendorimg,
                    "vendoraddress" => $authenticatedVendor->vendoraddress,
                    "vendoremail" => $authenticatedVendor->email,
                    "facbooklink" => $authenticatedVendor->facbooklink,
                    "instragramlink" => $authenticatedVendor->instragramlink,
                    "businessname" => $authenticatedVendor->businessname,
                    "businessaddress" => $authenticatedVendor->businessaddress,
                    "vendorsocialpage" => $authenticatedVendor->vendorsocialpage,
                    "businesscategory" => $authenticatedVendor->businesscategory,
                    "businessubcategory" => $authenticatedVendor->businessubcategory,
                    "deviceToken" => $authenticatedVendor->deviceToken,
                    "vendorUsername" => $authenticatedVendor->login_id,
                    "otp" => $authenticatedVendor->otp,
                    "is_changepasswordfirsttime" => $authenticatedVendor->is_changepasswordfirsttime,
                    "isOtpVerified" => $authenticatedVendor->isOtpVerified,
                    "expiry_time" => $authenticatedVendor->expiry_time,
                    "iStatus" => $authenticatedVendor->iStatus,
                    "strIP" => $authenticatedVendor->strIP,
                    "created_at" => $authenticatedVendor->created_at,
                    "updated_at" => $authenticatedVendor->updated_at,
                ];

                // Generate JWT token
                $token = JWTAuth::fromUser($authenticatedVendor);

                return response()->json([
                    'success' => true,
                    'message' => 'Login successful.',
                    'vendordetail' => $data,
                    'authorisation' => [
                        'token' => $token,
                        'type' => 'bearer',
                    ],
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Invalid credentials. Please check your input and password.',
                ], 401);
            }
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $th) {
            // Handle unexpected errors
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function change_password(Request $request)
    {
        try {

            if (Auth::guard('vendorapi')->check()) {

                $request->validate(
                    [
                        "vendorid" => 'required',
                        "old_password" => 'required',
                        "new_password" => 'required',
                        "confirm_new_password" => 'required|same:new_password'
                    ],
                    [
                        'vendorid.required' => 'Vendor ID is required.',
                        'old_password.required' => 'Old Password is required.',
                        'new_password.required' => 'New Password is required.',
                        'new_password.same' => 'New password and confirmation password must match.'
                    ]
                );

                $Vendor =  Vendor::where(['iStatus' => 1, 'isDelete' => 0, 'vendor_id' => $request->vendorid])->first();
                if (!$Vendor) {
                    return response()->json([
                        'success' => false,
                        'message' => "Vendor not found."
                    ]);
                }

                if (Hash::check($request->old_password, $Vendor->password)) {

                    $newpassword = $request->new_password;
                    $confirmpassword = $request->confirm_new_password;

                    if ($newpassword == $confirmpassword) {

                        $Vendor->update([
                            'password' => Hash::make($confirmpassword),
                            'is_changepasswordfirsttime' => 1
                        ]);
                        return response()->json([
                            'success' => true,
                            'message' => 'Password updated successfully...',
                        ], 200);
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => 'password and confirm password does not match',
                        ], 200);
                    }
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Current Password does not match',
                    ], 200);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Vendor is not Authorised.',
                ], 401);
            }
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            // If there's an error, rollback any database transactions and return an error response.
            DB::rollBack();
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }


    public function logout(Request $request)
    {

        try {
            // Validate the vendorid passed in the request
            $request->validate([
                'vendorid' => 'required|integer'
            ]);

            // Optionally, fetch the vendor by vendorid (if you need to check or log something)
            $vendor = Vendor::find($request->vendorid);


            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => 'Vendor not found.'
                ], 404);
            }


            Auth::logout();
            session()->flush();

            // Optional: If you want to send the vendor details in the response
            return response()->json([
                'success' => true,
                'message' => 'Successfully logged out.',
                'vendorid' => $vendor->vendor_id,  // Including the vendorid in the response
            ]);
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Invalid token. Unable to logout.',
            ], 401);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }


    public function set_password(Request $request)
    {
        try {

            if (Auth::guard('vendorapi')->check()) {

                $request->validate(
                    [
                        "vendorid" => 'required',
                        "password" => 'required',
                        "confirm_password" => 'required|same:password'
                    ],
                    [
                        'vendorid.required' => 'Vendor ID is required.',
                        'password.required' => 'Password is required.',
                        'confirm_password.required' => 'Confirmation password is required.',
                        'confirm_password.same' => 'Password and confirmation password must match.'
                    ]
                );

                $Vendor =  Vendor::where(['iStatus' => 1, 'isDelete' => 0, 'vendor_id' => $request->vendorid])->first();
                if (!$Vendor) {
                    return response()->json([
                        'success' => false,
                        'message' => "Vendor not found."
                    ]);
                }

                Vendor::where(['iStatus' => 1, 'isDelete' => 0, 'vendor_id' => $request->vendorid])->update([
                    "password" => Hash::make($request->confirm_password)
                ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Password set successfully...',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Vendor is not Authorised.',
                ], 401);
            }
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            // If there's an error, rollback any database transactions and return an error response.
            DB::rollBack();
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }




    public function profiledetails(Request $request)
    {
        try {

            $request->validate([
                'vendorid' => 'required|integer',
                'vendorimg' => 'nullable|image|mimes:jpeg,png,jpg,gif',
            ]);

            $vendor = Vendor::where('vendor_id', $request->vendorid)
                ->where('iStatus', 1)
                ->where('isDelete', 0)
                ->first();



            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => 'Vendor not found.',
                ], 404);
            }

            $img = $vendor->vendorimg; // Keep the existing image by default
            if ($request->hasFile('vendorimg')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('vendorimg');
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationPath = $root . '/pricecut/upload/vendor/';

                // Ensure the directory exists
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }

                // Move the uploaded image to the destination path
                $image->move($destinationPath, $img);

                // Optional: Delete old image if applicable
                if ($vendor->vendorimg && file_exists($destinationPath . $vendor->vendorimg)) {
                    unlink($destinationPath . $vendor->vendorimg);
                }
            }

            // Update vendor profile with the new image path
            $vendor->vendorimg = $img;
            $vendor->save();

            return response()->json([
                'success' => true,
                'data' => [
                    "vendor_id" => $vendor->vendor_id,
                    "vendorname" => $vendor->vendorname,
                    "vendormobile" => $vendor->vendormobile,
                    "vendorimg" => 'https://getdemo.in/pricecut/upload/vendor/' . $img,
                    "vendoraddress" => $vendor->vendoraddress,
                    "vendoremail" => $vendor->email,
                    "facbooklink" => $vendor->facbooklink,
                    "instragramlink" => $vendor->instragramlink,
                    "businessname" => $vendor->businessname,
                    "businessaddress" => $vendor->businessaddress,
                    "vendorsocialpage" => $vendor->vendorsocialpage,
                    "businesscategory" => $vendor->businesscategory,
                    "businessubcategory" => $vendor->businessubcategory,
                    "deviceToken" => $vendor->deviceToken,
                    "vendorUsername" => $vendor->login_id,
                    "otp" => $vendor->otp,
                    "is_changepasswordfirsttime" => $vendor->is_changepasswordfirsttime,
                    "isOtpVerified" => $vendor->isOtpVerified,
                    "expiry_time" => $vendor->expiry_time,
                    "iStatus" => $vendor->iStatus,
                    "strIP" => $vendor->strIP,
                    "created_at" => $vendor->created_at,
                    "updated_at" => $vendor->updated_at,
                ],
            ], 200);
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'errors' => $e->errors(),
            ], 422);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'An error occurred while fetching profile details.',
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function profileUpdate(Request $request)
    {
        try {

            // if (Auth::guard('vendorapi')->check()) {

            $Vendor = Auth::guard('vendorapi')->user();

            $request->validate([
                'vendorid' => 'required'
            ]);

            $Vendor = Vendor::where(['iStatus' => 1, 'isDelete' => 0, 'vendor_id' => $request->vendorid])->first();

            if (!$Vendor) {
                return response()->json([
                    'success' => false,
                    'message' => "Vendor not found."
                ]);
            }

            // Start building the Vendor data
            $VendorData = [];

            // Add fields conditionally
            if ($request->has('vendorname')) {
                $VendorData["vendorname"] = $request->vendorname;
            }
            if ($request->has('vendormobile')) {
                $VendorData["vendormobile"] = $request->vendormobile;
            }
            if ($request->has('businessname')) {
                $VendorData["businessname"] = $request->businessname;
            }
            if ($request->has('vendoraddress')) {
                $VendorData["vendoraddress"] = $request->vendoraddress;
            }
            if ($request->has('vendoremail')) {
                $VendorData["email"] = $request->vendoremail;
            }
            if ($request->has('vendorsocialpage')) {
                $VendorData["vendorsocialpage"] = $request->vendorsocialpage;
            }
            if ($request->has('businesscategory')) {
                $VendorData["businesscategory"] = $request->businesscategory;
            }
            if ($request->has('businessubcategory')) {
                $VendorData["businessubcategory"] = $request->businessubcategory;
            }

            if ($request->hasFile('vendorimg')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('vendorimg');
                $imgName = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationPath = $root . '/pricecut/upload/vendor/';

                // Ensure the directory exists
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }

                // Move the uploaded image to the destination path
                $image->move($destinationPath, $imgName);

                // Delete the old image if it exists
                if ($Vendor->vendorimg && file_exists($destinationPath . $Vendor->vendorimg)) {
                    unlink($destinationPath . $Vendor->vendorimg);
                }

                // Update the image name
                $VendorData['vendorimg'] = $imgName;
            }

            // Always update 'updated_at'
            $VendorData['updated_at'] = now();

            DB::beginTransaction();

            try {

                Vendor::where(['vendor_id' => $request->vendorid])->update($VendorData);

                DB::commit();

                return response()->json([
                    'success' => true,
                    'message' => "Vendor Profile updated successfully.",
                    'data' => [
                        'vendorimg' => isset($VendorData['vendorimg']) ? asset('upload/vendor/' . $VendorData['vendorimg']) : null,
                    ]
                ], 200);
            } catch (\Throwable $th) {
                DB::rollBack();
                throw $th;
            }
            // } else {
            //     return response()->json([
            //         'success' => false,
            //         'message' => 'Vendor is not authorized.',
            //     ], 401);
            // }
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }
    public function forgot_password(Request $request)
    {
        try {
            $request->validate([
                'vendoremail' => 'required|email',
            ]);

            // Find the vendor by email
            $Vendor = Vendor::where(['iStatus' => 1, 'isDelete' => 0])
                ->where('email', $request->vendoremail)
                ->first();

            if (!$Vendor) {
                return response()->json([
                    'success' => false,
                    'message' => "Vendor not found."
                ], 404);
            }

            $otp = rand(1000, 9999);
            $expiry_date = now()->addMinutes(3);

            // Update the OTP and expiry in the database
            $Vendor->update([
                'otp' => $otp,
                'expiry_time' => $expiry_date,
            ]);

            // Send the email
            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();
            $msg = [
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $request->vendoremail,
                'Subject' => $sendEmailDetails->strSubject,
            ];

            $data = array(
                'otp' => $otp,
                "vendorname" => $Vendor->vendorname
            );


            Mail::send('emails.forgotPassword', ['data' => $data], function ($message) use ($msg) {
                $message->from($msg['FromMail'], $msg['Title']);
                $message->to($msg['ToEmail'])->subject($msg['Subject']);
            });

            return response()->json([
                'success' => true,
                'message' => 'OTP sent successfully.'
            ], 200);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }


    public function forgot_password_verifyOTP(Request $request)
    {
        try {
            $request->validate([

                'otp' => 'required'
            ]);

            $password = mt_rand(100000, 999999);


            // Retrieve the vendor based on the email and OTP
            $vendor = Vendor::where([

                'otp' => $request->otp
            ])->first();
            // dd($vendor);

            if (!$vendor) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP is invalid. Please enter a valid OTP.',
                ], 400);
            }

            // Check if the OTP has expired
            $expiryTime = Carbon::parse($vendor->expiry_time);
            if (now()->greaterThan($expiryTime)) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP has expired.',
                ], 400);
            }

            // Mark the OTP as verified and update the last login time
            $vendor->update([
                // 'isOtpVerified' => 1,
                'password' =>  Hash::make($password),
                'last_login' => now(),
            ]);

            $data = array(
                'password' => $password,
                "email" => $vendor->email,
                "name" =>  $vendor->vendorname


            );
            // dd($data);


            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();
            //    dd($sendEmailDetails);
            $msg = array(
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $vendor->email,
                'Subject' => $sendEmailDetails->strSubject
            );

            Mail::send('emails.forgotpasswordmail', ['data' => $data], function ($message) use ($msg) {
                $message->from($msg['FromMail'], $msg['Title']);
                $message->to($msg['ToEmail'])->subject($msg['Subject']);
            });



            // Prepare vendor details to return
            // $vendorDetails = $vendor->only(['vendor_id','vendorname', 'isOtpVerified', 'login_id', 'vendormobile', 'email', 'businessname', 'businessaddress','vendorsocialpage','businesscategory','businessubcategory','is_changepasswordfirsttime']);

            return response()->json([
                'success' => true,
                'message' => 'OTP is valid.',
                // 'vendor_details' => $vendorDetails,

            ], 200);
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }
}
