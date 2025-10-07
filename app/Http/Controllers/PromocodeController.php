<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SubCategories;
use App\Models\Categories;
use App\Models\Image;
use App\Models\StateMaster;
use App\Models\CityMaster;
use App\Models\promocode;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Arr;


class PromocodeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {

        try {

            $offers = promocode::where('vendorid', $id)
                ->orderBy('promo_id', 'desc')
                ->paginate(config('app.per_page'));

            // $offers = promocode::orderBy('promo_id', 'desc')->paginate(env('PER_PAGE'));



            return view('vendor.Promocode.index', compact('offers', 'id'));
        } catch (\Throwable $th) {

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }
    public function promocodelist()
    {

        try {

            $offers = Promocode::with('vendor')->paginate(config('app.per_page'));
            // dd($offers);
            return view('vendor.Promocode.promocodelist', compact('offers'));
        } catch (\Throwable $th) {

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }
    public function add($id)
    {

        $categories = Categories::orderBy('Category_name', 'asc')
            ->select('Categories_id', 'Category_name')
            ->get();
        $subcategories = SubCategories::orderBy('strSubCategoryName', 'asc')
            ->select('iSubCategoryId', 'strSubCategoryName')
            ->get();
        $states = StateMaster::orderBy('stateName', 'asc')->get();
        $cities = CityMaster::orderBy('cityName', 'asc')->get();
        return view('vendor.Promocode.add', compact('id', 'cities', 'states', 'categories', 'subcategories'));
    }



    public function store(Request $request)

    {



        DB::beginTransaction();



        try {

            $request->validate([

                'code' => 'required|unique:promocodes,code',

                'dis_per' => 'required',

                'startdate' => 'required|date',

                'enddate' => 'required|date|after:startdate',

                'link' => 'required',

            ]);



            // Create a new StateMaster record

            $data = array(

                'code' => $request->code,

                'link' => $request->link,

                'vendorid' => $request->vendorid,

                'dis_per' => $request->dis_per ?? 0,

                'state_id' => $request->areastateId,

                'city_id' => $request->areacityId,

                'category_id' => $request->Categoryid,

                'subcat_id' => $request->subCategoryid,

                'start_date' => date('Y-m-d', strtotime($request->startdate)),

                'end_date' => date('Y-m-d', strtotime($request->enddate)),

                'created_at' => now(),

                'strIP' => $request->ip(),

            );
            promocode::create($data);
            DB::commit();


            Toastr::success('Offer created successfully :)', 'Success');

            return redirect()->route('promocode.index', $request->vendorid);
        } catch (ValidationException $e) {

            DB::rollBack();

            $errors = $e->errors(); // Get the errors array

            $errorMessages = []; // Initialize an array to hold error messages



            // Loop through the errors array and flatten the error messages

            foreach ($errors as $field => $messages) {

                foreach ($messages as $message) {

                    $errorMessages[] = $message;
                }
            }



            // Join all error messages into a single string

            $errorMessageString = implode(', ', $errorMessages);



            Toastr::error($errorMessageString, 'Error');

            return redirect()->back()->withInput();
        } catch (\Throwable $th) {

            DB::rollBack();

            Toastr::error('Failed to create offer: ' . $th->getMessage(), 'Error');

            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }



    public function edit(Request $request, $promoid)

    {

        $categories = Categories::orderBy('Category_name', 'asc')
            ->select('Categories_id', 'Category_name')
            ->get();

        $subcategories = SubCategories::orderBy('strSubCategoryName', 'asc')
            ->select('iSubCategoryId', 'strSubCategoryName')
            ->get();
        $states = StateMaster::orderBy('stateName', 'asc')->get();
        $cities = CityMaster::orderBy('cityName', 'asc')->get();
        $data = promocode::where('promo_id', $request->id)->first();

        $vendorid = $data->vendorid;

        return view('vendor.Promocode.edit', compact('data', 'categories', 'subcategories', 'vendorid', 'states', 'cities', 'promoid'));
    }



    public function update(Request $request)

    {

        DB::beginTransaction();



        try {

            $request->validate([

                'code' => 'required|unique:promocodes,code,' . $request->promoid . ',promo_id',

                'dis_per' => 'required',

                'startdate' => 'required|date',

                'enddate' => 'required|date|after:start_date',

                'link' => 'required',

            ]);



            $data = [

                'code' => $request->code,

                'state_id' => $request->areastateId,

                'city_id' => $request->areacityId,

                'category_id' => $request->Categoryid,

                'subcat_id' => $request->subCategoryid,

                'dis_per' => $request->dis_per ?? 0,

                'link' => $request->link ?? 0,

                'start_date' => date('Y-m-d', strtotime($request->startdate)),

                'end_date' => date('Y-m-d', strtotime($request->enddate)),

                'updated_at' => now(),

                'strIP' => $request->ip(),

            ];



            promocode::where("promo_id", "=", $request->promoid)->update($data);



            DB::commit();



            Toastr::success('Offer updated successfully :)', 'Success');

            return redirect()->route('promocode.index', $request->vendorid);
        } catch (ValidationException $e) {

            DB::rollBack();

            $errors = $e->errors(); // Get the errors array

            $errorMessages = []; // Initialize an array to hold error messages



            // Loop through the errors array and flatten the error messages

            foreach ($errors as $field => $messages) {

                foreach ($messages as $message) {

                    $errorMessages[] = $message;
                }
            }



            // Join all error messages into a single string

            $errorMessageString = implode(', ', $errorMessages);



            Toastr::error($errorMessageString, 'Error');

            return redirect()->back()->withInput();
        } catch (\Throwable $th) {

            DB::rollBack();

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }



    public function delete(Request $request)

    {

        DB::beginTransaction();



        try {

            promocode::where([

                'iStatus' => 1,

                'isDelete' => 0,

                'promo_id' => $request->id

            ])->delete();



            DB::commit();



            Toastr::success('Offer deleted successfully :)', 'Success');

            return response()->json(['success' => true]);

            //return back();

        } catch (ValidationException $e) {

            DB::rollBack();

            Toastr::error(implode(', ', $e->errors()));

            return redirect()->back()->withInput();
        } catch (\Throwable $th) {

            DB::rollBack();

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }



    public function deleteselected(Request $request)

    {

        // dd($request->all());

        try {

            $ids = $request->input('offer_ids', []);

            promocode::whereIn('promo_id', $ids)->delete();



            Toastr::success('Offer deleted successfully :)', 'Success');

            return back();
        } catch (ValidationException $e) {

            DB::rollBack();

            Toastr::error(implode(', ', $e->errors()));

            return redirect()->back()->withInput();
        } catch (\Throwable $th) {

            DB::rollBack();

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }



    public function updateStatus(Request $request)

    {

        try {

            // dd($request);

            if ($request->status == 1) {

                promocode::where(['promo_id' => $request->offerId])->update(['iStatus' => 0]);

                Toastr::success('Offer inactive successfully :)', 'Success');
            } else {

                promocode::where(['promo_id' => $request->offerId])->update(['iStatus' => 1]);

                Toastr::success('Offer active successfully :)', 'Success');
            }

            echo 1;
        } catch (ValidationException $e) {

            DB::rollBack();

            Toastr::error(implode(', ', $e->errors()));

            return 0;
        } catch (\Throwable $th) {

            DB::rollBack();

            Toastr::error('Error: ' . $th->getMessage());

            return 0;
        }
    }
}
