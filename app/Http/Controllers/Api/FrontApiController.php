<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Categories;
use App\Models\SubCategories;
use App\Models\Image;
use App\Models\Deals;
use App\Models\DealsOption;
use App\Models\Vendor;
use App\Models\Dealmultiimage;
use App\Models\StateMaster;
use App\Models\CityMaster;
use App\Models\CMSMaster;
use App\Models\promocode;
use App\Models\OfferImage;
use App\Models\HeaderImage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Arr;
use GuzzleHttp\Client;
use Illuminate\Support\Str;
use App\Models\BaseURL;
use Carbon\Carbon;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\Mail;


class FrontApiController extends Controller
{


    public function contactmailsend(Request $request)
    {
        try {
            //dd($request);
            $name = $request->name;
            $email = $request->email;
            $mobile = $request->mobile;
            $messageContent = $request->message;
            $reason = $request->reason;
            $sendEmailDetails = DB::table('sendemaildetails')->where(['id' => 9])->first();

            $msg = [
                'FromMail' => $sendEmailDetails->strFromMail,
                'Title' => $sendEmailDetails->strTitle,
                'ToEmail' => 'ai.dev.laravel10@gmail.com',
                'Subject' => $sendEmailDetails->strSubject ?? '',
            ];

            $data = [
                'Name' => $name,
                'Email' => $email,
                'Mobile' => $mobile,
                'Message' => $messageContent,
                'Reason' => $reason
            ];
            $mail = Mail::send('emails.contactusmail', ['data' => $data], function ($message) use ($msg) {
                $message->from($msg['FromMail'], $msg['Title']);
                $message->to($msg['ToEmail'])->subject($msg['Subject']);
            });

            return response()->json([
                'message' => 'Mail send Successfully',
                'success' => true

            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to send email',
                'error' => $th->getMessage()
            ], 500);
        }
    }

