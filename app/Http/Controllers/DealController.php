<?php



namespace App\Http\Controllers;



use Illuminate\Http\Request;

use App\Models\CityMaster;

use App\Models\StateMaster;

use App\Models\AreaMaster;

use App\Models\Deals;
use App\Models\DealImage;


use App\Models\Categories;
use App\Models\SubCategories;


use Brian2694\Toastr\Facades\Toastr;

use Illuminate\Support\Facades\DB;

use Illuminate\Validation\ValidationException;
use Spatie\Image\Image;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Models\BaseURL;

class DealController extends Controller

{

    public function index(Request $request, $id)

    {

        try {
            $deals = Deals::where('vendorid', $id)
                ->orderBy('Deals_id', 'asc')
                ->paginate(config('app.per_page'));
            // $deals = Deals::orderBy('deal_brand_name', 'asc')->paginate(env('PER_PAGE'));
            return view('vendor.Deals.index', compact('deals', 'id'));
        } catch (\Throwable $th) {

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }

    public function deallist(Request $request)

    {

        try {

            $deals = Deals::with('vendorname')->paginate(config('app.per_page')); // Default to 10 if PER_PAGE is not set

            return view('vendor.Deals.deallist', compact('deals'));
        } catch (\Throwable $th) {

            Toastr::error('Error: ' . $th->getMessage());

            return redirect()->back()->withInput();
        }
    }



    public function category_subcategory_mapping(Request $request)

    {


        $categoryid = $request->categoryid;



        if ($categoryid) {

            $subcategory =  SubCategories::orderBy('strSubCategoryName', 'asc')->where(['iCategoryId' => $categoryid])->get();


            if ($subcategory) {

                $html = "";

                $html .= "<option value=''>Select Subcategory</option>";

                foreach ($subcategory as $subcat) {

                    $html .= "<option value='" . $subcat->iSubCategoryId . "'>" . $subcat->strSubCategoryName . "</option>";
                }



                return $html;
            }
        }
    }

    public function state_city_mapping(Request $request)

    {

        $stateId = $request->state;



        if ($stateId) {

            $cities =  CityMaster::orderBy('cityName', 'asc')->where(['stateMasterStateId' => $stateId])->get();

            // dd($cities);

            if ($cities) {

                //     $html = "";

                //     $html .= "<option value='0'>No data found !</option>";

                //     return $html;

                // } else {

                $html = "";

                $html .= "<option value=''>Select City</option>";

                foreach ($cities as $city) {

                    $html .= "<option value='" . $city->cityId . "'>" . $city->cityName . "</option>";
                }



                return $html;
            }
        }
    }

    public function add($id, $dealid = null)
    {


        try {
            $categories = Categories::orderBy('Category_name', 'asc')
                ->select('Categories_id', 'Category_name')
                ->get();
            $subcategories = SubCategories::orderBy('strSubCategoryName', 'asc')
                ->select('iSubCategoryId', 'strSubCategoryName')
                ->get();
            $states = StateMaster::orderBy('stateName', 'asc')->get();
            $cities = CityMaster::orderBy('cityName', 'asc')->get();

            return view('vendor.Deals.add', compact('states', 'id', 'cities', 'categories', 'subcategories', 'dealid'));
        } catch (\Throwable $th) {
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }


    public function store(Request $request)
    {


        $user = (Auth::user());
        try {
            // Validate the incoming request


            $lowercase = Str::lower($request->title);

            $slugname = str_replace(' ', '-', $lowercase);
            $url = BaseURL::first();
            $guid = Str::uuid();
            $baseURL = $url->URL . $guid;
            // Create the deal
            $Data = Deals::create([

                'main_title'             => Str::title($request->title),
                'deal_description'       => $request->Description,
                'deal_category_id'        => $request->Categoryid,
                'deal_sub_category_id' => $request->AreasubCategoryid,
                'user_id'    => $user->id,
                'deal_address'    => $request->deals_location,
                'deal_state_id'    => $request->areastateId,
                'deal_city_id'    => $request->areacityId,
                'display_start_date'    => $request->display_start_date,
                'display_end_date'    => $request->display_end_date,
                'offer_start_date'    => $request->offer_start_date,
                'offer_end_date'    => $request->offer_end_date,
                'GUID'              => $guid,
                'strIP' => $request->ip(),
                'vendorid'       => $request->vendorid,
                'created_at'        => now()

            ]);

            session(['deal_id' => $Data->Deals_id]);
            foreach ($request->file('deal_images') as $file) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('deal_images');

                $imgName = time() . '_' . mt_rand(1000, 9999) . '.' . $file->getClientOriginalExtension();

                $destinationPath = $root . '/pricecut/upload/deal-images/thumbnail';

                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }
                $img = Image::load($file->getRealPath());

                $img->resize(540, 720, [
                    'aspectRatio' => true,
                    'upsize' => false, // Prevents upsizing the image
                ])->save($destinationPath . '/' . $imgName);



                $destinationpath = $root . '/pricecut/upload/deal-images/';
                $file->move($destinationpath, $imgName);


                $data = array(
                    'deals_id' => $Data->Deals_id,
                    'image_url' => $imgName,
                    'user_id' => $user->id,
                    'strIP' => $request->ip(),
                    'created_at' => date('Y-m-d H:i:s'),
                );
                // dd($data);
                DB::table('Deal_images')->insert($data);
            }



            Toastr::success('Deal Add successfully!', 'Success');
            return redirect()->route('option.index', ['id' => $request->vendorid]);
        } catch (\Throwable $th) {

            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }




    public function edit(Request $request, $id)

    {


        try {

            $categories = Categories::orderBy('Category_name', 'asc')
                ->select('Categories_id', 'Category_name')
                ->get();

            $subcategories = SubCategories::orderBy('strSubCategoryName', 'asc')
                ->select('iSubCategoryId', 'strSubCategoryName')
                ->get();
            $states = StateMaster::orderBy('stateName', 'asc')->get();
            $cities = CityMaster::orderBy('cityName', 'asc')->get();

            $Deals = Deals::where('Deals_id', $id)->first();
            $dealid = $id;
            session(['deal_id' => $dealid]);


            $data = AreaMaster::where(['iStatus' => 1, 'isDelete' => 0, 'areaId' => $id])->first();

            return view('vendor.Deals.edit', compact('Deals', 'dealid', 'id', 'states', 'cities', 'data', 'categories', 'subcategories'));
        } catch (\Throwable $th) {

            // Rollback and return with Error

            DB::rollBack();

            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }



    public function update(Request $request, $id)
    {
        DB::beginTransaction();

        try {
            $user = Auth::user();

            // Validate inputs
            $request->validate([

                'deal_images.*'     => 'nullable|mimes:jpg,jpeg,png|max:2048',
            ]);

            // Generate slug for the deal
            $url = BaseURL::first();
            $guid = Str::uuid();
            $baseURL = $url->URL . $guid;

            $lowercase = Str::lower($request->title);
            $slugname = str_replace(' ', '-', $lowercase);

            // Fetch the deal
            $Data = Deals::where(['Deals_id' => $id])->first();
            if (!$Data) {
                throw new \Exception('Deal not found.');
            }

            // Update deal details
            Deals::where(['Deals_id' => $id])->update([
                'main_title'              => Str::title($request->title),
                'deal_description'        => $request->Description,
                'deal_category_id'        => $request->Categoryid,
                'deal_sub_category_id'    => $request->AreasubCategoryid,
                'user_id'                 => $user->id,
                'deal_address'          => $request->deals_location,
                'deal_state_id'           => $request->areastateId,
                'deal_city_id'            => $request->areacityId,
                'display_start_date'      => $request->display_start_date,
                'display_end_date'        => $request->display_end_date,
                'offer_start_date'        => $request->offer_start_date,
                'offer_end_date'          => $request->offer_end_date,
                'deals_slug'              => $slugname,
                'GUID'              => $guid,
                'strIP'                   => $request->ip(),
                'updated_at'              => now()
            ]);

            // Handle image upload if new images are provided
            if ($request->hasFile('photo')) {
                foreach ($request->file('photo') as $file) {
                    $root = $_SERVER['DOCUMENT_ROOT'];

                    $imgName = time() . '_' . mt_rand(1000, 9999) . '.' . $file->getClientOriginalExtension();
                    $thumbnailPath = $root . '/upload/deal-images/thumbnail';

                    if (!file_exists($thumbnailPath)) {
                        mkdir($thumbnailPath, 0755, true);
                    }

                    // Resize and save thumbnail
                    $img = Image::load($file->getRealPath());
                    $img->resize(540, 720, [
                        'aspectRatio' => true,
                        'upsize' => false, // Prevents upsizing the image
                    ])->save($thumbnailPath . '/' . $imgName);

                    // Save the original image
                    $originalPath = $root . '/upload/deal-images/';
                    $file->move($originalPath, $imgName);

                    // Save image data to database
                    DB::table('Deal_images')->insert([
                        'deals_id'    => $Data->Deals_id,
                        'image_url'   => $imgName,
                        'user_id' => $user->id,
                        'strIP'       => $request->ip(),
                        'updated_at'  => now(),
                    ]);
                }
            }

            // Commit transaction
            DB::commit();

            Toastr::success('Deal updated successfully!', 'Success');
            return redirect()->route('deal.index', $Data->vendorid);
        } catch (\Throwable $th) {
            // Rollback on error
            DB::rollBack();
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withErrors(['error' => $th->getMessage()])->withInput();
        }
    }


    public function dealimage(Request $request, $id)
    {

        try {
            $delete = DB::table('Deal_images')->where(['isDelete' => 0, 'deal_image_id' => $id])->first();


            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationpath = $root . '/deal-images/';
            $destinationpath1 = $root . '/deal-images/thumbnail/';

            if (file_exists($destinationpath1 . $delete->image_url)) {
                unlink($destinationpath1 . $delete->image_url);
            }
            if (file_exists($destinationpath . $delete->image_url)) {
                unlink($destinationpath . $delete->image_url);
            }

            DB::table('Deal_images')->where(['isDelete' => 0, 'deal_image_id' => $id])->delete();

            $count = DB::table('Deal_images')->where(['isDelete' => 0, 'deals_id' => $delete->deals_id])->count();

            echo $count;
        } catch (\Throwable $th) {
            // Rollback and return with Error
            DB::rollBack();
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }



    public function delete(Request $request)

    {

        DB::beginTransaction();



        try {

            Deals::where(['iStatus' => 1, 'isDelete' => 0, 'Deals_id' => $request->id])->delete();



            DB::commit();



            Toastr::success('Deal deleted successfully :)', 'Success');

            //return back();

            return response()->json(['success' => true]);
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



        try {

            $ids = $request->input('deal_ids', []);

            Deals::whereIn('Deals_id', $ids)->delete();



            Toastr::success('Deals deleted successfully :)', 'Success');

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
}
