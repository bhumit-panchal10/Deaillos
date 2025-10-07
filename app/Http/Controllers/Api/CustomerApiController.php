<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CityMaster;
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
use App\Models\Customer;
use App\Models\Deals;
use App\Models\DealsOption;
use App\Models\CustomerReview;
use App\Models\UserSubscribeDeal;
use GuzzleHttp\Client;
use App\Models\Vendor;
use Google\Service\Monitoring\Custom;
use Illuminate\Support\Arr;
use Illuminate\Support\Str;
use App\Models\BaseURL;



class CustomerApiController extends Controller

// class DriverApiController extends PushNotificationController
{


    public function customersubscribedeal(Request $request)
    {

        try {
            $request->validate([
                'GUID' => 'required',
                'Customer_GUID' => 'required',
                'deal_option_id' => 'required',
            ]);

            // Fetch the deal along with options and images
            $subscribedeal = Deals::where('GUID', $request->GUID)
                ->first();

            if (!$subscribedeal) {
                return response()->json([
                    'success' => false,
                    'message' => 'Deal not found',
                ], 404);
            }
            $alreadySubscribed = UserSubscribeDeal::where('Customer_GUID', $request->Customer_GUID)
                ->where('deal_id', $subscribedeal->Deals_id)
                ->exists();

            if ($alreadySubscribed) {
                return response()->json([
                    'success' => false,
                    'message' => 'You have already subscribed to this deal.',
                ], 409); // 409 Conflict
            }

            $option = DealsOption::where('deal_option_id', $request->deal_option_id)
                ->first();

            $CustomerData = [
                'Customer_GUID' => $request->Customer_GUID,
                'vendorid' => $subscribedeal->vendorid,
                'deal_id' => $subscribedeal->Deals_id,
                'deal_title' => $subscribedeal->main_title,
                'deal_des' => $subscribedeal->deal_description,
                'dealvalidity_fromdate' => $subscribedeal->offer_start_date,
                'dealvalidity_todate' => $subscribedeal->offer_end_date,
                'deal_option_id' => $request->deal_option_id,
                'option_title' => $option->option_title,
                'regular_price' => $option->regular_price,
                'pricecut_price' => $option->pricecut_price,
                'monthly_voucher' => $option->monthly_voucher_cap,
                'created_at' => now()

            ];
            $UserSubscribeDeal = UserSubscribeDeal::create($CustomerData);

            if ($UserSubscribeDeal) {
                return response()->json([
                    'success' => true,
                    'message' => 'User Subscribed Deal Successfully',
                    'data' => $UserSubscribeDeal,
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deal not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function customersubscribedealdetail(Request $request)
    {

        try {
            $request->validate([
                'Customer_GUID' => 'required',
            ]);
            // $subdealdetail = UserSubscribeDeal::with(['customername', 'options' => function ($query) use ($request) {
            //     if (!is_null($request->deal_option_id)) {
            //         $query->where('deal_option_id', $request->deal_option_id);
            //     }
            // }])
            //     ->where('customer_id', $request->Customer_GUID)
            //     ->first();
            // dd($subdealdetail);

            $subdealdetail = UserSubscribeDeal::with(['customername'])
                ->where('Customer_GUID', $request->Customer_GUID)
                ->get();

            if ($subdealdetail) {
                return response()->json([
                    'success' => true,
                    'message' => 'User Subscribed Deal Detail fetch Successfully',
                    'data' => $subdealdetail,
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deal not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }
    public function customer_new_registration(Request $request)
    {
        // dd($request);
        try {

            $url = BaseURL::first();
            $guid = Str::uuid();
            $baseURL = $url->URL . $guid;
            $request->validate([
                "Customer_name" => 'required',
                "Customer_phone" => 'required|digits:10|unique:Customer,Customer_phone',
                "Customer_address" => 'required',
                "ip_address" => 'required',
                // "Customer_state" => 'required',
                // "Customer_city" => 'required',
                "Customer_email" => 'required|email',
                "password" => 'required',
                "confirm_password" => 'required|same:password'
            ]);
            $otp = mt_rand(100000, 999999);
            $expiry_date = now()->addMinutes(10);

            $existingCustomer = Customer::where(function ($query) use ($request) {
                $query->where('Customer_email', $request->Customer_email)
                    ->orWhere('Customer_phone', $request->Customer_phone);
            })->first();
            if ($existingCustomer) {
                return response()->json([
                    'success' => false,
                    'message' => 'A customer with this email or mobile number already exists.',
                ], 409); // 409 Conflict HTTP status code
            }

            $Customerdata = array(

                "Customer_name" => $request->Customer_name,
                "Customer_phone" => $request->Customer_phone,
                "Customer_address" => $request->Customer_address,
                // "Customer_state" => $request->Customer_state,
                // "Customer_city" => $request->Customer_city,
                "Customer_email" => $request->Customer_email,
                "ip_address" => $request->ip_address,
                "password" => Hash::make($request->password),
                "confirm_password" => Hash::make($request->confirm_password),
                'otp' => $otp,
                "Customer_GUID" => $guid,
                'expiry_time' => $expiry_date,
                'strIP' => $request->ip(),
            );

            $Customer = Customer::create($Customerdata);
            $data = array(
                'otp' => $otp,
                "Customer_name" => $request->Customer_name
            );

            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();

            $msg = array(
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $request->Customer_email,
                'Subject' => $sendEmailDetails->strSubject
            );
            // 
            Mail::send('emails.CustomerOTPmail', ['data' => $data], function ($message) use ($msg) {
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
                'Customer_email' => 'required|email',
                "Customer_phone" => '',
                'otp' => 'required',
            ]);

            $password = mt_rand(100000, 999999);


            // Retrieve the vendor based on the email and OTP
            $customer = Customer::where([
                'Customer_email' => $request->Customer_email,
                'otp' => $request->otp,
            ])->first();
            // dd($vendor);

            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP is invalid. Please enter a valid OTP.',
                ], 400);
            }

            // Check if the OTP has expired
            $expiryTime = Carbon::parse($customer->expiry_time);
            if (now()->greaterThan($expiryTime)) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP has expired.',
                ], 400);
            }

            // Mark the OTP as verified and update the last login time
            $customer->update([
                'isOtpVerified' => 1,
                // 'password' =>  Hash::make($password),
                'last_login' => now(),
            ]);

            $data = array(
                "name" =>  $customer->Customer_name
            );

            $customerDetails = $customer->only(['customer_id', 'Customer_GUID', 'Customer_name', 'isOtpVerified', 'Customer_phone', 'Customer_email', 'Customer_address']);

            return response()->json([
                'success' => true,
                'message' => 'OTP is valid.',
                'customer_details' => $customerDetails,

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
                'Customer_email' => 'nullable|email', // Optional email validation
                'Customer_phone' => 'nullable', // Optional mobile validation
                'Customerpassword' => 'required',
                'latitude' => 'required',
                'longitude' => 'required',
            ]);

            // Ensure at least one of the inputs (email or mobile) is provided
            if (!$request->Customer_email && !$request->Customer_phone) {
                return response()->json([
                    'success' => false,
                    'message' => 'Please provide either an email or mobile number.',
                ], 422);
            }

            // Determine the input type and set the field type
            $input = $request->Customer_email ?? $request->Customer_phone;
            $fieldType = $request->Customer_email ? 'Customer_email' : 'Customer_phone';

            $credentials = [
                $fieldType => $input,
                'password' => $request->Customerpassword,
            ];


            // Fetch the vendor by email or mobile
            $customer = Customer::where($fieldType, $input)->first();

            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'customer not found.',
                ], 404);
            }

            // Attempt to authenticate using the provided credentials
            if (Auth::guard('customerapi')->attempt($credentials)) {

                $authenticatedcustomer = Auth::guard('customerapi')->user();
                
                $authenticatedcustomer->latitude = $request->latitude;
                $authenticatedcustomer->longitude = $request->longitude;
                $authenticatedcustomer->save(); // Save changes to the DB

                $data = [
                    "customer_id" => $authenticatedcustomer->customer_id,
                    "Customer_name" => $authenticatedcustomer->Customer_name,
                    "Customer_email" => $authenticatedcustomer->Customer_email,
                    "Customer_phone" => $authenticatedcustomer->Customer_phone,
                    "Customer_city" => $authenticatedcustomer->Customer_city,
                    "Customer_state" => $authenticatedcustomer->Customer_state,
                    "Customer_address" => $authenticatedcustomer->Customer_address,
                    "Customer_GUID" => $authenticatedcustomer->Customer_GUID,
                    "iStatus" => $authenticatedcustomer->iStatus,
                    "strIP" => $authenticatedcustomer->strIP,
                    "created_at" => $authenticatedcustomer->created_at,
                    "updated_at" => $authenticatedcustomer->updated_at,
                ];

                // Generate JWT token
                $token = JWTAuth::fromUser($authenticatedcustomer);

                return response()->json([
                    'success' => true,
                    'message' => 'Login successful.',
                    'customerdetail' => $data,
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

            if (Auth::guard('customerapi')->check()) {

                $request->validate(
                    [
                        "Customer_GUID" => 'required',
                        "old_password" => 'required',
                        "new_password" => 'required',
                        "confirm_new_password" => 'required|same:new_password'
                    ],
                    [
                        'Customer_GUID.required' => 'Customer ID is required.',
                        'old_password.required' => 'Old Password is required.',
                        'new_password.required' => 'New Password is required.',
                        'new_password.same' => 'New password and confirmation password must match.'
                    ]
                );

                $Customer =  Customer::where(['iStatus' => 1, 'isDelete' => 0, 'Customer_GUID' => $request->Customer_GUID])->first();
                if (!$Customer) {
                    return response()->json([
                        'success' => false,
                        'message' => "Customer not found."
                    ]);
                }

                if (Hash::check($request->old_password, $Customer->password)) {

                    $newpassword = $request->new_password;
                    $confirmpassword = $request->confirm_new_password;

                    if ($newpassword == $confirmpassword) {

                        $Customer->update([
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
                    'message' => 'Customer is not Authorised.',
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

    public function forgot_password(Request $request)
    {
        try {
            $request->validate([
                'Customer_email' => 'required|email',
            ]);

            // Find the vendor by email
            $Customer = Customer::where(['iStatus' => 1, 'isDelete' => 0])
                ->where('Customer_email', $request->Customer_email)
                ->first();

            if (!$Customer) {
                return response()->json([
                    'success' => false,
                    'message' => "Customer not found."
                ], 404);
            }

            $otp = rand(1000, 9999);
            $expiry_date = now()->addMinutes(10);

            // Update the OTP and expiry in the database
            $Customer->update([
                'otp' => $otp,
                'expiry_time' => $expiry_date,
            ]);

            // Send the email
            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();
            $msg = [
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $request->Customer_email,
                'Subject' => $sendEmailDetails->strSubject,
            ];

            $data = array(
                'otp' => $otp,
                "Customer_name" => $Customer->Customer_name
            );


            Mail::send('emails.customerforgotPassword', ['data' => $data], function ($message) use ($msg) {
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
            $customer = Customer::where([

                'otp' => $request->otp
            ])->first();
            // dd($vendor);

            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP is invalid. Please enter a valid OTP.',
                ], 400);
            }

            // Check if the OTP has expired
            $expiryTime = Carbon::parse($customer->expiry_time);
            if (now()->greaterThan($expiryTime)) {
                return response()->json([
                    'success' => false,
                    'message' => 'OTP has expired.',
                ], 400);
            }

            // Mark the OTP as verified and update the last login time
            $customer->update([
                // 'isOtpVerified' => 1,
                'password' =>  Hash::make($password),
                'last_login' => now(),
            ]);

            $data = array(
                'password' => $password,
                "Customer_email" => $customer->Customer_email,
                "name" =>  $customer->Customer_name


            );

            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();
            $msg = array(
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => $customer->Customer_email,
                'Subject' => $sendEmailDetails->strSubject
            );

            Mail::send('emails.customerforgotpasswordmail', ['data' => $data], function ($message) use ($msg) {
                $message->from($msg['FromMail'], $msg['Title']);
                $message->to($msg['ToEmail'])->subject($msg['Subject']);
            });
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

    public function logout(Request $request)
    {
        try {
            $request->validate([
                'Customer_GUID' => 'required'
            ]);

            $customer = Customer::where('Customer_GUID', $request->Customer_GUID)->first();

            if (!$customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'Customer not found.'
                ], 404);
            }

            Auth::logout();
            session()->flush();

            return response()->json([
                'success' => true,
                'message' => 'Successfully logged out.',
                'customerid' => $customer->customer_id,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }


    public function profiledetails(Request $request)
    {
        try {

            $request->validate([
                'Customer_GUID' => 'required',
                'Customer_img' => 'nullable',
            ]);

            $Customer = Customer::where('Customer_GUID', $request->Customer_GUID)
                ->where('iStatus', 1)
                ->where('isDelete', 0)
                ->first();

            if (!$Customer) {
                return response()->json([
                    'success' => false,
                    'message' => 'Customer not found.',
                ], 404);
            }

            $img = $Customer->Customer_img; // Keep the existing image by default
            if ($request->hasFile('Customer_img')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('Customer_img');
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationPath = $root . '/pricecut/upload/customer/';

                // Ensure the directory exists
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }

                // Move the uploaded image to the destination path
                $image->move($destinationPath, $img);

                // Optional: Delete old image if applicable
                if ($Customer->Customer_img && file_exists($destinationPath . $Customer->Customer_img)) {
                    unlink($destinationPath . $Customer->Customer_img);
                }
            }

            // Update vendor profile with the new image path
            $Customer->Customer_img = $img;
            $Customer->save();

            return response()->json([
                'success' => true,
                'data' => [
                    "Customer_GUID" => $Customer->Customer_GUID,
                    "Customer_name" => $Customer->Customer_name,
                    "Customer_email" => $Customer->Customer_email,
                    "Customer_img" => asset('upload/customer/' . $img),
                    "Customer_phone" => $Customer->Customer_phone,
                    "Customer_city" => $Customer->Customer_city,
                    "Customer_state" => $Customer->Customer_state,
                    "Customer_address" => $Customer->Customer_address,
                    "iStatus" => $Customer->iStatus,
                    "strIP" => $Customer->strIP,
                    "created_at" => $Customer->created_at,
                    "updated_at" => $Customer->updated_at,
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

            if (Auth::guard('customerapi')->check()) {

                $Customer = Auth::guard('customerapi')->user();

                $request->validate([
                    'Customer_GUID' => 'required',

                ]);

                $Customer = Customer::where(['iStatus' => 1, 'isDelete' => 0, 'Customer_GUID' => $request->Customer_GUID])->first();

                if (!$Customer) {
                    return response()->json([
                        'success' => false,
                        'message' => "Customer not found."
                    ]);
                }

                // Start building the Vendor data
                $CustomerData = [];

                // Add fields conditionally
                if ($request->has('Customer_name')) {
                    $CustomerData["Customer_name"] = $request->Customer_name;
                }
                if ($request->has('Customer_email')) {
                    $CustomerData["Customer_email"] = $request->Customer_email;
                }
                if ($request->has('Customer_phone')) {
                    $CustomerData["Customer_phone"] = $request->Customer_phone;
                }
                if ($request->has('Customer_city')) {
                    $CustomerData["Customer_city"] = $request->Customer_city;
                }
                if ($request->has('Customer_state')) {
                    $CustomerData["Customer_state"] = $request->Customer_state;
                }
                if ($request->has('Customer_address')) {
                    $CustomerData["Customer_address"] = $request->Customer_address;
                }

                if ($request->hasFile('Customer_img')) {
                    $root = $_SERVER['DOCUMENT_ROOT'];
                    $image = $request->file('Customer_img');
                    $imgName = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                    $destinationPath = $root . '/pricecut/upload/customer/';

                    // Ensure the directory exists
                    if (!file_exists($destinationPath)) {
                        mkdir($destinationPath, 0755, true);
                    }

                    // Move the uploaded image to the destination path
                    $image->move($destinationPath, $imgName);

                    // Delete the old image if it exists
                    if ($Customer->Customer_img && file_exists($destinationPath . $Customer->Customer_img)) {
                        unlink($destinationPath . $Customer->Customer_img);
                    }

                    // Update the image name
                    $CustomerData['Customer_img'] = $imgName;
                }

                // Always update 'updated_at'
                $CustomerData['updated_at'] = now();

                DB::beginTransaction();

                try {

                    Customer::where(['Customer_GUID' => $request->Customer_GUID])->update($CustomerData);

                    DB::commit();

                    return response()->json([
                        'success' => true,
                        'message' => "Customer Profile updated successfully.",
                        'data' => [
                            'vendorimg' => isset($CustomerData['Customer_img']) ? asset('upload/customer/' . $CustomerData['Customer_img']) : null,
                        ]
                    ], 200);
                } catch (\Throwable $th) {
                    DB::rollBack();
                    throw $th;
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Customer is not authorized.',
                ], 401);
            }
        } catch (ValidationException $e) {
            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {
            DB::rollBack();
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    // public function reviewadd(Request $request)
    // {
    //     try {
    //         $request->validate([
    //             "review" => 'required',
    //             "customer_id" => 'required',
    //             "deal_id" => 'required',
    //             "vendor_id" => 'required'
    //         ]);

    //         if ($request->has('deal_id') && $request->deal_id) {
    //             $deal = Deals::find($request->deal_id);

    //             if ($deal) {

    //                 $CsutomerReview = CustomerReview::create([
    //                     'review' => $request->review,
    //                     'customer_id' => $request->customer_id,
    //                     'deal_id' => $request->deal_id,
    //                     'vendor_id' => $request->vendor_id,
    //                     'strIP' => $request->ip(),
    //                     'created_at' => now()

    //                 ]);

    //                 return response()->json([
    //                     'success' => true,
    //                     'data' => $CsutomerReview,
    //                     'message' => 'Review Added Successfully',
    //                 ], 201);
    //             } else {
    //                 return response()->json([
    //                     'success' => false,
    //                     'message' => 'Deal not found',
    //                 ], 404);
    //             }
    //         } else {
    //             return response()->json([
    //                 'success' => false,
    //                 'message' => 'Deals_id is required',
    //             ], 400);
    //         }
    //     } catch (\Throwable $th) {
    //         return response()->json([
    //             'success' => false,
    //             'error' => $th->getMessage(),
    //         ], 500);
    //     }
    // }

    public function reviewadd(Request $request)
    {
        try {
            $request->validate([
                "review" => 'required',
                "customer_id" => 'required',
                "deal_id" => 'required',
                "vendor_id" => 'required'
            ]);

            if ($request->has('deal_id') && $request->deal_id) {
                $deal = Deals::find($request->deal_id);

                if (!$deal) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Deal not found',
                    ], 404);
                }

                // ✅ Check if customer already reviewed this deal
                $existingReview = CustomerReview::where('customer_id', $request->customer_id)
                    ->where('deal_id', $request->deal_id)
                    ->first();

                if ($existingReview) {
                    return response()->json([
                        'success' => false,
                        'message' => 'You have already submitted a review for this deal.',
                    ], 409); // 409 Conflict
                }

                // Add new review
                $customerReview = CustomerReview::create([
                    'review' => $request->review,
                    'customer_id' => $request->customer_id,
                    'deal_id' => $request->deal_id,
                    'vendor_id' => $request->vendor_id,
                    'strIP' => $request->ip(),
                    'created_at' => now()
                ]);

                return response()->json([
                    'success' => true,
                    'data' => $customerReview,
                    'message' => 'Review Added Successfully',
                ], 201);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deal ID is required',
                ], 400);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }
}