    public function statelist(Request $request)
    {
        try {

            $listOfStates = StateMaster::select(
                "stateId",
                "stateName"
            )->orderBy('stateName', 'asc')->where(['iStatus' => 1, 'isDelete' => 0])->get();

            return response()->json([
                'success' => true,
                'message' => "successfully fetched StateList...",
                'data' => $listOfStates,
            ], 200);
        } catch (\Throwable $th) {

            // If there's an error, rollback any database transactions and return an error response.

            DB::rollBack();

            return response()->json(['error' => $th->getMessage()], 500);
        }
    }
    public function citylist(Request $request, $stateid = null)
    {
        try {

            $stateid = $request->stateid;
            if ($stateid) {
                $request->validate([
                    'stateid' => 'required|integer',
                ]);
            }
            $formattedCities =  CityMaster::select(
                "city-masters.stateMasterStateId",
                "state-masters.stateName",
                "city-masters.iStatus",
                "city-masters.cityId",
                "city-masters.cityName"
            )
                ->leftjoin('state-masters', 'city-masters.stateMasterStateId', '=', 'state-masters.stateId')
                ->get();

            if ($stateid) {


                $formattedCities = CityMaster::select(
                    "city-masters.stateMasterStateId",
                    "state-masters.stateName",
                    "city-masters.iStatus",
                    "city-masters.cityId",
                    "city-masters.cityName"
                )
                    ->where(['city-masters.iStatus' => 1, 'city-masters.stateMasterStateId' => $stateid])
                    ->leftjoin('state-masters', 'city-masters.stateMasterStateId', '=', 'state-masters.stateId')
                    ->get();

                if (!$formattedCities->count() > 0) {
                    return response()->json([
                        'success' => false,
                        'message' => "no data found",
                        'data' => $formattedCities,
                    ], 200);
                }
            }

            return response()->json([
                'success' => true,
                'message' => "Cities fetched successfully",
                'data' => $formattedCities,
            ], 200);
        } catch (ValidationException $e) {

            return response()->json(['errors' => $e->errors()], 422);
        } catch (\Throwable $th) {

            // If there's an error, rollback any database transactions and return an error response.

            DB::rollBack();

            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    public function categories(Request $request)
    {

        try {
            $categories = Categories::select(
                "Categories_id",
                "Category_name"
            )->orderby('isequence','asc')->get();

            return response()->json([
                'message' => 'successfully categories fetched...',
                'success' => true,
                'data' => $categories,
            ], 200);
        } catch (\Throwable $th) {
            // If there's an error, rollback any database transactions and return an error response.
            DB::rollBack();
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    public function subcategories(Request $request)
    {

        $request->validate([
            'Categories_id' => 'required|exists:Categories,Categories_id',
        ]);

        try {
            $subcategories = SubCategories::select('iSubCategoryId', 'strSubCategoryName')
                ->where('iCategoryId', $request->Categories_id)
                ->get();


            // dd($subcategories);

            return response()->json([
                'message' => 'Successfully fetched subcategories...',
                'success' => true,
                'data' => $subcategories,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    public function getImages()
    {
        try {
            //Fetch images with their category and subcategory
            // $images = Image::with(['category', 'subcategory'])->get();
            // dd($images);

            $images = Image::select(
                'id',
                'cat_name',
                'subcat_name',
                'Image',
                'created_at'
            )->get();
            // Format the data for the API response
            $response = $images->map(function ($image) {
                return [
                    'id' => $image->id,
                    'category' => $image->cat_name,
                    'subcategory' => $image->subcat_name,
                    'image_url' => asset('/upload/Image/' . $image->Image),
                    'created_at' => $image->created_at->format('Y-m-d H:i:s'),
                ];
            });

            return response()->json([
                'success' => true,
                'data' => $response,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch images: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function getuploadimages(Request $request)
    {
        try {
            $request->validate([
                "Deals_id" => 'required'
            ]);

            // Fetch all images of the given deal_id
            $getmultiimages = Dealmultiimage::select(
                'Dealimage_id',
                'photo',
                'deal_id',
                'Image_type',
                'created_at'
            )
                ->where('deal_id', $request->Deals_id)
                ->where('isDelete', 0) // optional: exclude deleted
                ->get();

            // Group and format images by Image_type
            $groupedImages = [
                'self' => [],
                'bank' => [],
                'ai' => [],
            ];

            foreach ($getmultiimages as $image) {
                $imageData = [
                    'Dealimage_id' => $image->Dealimage_id,
                    'deal_id' => $image->deal_id,
                    'photo' => $image->photo,
                    'created_at' => optional($image->created_at)->format('Y-m-d H:i:s'),
                ];

                if ($image->Image_type == 0) {
                    $groupedImages['self'][] = $imageData;
                } elseif ($image->Image_type == 1) {
                    $groupedImages['bank'][] = $imageData;
                } elseif ($image->Image_type == 2) {
                    $groupedImages['ai'][] = $imageData;
                }
            }

            return response()->json([
                'success' => true,
                'data' => $groupedImages,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch images: ' . $th->getMessage(),
            ], 500);
        }
    }
    
    
    public function dealimagedelete(Request $request)
    {
        try {
            $request->validate([
                'Dealimage_id' => 'required|exists:Dealmultiimage,Dealimage_id',
            ]);

            $image = Dealmultiimage::where('Dealimage_id', $request->Dealimage_id)->first();

            if (!$image) {
                return response()->json([
                    'success' => false,
                    'message' => 'Image not found.',
                ], 404);
            }


            $root = $_SERVER['DOCUMENT_ROOT'];
            $fileName = basename($image->photo); // 1736586083_room-3.jpg
            $createdDate = optional($image->created_at)->format('d-m-y');
            $filePath = $root . '/pricecut/upload/deal-images/' . $createdDate . '/' . $fileName;
            // Delete file from folder if exists
            if (file_exists($filePath)) {

                unlink($filePath);
            }

            // Optionally: delete record from DB or soft delete
            $image->delete(); // or $image->update(['isDelete' => 1]);

            return response()->json([
                'success' => true,
                'message' => 'Image deleted successfully.',
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete image: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function OfferImageDisaplay()
    {
        try {

            $offerimages = OfferImage::select(
                'offerimage_id',
                'offer_image',
                'link',
                'is_align',
                'created_at'
            )->get();



            // Format the data for the API response
            $response = $offerimages->map(function ($image) {
                return [
                    'offerimage_id' => $image->offerimage_id,
                    'link' => $image->link,
                    'is_align' => $image->is_align,
                    'offer_image' => asset('/upload/offerImage/' . $image->offer_image),
                    'created_at' => $image->created_at->format('Y-m-d H:i:s'),
                ];
            });

            return response()->json([
                'success' => true,
                'data' => $response,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch images: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function HeaderImageDisaplay()
    {
        try {

            $headerimages = HeaderImage::select(
                'header_image_id',
                'header_image',
                'created_at'
            )->get();



            // Format the data for the API response
            $response = $headerimages->map(function ($image) {
                return [
                    'header_image_id' => $image->header_image_id,
                    'header_image' => asset('/upload/headerImage/' . $image->header_image),
                    'created_at' => $image->created_at->format('Y-m-d H:i:s'),
                ];
            });

            return response()->json([
                'success' => true,
                'data' => $response,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch images: ' . $th->getMessage(),
            ], 500);
        }
    }


    public function DisplayLocation(Request $request)
    {
        try {

            $request->validate([

                "vendorid" => 'required'
            ]);


            $Vendor = Vendor::select('vendor.*', 'state-masters.stateName as state_name', 'city-masters.cityName as city_name')
                ->leftJoin('state-masters', 'vendor.vendorstate', '=', 'state-masters.stateId')
                ->leftJoin('city-masters', 'vendor.vendorcity', '=', 'city-masters.cityId')
                ->where('vendor.vendor_id', '=', $request->vendorid)
                ->first();




            return response()->json([
                'success' => true,
                'data' => $Vendor,
            ]);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to fetch images: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function Deallist(Request $request)
    {

        try {
            $request->validate([
                'Deals_id' => 'required|exists:Deals,Deals_id', // Ensure the deal exists
            ]);

            // Fetch the deal along with options and images
            $deal = Deals::with(['options', 'images', 'vendor'])
                ->where('Deals_id', $request->Deals_id)
                ->first();
            if ($deal) {
                return response()->json([
                    'success' => true,
                    'data' => $deal,
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

    public function ManageDeal(Request $request)
    {
        try {
            $request->validate([
                'vendorid' => 'required',
            ]);

            $deal = Deals::with(['options', 'images', 'vendor:vendor_id,vendoraddress'])
                ->withCount('options')
                ->where('vendorid', $request->vendorid)
                ->get();
            if ($deal) {
                return response()->json([
                    'success' => true,
                    'data' => $deal,
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


    public function UpdateLocation(Request $request)
    {
        try {
            // Validate the incoming request
            $request->validate([
                "vendorid" => 'required',  // Ensure vendor exists
                "vendoraddress" => 'required',
                "vendormobile" => 'required',
                "vendorstate" => 'required',
                "vendorcity" => 'required',
                "Deals_id" => 'required'
            ]);

            // Find the vendor by vendor_id
            $vendor = Vendor::find($request->vendorid);

            if ($vendor) {
                // Update the vendor's address and mobile
                $vendor->update([
                    'vendoraddress' => $request->vendoraddress,
                    'vendormobile' => $request->vendormobile,
                    'vendorstate' => $request->vendorstate,
                    'vendorcity' => $request->vendorcity,
                    'deal_id' => $request->Deals_id,
                ]);

                return response()->json([
                    'success' => true,
                    'message' => 'Vendor location updated successfully.',
                    'data' => $vendor,  // Return the updated vendor data
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Vendor not found.',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update location: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function OptionList(Request $request)
    {
        try {
            // Validate the incoming request
            $request->validate([
                "Deals_id" => 'required|exists:Deals,Deals_id', // Ensure the deal exists
            ]);

            // Fetch the options related to the specified deal
            $dealOptions = DealsOption::where('deal_id', $request->Deals_id)->get();

            if ($dealOptions->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => 'No options found for the specified deal.',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $dealOptions,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to retrieve options: ' . $th->getMessage(),
            ], 500);
        }
    }


    public function AddBusinessInfo(Request $request)
    {

        try {
            // Validate the incoming request
            $request->validate([
                "business_desc" => 'required|string',
                "business_website" => 'required',
                "business_type" => 'required|string',
                "Deals_id" => 'required|exists:Deals,Deals_id', // Ensure Deals_id exists in the deals table
            ]);

            // Check if the deal exists
            $deal = Deals::where('Deals_id', $request->Deals_id)->first();


            if ($deal) {
                // Update the deal with new business info
                $deal->update([
                    'business_desc' => $request->business_desc,
                    'business_website' => $request->business_website,
                    'business_type' => Str::title($request->business_type),
                ]);
                $deal->is_publish = $deal->is_publish;

                return response()->json([
                    'success' => true,
                    'data' => $deal, // Return the updated deal
                    'message' => 'Deal Business Info Add Successfully',
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

    public function ShowBusinessInfo(Request $request)
    {

        try {
            // Find the deal option by DealsOption_id

            $request->validate([

                "Deals_id" => 'required'
            ]);

            $dealbusinessinfo = Deals::select('business_type', 'business_desc', 'Is_publish', 'business_website')->find($request->Deals_id);

            if ($dealbusinessinfo) {
                return response()->json([
                    'success' => true,
                    'data' => $dealbusinessinfo,
                    'message' => 'Deal Business Info Display Successfully',
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

    public function DealPublish(Request $request)
    {

        try {
            // Validate the incoming request
            $request->validate([

                "Deals_id" => 'required|exists:Deals,Deals_id', // Ensure Deals_id exists in the deals table
            ]);

            // Check if the deal exists
            $deal = Deals::where('Deals_id', $request->Deals_id)->first();


            if ($deal) {
                // Update the deal with new business info
                $deal->update([
                    'Is_publish' => 1,

                ]);

                return response()->json([
                    'success' => true,
                    'data' => $deal,
                    'message' => 'Deal Publish Successfully',
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



    public function Adddesortitle(Request $request)
    {
        try {
            // Validate the request data
            $url = BaseURL::first();
            $guid = Str::uuid();
            $baseURL = $url->URL . $guid;
            if ($request->has('Deals_id') && $request->Deals_id) {
                $request->validate([
                    "main_title" => 'required',
                    "deal_description" => 'required',
                    "deal_category_id" => 'required',
                    "deal_sub_category_id" => 'nullable',
                    "Deals_id" => 'required',
                    "Map_link" => 'required',
                    "deal_address" => 'required',
                    'display_start_date' => 'required|date_format:d-m-Y',
                    'display_end_date' => 'required|date_format:d-m-Y',
                    'offer_start_date' => 'required|date_format:d-m-Y',
                    'offer_end_date' => 'required|date_format:d-m-Y',

                ]);
            } else {
                $request->validate([
                    "main_title" => 'required',
                    "deal_description" => 'required',
                    "deal_category_id" => 'required',
                    "deal_sub_category_id" => 'nullable',
                    "vendorid" => 'required',
                    "Map_link" => 'required',
                    "deal_address" => 'required',
                    'display_start_date' => 'required|date_format:d-m-Y',
                    'display_end_date' => 'required|date_format:d-m-Y',
                    'offer_start_date' => 'required|date_format:d-m-Y',
                    'offer_end_date' => 'required|date_format:d-m-Y',


                ]);
            }
            
            // Check if the Deals_id is provided in the request
            if ($request->has('Deals_id') && $request->Deals_id) {
                // Check if the deal exists by Deals_id
                $deal = Deals::where('Deals_id', $request->Deals_id)->first();

                if ($deal) {
                    // If the deal exists, update it with the new data
                    $deal->update([
                        "main_title" => Str::title($request->main_title),
                        "deal_category_id" => $request->deal_category_id,
                        "deal_sub_category_id" => $request->deal_sub_category_id,
                        "Map_link" => $request->Map_link,
                        "deal_address" => $request->deal_address,
                        'display_start_date' => Carbon::createFromFormat('d-m-Y', $request->display_start_date)->format('Y-m-d'),
                        'display_end_date' => Carbon::createFromFormat('d-m-Y', $request->display_end_date)->format('Y-m-d'),
                        'offer_start_date' => Carbon::createFromFormat('d-m-Y', $request->offer_start_date)->format('Y-m-d'),
                        'offer_end_date' => Carbon::createFromFormat('d-m-Y', $request->offer_end_date)->format('Y-m-d'),
                        "deal_description" => $request->deal_description,
                        "deals_slug" => Str::slug($request->main_title),
                        "Is_publish" => $deal->Is_publish,

                    ]);

                    return response()->json([
                        'success' => true,
                        'data' => $deal,
                        'message' => 'Deal Title Updated Successfully',
                    ], 200);
                } else {
                    // If the deal does not exist, return an error
                    return response()->json([
                        'success' => false,
                        'message' => 'Deal not found',
                    ], 404);
                }
            } else {
                // If no Deals_id is provided, create a new deal
                $deal = Deals::create([
                    "main_title" => Str::title($request->main_title),
                    "Map_link" => $request->Map_link,
                    "deal_address" => $request->deal_address,
                    "deal_category_id" => $request->deal_category_id,
                    "deal_sub_category_id" => $request->deal_sub_category_id,
                    'display_start_date' => Carbon::createFromFormat('d-m-Y', $request->display_start_date)->format('Y-m-d'),
                    'display_end_date' => Carbon::createFromFormat('d-m-Y', $request->display_end_date)->format('Y-m-d'),
                    'offer_start_date' => Carbon::createFromFormat('d-m-Y', $request->offer_start_date)->format('Y-m-d'),
                    'offer_end_date' => Carbon::createFromFormat('d-m-Y', $request->offer_end_date)->format('Y-m-d'),
                    "deals_slug" => Str::slug($request->main_title),
                    "deal_description" => $request->deal_description,
                    "vendorid" => $request->vendorid,
                    "GUID" => $guid,
                ]);
                //dd($deal);

                return response()->json([
                    'success' => true,
                    'data' => $deal,
                    'message' => 'Deal Title Added Successfully',
                ], 201);
            }
        } catch (\Throwable $th) {
            // If an error occurs, roll back the transaction and return an error response
            DB::rollBack();
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function Addoption(Request $request)
    {
        try {
            $request->validate([
                "title" => 'required',
                "regularprice" => 'required',
                "pricecut_price" => 'required',
                "month_voucher_cap" => 'required',
                "Deals_id" => 'required' // Validate Deals_id exists in the Deals table
            ]);

            if ($request->has('Deals_id') && $request->Deals_id) {
                // Check if the deal exists
                $deal = Deals::find($request->Deals_id);

                if ($deal) {

                    // Create a new deal option and associate it with the deal
                    $dealOption = DealsOption::create([
                        'deal_id' => $request->Deals_id,  // Associate the deal option with the Deals_id
                        'option_title' => $request->title,
                        'regular_price' => $request->regularprice,
                        'pricecut_price' => $request->pricecut_price,
                        'monthly_voucher_cap' => $request->month_voucher_cap,
                        'strIP' => $request->ip(),
                        'created_at' => now()

                    ]);

                    return response()->json([
                        'success' => true,
                        'data' => $dealOption,
                        'message' => 'Deal Option Added Successfully',
                    ], 201);
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'Deal not found',
                    ], 404);
                }
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deals_id is required',
                ], 400);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function Showtitleordescription(Request $request)
    {
        try {
            $request->validate([
                "Deals_id" => 'required'
            ]);

            $deal = Deals::select(
                'main_title',
                'deal_category_id',
                'deal_sub_category_id',
                'deal_description',
                'Map_link',
                'deal_address',
                'display_start_date',
                'display_end_date',
                'offer_start_date',
                'offer_end_date',
                'is_publish'
            )->find($request->Deals_id);

            if ($deal) {
                // Format date fields to d-m-Y
                $deal->display_start_date = \Carbon\Carbon::parse($deal->display_start_date)->format('d-m-Y');
                $deal->display_end_date = \Carbon\Carbon::parse($deal->display_end_date)->format('d-m-Y');
                $deal->offer_start_date = \Carbon\Carbon::parse($deal->offer_start_date)->format('d-m-Y');
                $deal->offer_end_date = \Carbon\Carbon::parse($deal->offer_end_date)->format('d-m-Y');

                return response()->json([
                    'success' => true,
                    'data' => $deal,
                    'message' => 'Deal Displayed Successfully',
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


    public function UpdateOption(Request $request)
    {

        try {
            // Validate the input data
            $request->validate([
                'option_title' => 'required|string',
                'regular_price' => 'required|numeric',
                'pricecut_price' => 'required|numeric',
                'monthly_voucher_cap' => 'required|numeric',
                'deal_option_id' => 'required',
            ]);

            // Find the deal option by DealsOption_id
            $dealOption = DealsOption::find($request->deal_option_id);

            if ($dealOption) {
                // Update the deal option
                $dealOption->update([
                    'option_title' => $request->option_title,
                    'regular_price' => $request->regular_price,
                    'pricecut_price' => $request->pricecut_price,
                    'monthly_voucher_cap' => $request->monthly_voucher_cap,
                ]);

                return response()->json([
                    'success' => true,
                    'data' => $dealOption,
                    'message' => 'Deal Option Updated Successfully',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deal Option not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function DeleteOption(Request $request)
    {
        try {
            // Find the deal option by DealsOption_id
            $request->validate([

                "deal_option_id" => 'required'
            ]);
            $dealOption = DealsOption::find($request->deal_option_id);


            if ($dealOption) {
                // Delete the deal option
                $dealOption->delete();

                return response()->json([
                    'success' => true,
                    'message' => 'Deal Option Deleted Successfully',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deal Option not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function AddPhoto(Request $request)
    {
        try {
            // Validate inputs
            $validationRules = [
                'Deals_id' => 'required',
            ];

            if ($request->has('imagebank_id')) {
                $validationRules['imagebank_id'] = 'required|exists:Image,id';
            }

            $request->validate($validationRules);

            // Fetch ImageBank if imagebank_id is provided
            $Imagebank = $request->has('imagebank_id')
                ? Image::findOrFail($request->imagebank_id)
                : null;


            // Define upload directory
            $root = $_SERVER['DOCUMENT_ROOT'];
            $currentDate = now()->format('d-m-y');
            $destinationPath = $root . '/pricecut/upload/deal-images/' . $currentDate . '/';
            if (!file_exists($destinationPath)) {
                mkdir($destinationPath, 0755, true);
            }

            $imgNames = [];
            $isPrimary = 1; // Default the first image as primary

            // Handle photo uploads
            if ($request->hasFile('photos')) {

                $photos = $request->file('photos');

                foreach ($photos as $index => $image) {
                    $imgName = time() . '_' . $image->getClientOriginalName();

                    $image->move($destinationPath, $imgName);

                    $dealImage = Dealmultiimage::create([
                        'Image_type' => 0,
                        'photo' => $imgName,
                        'deal_id' => $request->Deals_id,
                        'is_primary' => $index === 0 ? 1 : 0,
                        'created_at' => now(),
                        'strIP' => $request->ip(),
                    ]);

                    $imgNames[] = $imgName;
                }
            }

            if ($request->has('ai_photos')) {
                $aiPhotos = is_array($request->ai_photos)
                    ? $request->ai_photos
                    : (is_string($request->ai_photos) ? [$request->ai_photos] : json_decode($request->ai_photos, true));

                if (!is_array($aiPhotos)) {
                    return response()->json([
                        'success' => false,
                        'message' => 'Invalid format for ai_photos. It must be an array.',
                    ], 400);
                }

                foreach ($aiPhotos as $imageUrl) {
                    // Extract the filename from the URL
                    $imageName = basename($imageUrl); // "1741330731_ai.png"

                    // Generate a new unique name
                    $imgName = time() . '_' . $imageName;
                    $imagePath = $destinationPath . $imgName;

                    // Define source path
                    $sourcePath = $root . "/pricecut/upload/ai-images/" . now()->format('d-m-y') . "/" . $imageName;

                    if (file_exists($sourcePath)) {
                        copy($sourcePath, $imagePath);
                    } else {
                        return response()->json([
                            'success' => false,
                            'message' => "AI photo {$imageName} does not exist at {$sourcePath}.",
                        ], 404);
                    }

                    // Store in database
                    Dealmultiimage::create([
                        'Image_type' => 2,
                        'photo' => $imgName,
                        'deal_id' => $request->Deals_id,
                        'is_primary' => 0,
                        'created_at' => now(),
                        'strIP' => $request->ip(),
                    ]);

                    $imgNames[] = $imgName;
                }
            }






            // Handle ImageBank scenario

            if ($Imagebank) {
                // Define the source and destination paths
                $sourceImagebankPath = $root . '/pricecut/upload/Image/' . $Imagebank->Image; // Assuming the Imagebank images are stored here
                $destinationImagebankPath = $root . '/pricecut/upload/deal-images/' . $currentDate . '/' . $Imagebank->Image;

                if (file_exists($sourceImagebankPath)) {
                    // Copy the ImageBank image to the destination directory
                    if (!file_exists($destinationImagebankPath)) {
                        copy($sourceImagebankPath, $destinationImagebankPath);
                    }

                    // Save the ImageBank image details to the database
                    Dealmultiimage::create([
                        'Image_type' => 1,
                        'photo' => $Imagebank->Image,
                        'deal_id' => $request->Deals_id,
                        'imagebank_id' => $request->imagebank_id,
                        'created_at' => now(),
                        'strIP' => $request->ip(),
                    ]);

                    // Add the image to the response URL list
                    $imgNames[] = $Imagebank->Image;
                } else {
                    // Source file does not exist
                    return response()->json([
                        'success' => false,
                        'message' => 'ImageBank file does not exist at the source location.',
                    ], 404);
                }
            }

            // Build response for uploaded photos
            $photoUrls = array_map(function ($imgName) use ($currentDate) {
                return asset('upload/deal-images/' . $currentDate . '/' . $imgName);
            }, $imgNames);

            return response()->json([
                'success' => true,
                'message' => 'Photos added successfully.',
                'photos' => $photoUrls,
            ], 200);
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => implode(', ', Arr::flatten($e->errors())),
            ], 422);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to update photos: ' . $th->getMessage(),
            ], 500);
        }
    }


    public function deleteImage(Request $request)
    {

        $request->validate([

            "Dealimage_id" => 'required',
        ]);
        try {
            // Find the image record in the database
            $image = Dealmultiimage::findOrFail($request->Dealimage_id);
            // Get the image path
            $imagePath = public_path('upload/deal-images/' . $image->photo);
            // Check if the image is primary
            $isPrimary = $image->is_primary;
            // Delete the image file from the filesystem
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
            // Delete the record from the database
            $image->delete();
            // If the deleted image was primary, set another image as primary
            if ($isPrimary) {
                $nextImage = Dealmultiimage::where('deal_id', $image->deal_id)->first();
                if ($nextImage) {
                    $nextImage->update(['is_primary' => 1]);
                }
            }

            return response()->json([
                'success' => true,
                'message' => 'Image deleted successfully',
            ], 200);
        } catch (ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Image not found',
            ], 404);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to delete image: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function promocodeadd(Request $request)
    {
        // Validate the incoming data
        $validator = Validator::make($request->all(), [
            'code' => 'required|string|max:50|unique:promocodes,code',
            'dis_per' => 'required|numeric|min:0',
            'description' => 'required',
            'pro_img' => 'required',
            'start_date' => 'required|date_format:d-m-Y',
            'end_date' => 'required|date_format:d-m-Y|after:start_date',
            'category_id' => 'nullable|exists:Categories,Categories_id',
            'subcategory_id' => 'nullable|exists:subcategory,iSubCategoryId',
            'vendorid' => 'nullable',
            'link' => 'nullable',
        ]);

        // Check for validation failure
        if ($validator->fails()) {
            return response()->json([
                'success' => false,
                'message' => $validator->errors(),
            ], 422);  // 422 Unprocessable Entity
        }

        try {
            // Handle image upload
            $img = null;
            if ($request->hasFile('pro_img')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('pro_img');
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationPath = $root . '/pricecut/upload/promocode/';


                // Ensure the directory exists
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }

                // Move the uploaded image to the destination path
                $image->move($destinationPath, $img);
            }

            // Generate a unique identifier
            $guid = Str::uuid();
            $baseURL = BaseURL::first()->URL . $guid;

            // Create new promocode record
            $promocode = new promocode([
                'code' => $request->input('code'),
                'dis_per' => $request->input('dis_per'),
                'description' => $request->input('description'),
                'start_date' => Carbon::createFromFormat('d-m-Y', $request->start_date)->format('Y-m-d'),
                'end_date' => Carbon::createFromFormat('d-m-Y', $request->end_date)->format('Y-m-d'),
                'category_id' => $request->input('category_id'),
                'subcat_id' => $request->input('subcategory_id'),
                'vendorid' => $request->input('vendorid'),
                'link' => $request->input('link'),
                'GUID' => $guid,
                'pro_img' => $img,  // Save image filename in database
                'created_at' => now(),
                'strIP' => $request->ip(),
            ]);

            // Save to the database
            $promocode->save();

            return response()->json([
                'success' => true,
                'message' => 'Promocode created successfully.',
                'data' => $promocode
            ], 201);  // 201 Created

        } catch (\Exception $e) {
            // Handle any errors
            return response()->json([
                'success' => false,
                'message' => 'An error occurred while creating the promocode.',
                'error' => $e->getMessage(), // Show detailed error message for debugging
            ], 500);  // 500 Internal Server Error
        }
    }


    public function promocodelist(Request $request)
    {
        try {
            $request->validate([
                "vendorid" => 'required',
            ]);

            $promocode = promocode::with(['category', 'subcategory'])->where('vendorid', $request->vendorid)->get();

            if ($promocode->isNotEmpty()) {
                // Transform the data to include formatted dates and related names
                $data = $promocode->map(function ($promo) {
                    return [
                        'promo_id' => $promo->promo_id,
                        'code' => $promo->code,
                        'description' => $promo->description,
                        'start_date' => \Carbon\Carbon::parse($promo->start_date)->format('d-m-Y'),
                        'end_date' => \Carbon\Carbon::parse($promo->end_date)->format('d-m-Y'),
                        'iStatus' => $promo->iStatus,
                        'isDelete' => $promo->isDelete,
                        'strIP' => $promo->strIP,
                        'created_at' => $promo->created_at,
                        'updated_at' => $promo->updated_at,
                        'link' => $promo->link,
                        'pro_img' => 'https://getdemo.in/pricecut/upload/promocode/' . $promo->pro_img,
                        'dis_per' => $promo->dis_per,
                        'category_name' => $promo->category->Category_name ?? null, // Access category name
                        'subcategory_name' => $promo->subcategory->strSubCategoryName ?? null, // Access subcategory name
                    ];
                });

                return response()->json([
                    'success' => true,
                    'data' => $data,
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Promocode not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json(
                [
                    'success' => false,
                    'error' => $th->getMessage(),
                ],
                500
            );
        }
    }

    public function promocodeshow(Request $request)
    {

        try {

            $request->validate([
                'promo_id' => 'required|exists:promocodes,promo_id',
            ]);
            $promocode = promocode::where('promo_id', $request->promo_id)->first();

            if ($promocode) {
                $promocode->start_date = \Carbon\Carbon::parse($promocode->start_date)->format('d-m-Y');
                $promocode->end_date = \Carbon\Carbon::parse($promocode->end_date)->format('d-m-Y');
                $promocode->pro_img = 'https://getdemo.in/pricecut/upload/promocode/' . $promocode->pro_img;
                return response()->json([
                    'success' => true,
                    'data' => $promocode,
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

    public function Updatepromocode(Request $request)
    {
        try {

            $request->validate([
                'code' => 'required|string|max:50',
                'dis_per' => 'required|numeric|min:0',
                'description' => 'required',
                'promo_id' => 'required',
                'pro_img' => 'required',
                'start_date' => 'required|date_format:d-m-Y',
                'end_date' => 'required|date_format:d-m-Y|after:start_date',
                'category_id' => 'nullable|exists:Categories,Categories_id',
                'subcategory_id' => 'nullable|exists:subcategory,iSubCategoryId',
                'link' => 'nullable',
            ]);

            // Find the vendor by vendor_id
            $promocode = promocode::find($request->promo_id);
            if (!$promocode) {
                return response()->json([
                    'success' => false,
                    'message' => 'Promocode not found.',
                ], 404);
            }

            if ($request->hasFile('pro_img')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('pro_img');
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationPath = $root . '/pricecut/upload/promocode/';

                // Ensure the directory exists
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }

                // Move the uploaded image to the destination path
                $image->move($destinationPath, $img);

                // Delete old image if it exists
                if ($promocode->pro_img && file_exists($destinationPath . $promocode->pro_img)) {
                    unlink($destinationPath . $promocode->pro_img);
                }

                // Update pro_img field
                $promocode->pro_img = $img;
            }

            if ($promocode) {
                // Update the vendor's address and mobile
                $promocode->update([
                    'code' => $request->code,
                    'description' => $request->description,
                    'dis_per' => $request->dis_per,
                    'start_date' => Carbon::createFromFormat('d-m-Y', $request->start_date)->format('Y-m-d'),
                    'end_date' => Carbon::createFromFormat('d-m-Y', $request->end_date)->format('Y-m-d'),
                    'category_id' => $request->category_id,
                    'subcategory_id' => $request->subcategory_id,
                    'link' => $request->link,
                    'updated_at' => now(),
                    'pro_img' => $promocode->pro_img,
                ]);
                $promocode->start_date = Carbon::createFromFormat('Y-m-d', $promocode->start_date)->format('d-m-Y');
                $promocode->end_date = Carbon::createFromFormat('Y-m-d', $promocode->end_date)->format('d-m-Y');
                $promocode->pro_img = url('upload/promocode/' . $promocode->pro_img);
                return response()->json([
                    'success' => true,
                    'message' => 'promocode updated successfully.',
                    'data' => $promocode,
                ]);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'promocode not found.',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to promocode: ' . $th->getMessage(),
            ], 500);
        }
    }

    public function Deletepromocode(Request $request)
    {
        try {
            $request->validate([

                "promo_id" => 'required'
            ]);
            $promocode = promocode::find($request->promo_id);


            if ($promocode) {
                $promocode->delete();

                return response()->json([
                    'success' => true,
                    'message' => 'promocode Deleted Successfully',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'promocode not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function DeleteDeal(Request $request)
    {
        try {
            $request->validate([
                "Deals_id" => 'required|integer',
            ]);

            // Find the deal by ID
            $Deal = Deals::find($request->Deals_id);

            if ($Deal) {
                // Delete associated options
                DealsOption::where('deal_id', $Deal->Deals_id)->delete();

                // Delete associated images
                Dealmultiimage::where('deal_id', $Deal->Deals_id)->delete();

                // Delete the deal
                $Deal->delete();

                return response()->json([
                    'success' => true,
                    'message' => 'Deal and its associated records deleted successfully',
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


    public function promocodesearch(Request $request)
    {

        $query = promocode::query();

        if ($request->has('promo_code') && !empty($request->promo_code)) {
            $query->where('code', 'like', '%' . $request->promo_code . '%');
        }

        if ($request->has('expires_at')) {
            $query->whereDate('end_date', '=', $request->expires_at);
        }

        if ($request->has('category') && !empty($request->category)) {
            $query->where('category_id', 'like', '%' . $request->category . '%');
        }

        if ($request->has('subcategory') && !empty($request->subcategory)) {
            $query->where('subcat_id', 'like', '%' . $request->subcategory . '%');
        }

        if ($request->has('city') && !empty($request->city)) {
            $query->where('city_id', 'like', '%' . $request->city . '%');
        }

        if ($request->has('state') && !empty($request->state)) {
            $query->where('state_id', 'like', '%' . $request->state . '%');
        }

        // Get the filtered promocodes with related data
        $promoCodes = $query->with(['category', 'subcategory', 'state', 'city'])->get();

        // Format the response to include the names of related entities
        $formattedPromoCodes = $promoCodes->map(function ($promoCode) {
            return [
                'promo_id' => $promoCode->promo_id,
                'code' => $promoCode->code,
                'category_id' => $promoCode->category_id,
                'subcat_id' => $promoCode->subcat_id,
                'city_id' => $promoCode->city_id,
                'state_id' => $promoCode->state_id,
                'start_date' => $promoCode->start_date,
                'end_date' => $promoCode->end_date,
                'iStatus' => $promoCode->iStatus,
                'isDelete' => $promoCode->isDelete,
                'strIP' => $promoCode->strIP,
                'link' => $promoCode->link,
                'dis_per' => $promoCode->dis_per,
                'vendorid' => $promoCode->vendorid,
                'category_name' => $promoCode->category ? $promoCode->category->Category_name : null,
                'subcategory_name' => $promoCode->subcategory ? $promoCode->subcategory->strSubCategoryName : null,
                'state_name' => $promoCode->state ? $promoCode->state->stateName : null,
                'city_name' => $promoCode->city ? $promoCode->city->cityName : null,
            ];
        });

        // Return the formatted response
        return response()->json([
            'success' => true,
            'data' => $formattedPromoCodes
        ]);
    }

    // public function Dealsearch(Request $request)
    // {
    //     try {
    //         // Build the base query
    //         $query = Deals::with([
    //             'options',
    //             'images',
    //             'vendor' => function ($q) {
    //                 $q->select('vendor_id', 'vendoraddress', 'latitude', 'longitude', 'vendorcity', 'businessname','businessaddress');
    //             },
    //             'reviews'
    //         ])
    //             ->withCount([
    //                 'reviews as total_reviews',
    //             ])
    //             ->withAvg('reviews as average_rating', 'review')
    //             ->whereHas('vendor', function ($q) {
    //                 $q->whereNotNull('latitude')->whereNotNull('longitude');
    //             })
    //             ->where('Is_publish', 1);

    //         if ($request->filled('Title') || $request->filled('businessname') || $request->filled('deal_address') ) {
    //             $query->where(function ($q) use ($request) {
    //                 if ($request->filled('Title')) {
    //                     $q->where('main_title', 'like', '%' . $request->Title . '%');
    //                 }
    //                 if ($request->filled('businessname')) {
    //                     $q->orWhereHas('vendor', function ($q) use ($request) {
    //                         $q->where('businessname', 'like', '%' . $request->businessname . '%');
    //                     });
    //                 }
    //                  if ($request->filled('deal_address')) {
    //                     $q->where('deal_address', 'like', '%' . $request->deal_address . '%');
    //                 }
                   
    //             });
    //         }

    //         // Filter by city
    //         if ($request->filled('city')) {
    //             $query->whereHas('vendor', function ($q) use ($request) {
    //                 $q->where('vendorcity', '=', $request->city);
    //             });
    //         }
            
    //          // Filter by category
    //         if ($request->filled('category_id')) {
    //             $query->whereHas('vendor', function ($q) use ($request) {
    //                 $q->where('businesscategory', '=', $request->category_id);
    //             });
    //         }

    //         // Location-based search using Google Distance Matrix API
    //         if ($request->filled('lat') && $request->filled('long')) {
    //             $strUserLat = $request->lat;
    //             $strUserLong = $request->long;

    //             $vendors = Vendor::whereNotNull('latitude')
    //                 ->whereNotNull('longitude')
    //                 ->get();

    //             if ($vendors->isEmpty()) {
    //                 return response()->json(['message' => 'No vendor found'], 404);
    //             }

    //             // Prepare Distance Matrix API call
    //             $client = new Client();
    //             $url = "https://maps.googleapis.com/maps/api/distancematrix/json";
    //             $origins = "$strUserLat,$strUserLong";
    //             $destinations = $vendors->map(fn($vendor) => "{$vendor->latitude},{$vendor->longitude}")->implode('|');

    //             $response = $client->get($url, [
    //                 'query' => [
    //                     'origins' => $origins,
    //                     'destinations' => $destinations,
    //                     'key' => "AIzaSyDPzFD2CfOOMLxSl04wsqGcXqX0t1mQFrI",
    //                     'departure_time' => 'now',
    //                 ]
    //             ]);

    //             $distanceMatrix = json_decode($response->getBody()->getContents(), true);
    //             if ($distanceMatrix['status'] != 'OK') {
    //                 return response()->json(['message' => 'Error calculating distances'], 500);
    //             }

    //             // Assign distances to vendors
    //             $elements = $distanceMatrix['rows'][0]['elements'];
    //             foreach ($vendors as $index => $vendor) {
    //                 $vendor->distance = $elements[$index]['distance']['value'];
    //                 $vendor->duration_in_traffic = $elements[$index]['duration_in_traffic']['value'];
    //             }

    //             // Filter vendors within 30 km
    //             $nearbyVendors = $vendors->filter(fn($vendor) => $vendor->distance <= 30000);

    //             if ($nearbyVendors->isEmpty()) {
    //                 return response()->json([
    //                     'status' => false,
    //                     'message' => 'No vendors found within 30 km'
    //                 ], 404);
    //             }

    //             $sortedVendors = $nearbyVendors->sortBy('distance')->values();
    //         }

    //         // Fetch deals

    //         $deals = $query->get();
    //         //$deals = $query->tosql();
    //         //dd($deals);
            
    //         $popularDeals = Deals::with(['options', 'images', 'vendor', 'reviews'])
    //         ->withCount('reviews as total_reviews')
    //         ->withAvg('reviews as average_rating', 'review')
    //         ->where('Is_publish', 1)
    //         ->whereHas('vendor', function ($q) use ($request) {
    //                 if ($request->filled('city')) {
    //                     $q->where('vendorcity', $request->city);
    //                 }
    //             })
    //         ->latest()
    //         ->take(5)
    //         ->get();

    //         if ($deals->isEmpty()) {
    //             return response()->json([
    //                 'success' => false,
    //                 'message' => 'No deals found',
    //             ], 404);
    //         }

    //         // Apply discount calculation
    //         $deals->transform(function ($deal) {
    //             if ($deal->options) {
    //                 $deal->options = $deal->options->map(function ($option) {
    //                     if (!empty($option->regular_price) && !empty($option->pricecut_price) && $option->regular_price > 0) {
    //                         $discount = (($option->regular_price - $option->pricecut_price) / $option->regular_price) * 100;
    //                         $option->discount_percentage = round($discount);
    //                     } else {
    //                         $option->discount_percentage = 0.00;
    //                     }
    //                     return $option;
    //                 });
    //             }
    //             $deal->average_rating = round($deal->average_rating, 1); // e.g. 4.3
    //             $deal->total_reviews = $deal->total_reviews;
    //             return $deal;
    //         });

    //         // Return the final JSON response
    //         return response()->json([
    //             'success' => true,
    //             'data' => $deals,
    //             'popular_deals' => $popularDeals,
    //         ], 200);
    //     } catch (\Throwable $th) {
    //         return response()->json([
    //             'success' => false,
    //             'error' => $th->getMessage(),
    //         ], 500);
    //     }
    // }
    
    public function Dealsearch(Request $request)
    {
        try {
            // Get user location if logged in
          
           $now = Carbon::now();
    
            // Build base query
            $query = Deals::with([
                'options',
                'images',
                'vendor' => function ($q) {
                    $q->select('vendor_id', 'vendoraddress', 'latitude', 'longitude', 'vendorcity', 'businessname','businessaddress');
                },
                'reviews'
            ])
            ->withCount('reviews as total_reviews')
            ->withAvg('reviews as average_rating', 'review')
            ->whereHas('vendor', function ($q) {
                $q->whereNotNull('latitude')->whereNotNull('longitude');
            })
            //->where('display_end_date', '>=', $now)
            ->where('Is_publish', 1);
    
            // Search filters
            if ($request->filled('Title') || $request->filled('businessname') || $request->filled('deal_address') || $request->filled('category_id') || $request->filled('subcategory_id') ) {
                $query->where(function ($q) use ($request) {
                    if ($request->filled('Title')) {
                        $q->where('main_title', 'like', '%' . $request->Title . '%');
                    }
                    if ($request->filled('businessname')) {
                        $q->orWhereHas('vendor', function ($q) use ($request) {
                            $q->where('businessname', 'like', '%' . $request->businessname . '%');
                        });
                    }
                    if ($request->filled('deal_address')) {
                        $q->where('deal_address', 'like', '%' . $request->deal_address . '%');
                    }
                    if ($request->category_id) {
                        $q->where('deal_category_id', $request->category_id);
                    }
                    if ($request->subcategory_id) {
                        $q->where('deal_sub_category_id', $request->subcategory_id);
                    }

                });
            }
    
            // City filter
            if ($request->filled('city')) {
                $query->whereHas('vendor', function ($q) use ($request) {
                    $q->where('vendorcity', '=', $request->city);
                });
            }
    
    
            // Distance Matrix logic
            $vendorDistanceMap = [];
            $vendorTextMap = [];
            
            
            $customerLat = $request->lat;
            $customerLong = $request->long;
            if (($request->filled('lat') && $request->filled('long')) || ($customerLat && $customerLong)) {
                $strUserLat = $request->filled('lat') ? $request->lat : $customerLat;
                
                $strUserLong = $request->filled('long') ? $request->long : $customerLong;
    
                $vendors = Vendor::whereNotNull('latitude')
                ->whereNotNull('longitude')
                ->when($request->filled('city'), function ($q) use ($request) {
                    $q->where('vendorcity', $request->city);
                })
                ->get();
              
                if (!$vendors->isEmpty()) {
                    $client = new Client();
                    $url = "https://maps.googleapis.com/maps/api/distancematrix/json";
                    $origins = "$strUserLat,$strUserLong";
                    $destinations = $vendors->map(fn($vendor) => "{$vendor->latitude},{$vendor->longitude}")->implode('|');
                    
                    $response = $client->get($url, [
                        'query' => [
                            'origins' => $origins,
                            'destinations' => $destinations,
                            'key' => "AIzaSyDPzFD2CfOOMLxSl04wsqGcXqX0t1mQFrI",
                            'departure_time' => 'now',
                        ]
                    ]);
                   
    
                    $distanceMatrix = json_decode($response->getBody()->getContents(), true);
                     
                    if ($distanceMatrix['status'] === 'OK') {
                        $elements = $distanceMatrix['rows'][0]['elements'];
    
                        foreach ($vendors as $index => $vendor) {
                            if (isset($elements[$index]['distance']['value'])) {
                                $vendorDistanceMap[$vendor->vendor_id] = $elements[$index]['distance']['value']; // meters
                                $vendorTextMap[$vendor->vendor_id] = $elements[$index]['distance']['text'];
                            }
                        }
                    }
                }
            }
    
            // Get all deals
            $deals = $query->get();
            
            // $deals = $query->tosql();
            //dd($deals->toArray());
    
    
            if ($deals->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => 'No deals found',
                ], 404);
            }
    
            // Transform deals with discount and distance info
            $deals->transform(function ($deal) use ($vendorDistanceMap, $vendorTextMap) {
                if ($deal->options) {
                    $deal->options = $deal->options->map(function ($option) {
                        if (!empty($option->regular_price) && !empty($option->pricecut_price) && $option->regular_price > 0) {
                            $discount = (($option->regular_price - $option->pricecut_price) / $option->regular_price) * 100;
                            $option->discount_percentage = round($discount);
                        } else {
                            $option->discount_percentage = 0.00;
                        }
                        return $option;
                    });
                }
    
                $deal->average_rating = round($deal->average_rating, 1);
                $deal->total_reviews = $deal->total_reviews;
    
                $deal->distance = $vendorDistanceMap[$deal->vendor_id] ?? null;
                $deal->distance_text = $vendorTextMap[$deal->vendor_id] ?? null;
    
                return $deal;
            });
    
            // Sort by distance ASC
            $deals = $deals->sortBy('distance')->values();
    
            // Popular deals (optional city filter)
            $popularDeals = Deals::with(['options', 'images', 'vendor', 'reviews'])
                ->withCount('reviews as total_reviews')
                ->withAvg('reviews as average_rating', 'review')
                ->where('Is_publish', 1)
                ->when($request->filled('city'), function ($q) use ($request) {
                    $q->whereHas('vendor', fn($q) => $q->where('vendorcity', $request->city));
                })
                ->latest()
                ->take(5)
                ->get();
    
            return response()->json([
                'success' => true,
                'data' => $deals,
                'popular_deals' => $popularDeals,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    
    public function FrontPromocodelist(Request $request)
    {
        try {
            // Fetch the promocodes along with their associated vendor data
            $promocode = promocode::with(['vendor'])->get();

            // Loop through the promocodes and append the full URL for vendor images
            $promocode->each(function ($promo) {
                if ($promo->vendor && $promo->vendor->vendorimg) {
                    // Assuming your images are stored in the 'storage' directory and you are using public disk
                    $promo->vendor->vendorimg = url('/upload/vendor/' . $promo->vendor->vendorimg);
                }
                if ($promo->pro_img) {
                    // Assuming your images are stored in the 'storage' directory and you are using public disk
                    $promo->pro_img = url('/upload/promocode/' . $promo->pro_img);
                }
            });

            if ($promocode->isEmpty()) {
                return response()->json([
                    'success' => false,
                    'message' => 'Promocode not found',
                ], 404);
            }

            return response()->json([
                'success' => true,
                'data' => $promocode,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }


    public function DisplayHomePageDeal(Request $request)
    {
        try {

            $Dealsdisplayhomepage = Deals::with(['category', 'images'])
                ->whereHas('category', function ($query) {
                    $query->where('display_homepage', 1);
                })
                ->get();

            if ($Dealsdisplayhomepage) {
                return response()->json([
                    'success' => true,
                    'data' => $Dealsdisplayhomepage,
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Deals not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function Topmenu(Request $request)
    {
        try {
            // Fetch categories along with their subcategories
            $categories = Categories::with('subcategories')->orderby('isequence','asc')->get();

            $responseData = [];
            foreach ($categories as $category) {
                // Build the subcategories array
                $subcategories = [];
                foreach ($category->subcategories as $subcategory) {
                    $subcategories[] = [
                        'Subcategory_id' => $subcategory->iSubCategoryId,
                        'Subcategory_name' => $subcategory->strSubCategoryName,
                        'Subcategory_icon' => $subcategory->subCategory_icon
                            ? url('upload/subcategory-icons/' . $subcategory->subCategory_icon)
                            : null,
                    ];
                }

                // Add category and subcategories to the response array
                $responseData[] = [
                    'Categories_id' => $category->Categories_id,
                    'Category_name' => $category->Category_name,
                    'Categories_icon' => $category->Categories_icon,
                    'Subcategories' => $subcategories,
                ];
            }

            return response()->json([
                'success' => true,
                'data' => $responseData,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }


    public function DealDetail(Request $request)
    {
        try {
            $request->validate([
                'GUID' => 'required',
            ]);

            // Fetch the main deal details
            $dealdetail = Deals::with(['options', 'images'])
                ->where('GUID', $request->GUID)
                ->first();

            if ($dealdetail) {
                // Fetch related deals based on category and brand (you can adjust this based on your schema)
                $relatedDeals = Deals::with('options', 'images', 'vendor')
                    ->where('deal_category_id', $dealdetail->deal_category_id)
                    ->where('Deals_id', '!=', $dealdetail->Deals_id)  // Exclude the current deal
                    ->limit(5)  // Limit to 5 related deals
                    ->get()
                    ->map(function ($deal) {
                        // Add vendor name to each related deal
                        $deal->vendoraddress = $deal->vendor->vendoraddress ?? 'No Vendor Name'; // Extract vendorname
                        unset($deal->vendor); // Remove the full vendor object
                        return $deal;
                    });

                return response()->json([
                    'success' => true,
                    'data' => $dealdetail,
                    'related_deals' => $relatedDeals,  // Include related deals in the response
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

    public function Cmschange(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required',
            ]);

            $cmsmaster = CMSMaster::where('id', $request->id)->first();

            if ($cmsmaster) {

                return response()->json([
                    'success' => true,
                    'data' => $cmsmaster,
                    'message' => 'Content fetch successfully',
                ], 200);
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Content not found',
                ], 404);
            }
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }

    public function PromocodeDetail(Request $request)
    {
        try {
            // Validate GUID
            $request->validate([
                'GUID' => 'required|exists:promocodes,GUID',
            ]);

            // Find promocode by GUID
            $promocode = promocode::where('GUID', $request->GUID)->first();

            if (!$promocode) {
                return response()->json([
                    'success' => false,
                    'message' => 'Promocode not found',
                ], 404);
            }

            // Format start_date and end_date using Carbon (if necessary)
            $promocode->start_date = Carbon::parse($promocode->start_date)->format('d-m-Y');
            $promocode->end_date = Carbon::parse($promocode->end_date)->format('d-m-Y');
            $promocode->pro_img = 'https://getdemo.in/pricecut/upload/promocode/' . $promocode->pro_img;

            // Return response with promocode data
            return response()->json([
                'success' => true,
                'data' => $promocode->toArray(), // Convert the model to an array
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success' => false,
                'error' => $th->getMessage(),
            ], 500);
        }
    }
}
