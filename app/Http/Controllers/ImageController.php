<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\SubCategories;
use App\Models\Categories;
use App\Models\Image;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;
use Illuminate\Support\Arr;


class ImageController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {

            $image = Image::select('*')
                ->orderBy('id', 'asc')
                ->paginate(config('app.per_page'));

            return view('Image.index', compact('image'));
        } catch (\Throwable $th) {
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function add()
    {
        try {
            $subcategories = SubCategories::orderBy('strSubCategoryName', 'asc')
                ->select('iSubCategoryId', 'strSubCategoryName');
            $categories = Categories::orderBy('Category_name', 'asc')
                ->select('Categories_id', 'Category_name')
                ->where(['iStatus' => 1])
                ->get();

            return view('Image.add', compact('categories', 'subcategories'));
        } catch (\Throwable $th) {
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }



    public function store(Request $request)
    {
        DB::beginTransaction();


        try {
            // Validate input data
            $request->validate([
                'Categoryid' => 'required',
                'AreasubCategoryid' => 'required',
                'Image' => 'required',

            ]);

            // Get the category name by Categoryid
            $category = Categories::where('Categories_id', $request->Categoryid)->first();

            $subcategory = SubCategories::where('iSubCategoryId', $request->AreasubCategoryid)->first();
            // Check if category exists
            if (!$category) {
                Toastr::error('Category not found', 'Error');
                return redirect()->back()->withInput();
            }

            $categoriesname = $category->Category_name;  // Retrieve Category_name
            $subcategoryname = $subcategory->strSubCategoryName;  // Retrieve Category_name


            // Handle image upload
            $img = "";
            if ($request->hasFile('Image')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('Image');

                list($width, $height) = getimagesize($image);

                if ($width !== 250 || $height !== 250) {
                    Toastr::error('Image must be exactly 250x250 pixels.', 'Error');
                    return redirect()->back()->withInput();
                }

                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/pricecut/upload/Image/';
                // Create the directory if it doesn't exist
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }

                // Move the image to the destination
                $image->move($destinationpath, $img);
            }


            // Create a new SubCategory record
            Image::create([
                'subcat_id' => $request->AreasubCategoryid,
                'cat_name' => $categoriesname,
                'category_id' => $request->Categoryid,
                'subcat_name' => $subcategoryname,
                'Image' => $img,
                'created_at' => now(),
                'strIP' => $request->ip(),
            ]);

            // Commit the transaction
            DB::commit();

            Toastr::success('Image created successfully!', 'Success');
            return redirect()->route('image.index')->with('success', 'Image Created Successfully.');
        } catch (ValidationException $e) {
            DB::rollBack();
            $errors = $e->errors();  // Get the validation errors
            $errorMessages = [];
            foreach ($errors as $field => $messages) {
                foreach ($messages as $message) {
                    $errorMessages[] = $message;
                }
            }

            $errorMessageString = implode(', ', $errorMessages);
            Toastr::error($errorMessageString, 'Error');
            return redirect()->back()->withInput();
        } catch (\Throwable $th) {
            DB::rollBack();
            Toastr::error('Failed to create SubCategory: ' . $th->getMessage(), 'Error');
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }


    public function edit(Request $request, $id)
    {

        try {

            $image = Image::where('id', $id)->first();
            $subcategories = SubCategories::orderBy('strSubCategoryName', 'asc')
                ->select('iSubCategoryId', 'strSubCategoryName')->get();

            $categories = Categories::orderBy('Category_name', 'asc')
                ->select('Categories_id', 'Category_name')
                ->where(['iStatus' => 1])
                ->get();

            return view('Image.edit', compact('image', 'categories', 'subcategories'));
        } catch (\Throwable $th) {

            DB::rollBack();

            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function update(Request $request)
    {
        // dd($request);
        // dd($request);
        DB::beginTransaction();

        $category = Categories::where('Categories_id', $request->Categoryid)->first();

        $subcategory = SubCategories::where('iSubCategoryId', $request->AreasubCategoryid)->first();

        $categoriesname = $category->Category_name;  // Retrieve Category_name
        $subcategoryname = $subcategory->strSubCategoryName;


        try {
            $request->validate([
                'Categoryid' => 'required',
                'AreasubCategoryid' => 'required',
                'editmain_img' => 'required',

            ]);




            $img = "";

            if ($request->hasFile('editmain_img')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('editmain_img');
                list($width, $height) = getimagesize($image);

                if ($width !== 250 || $height !== 250) {
                    Toastr::error('Image must be exactly 250x250 pixels.', 'Error');
                    return redirect()->back()->withInput();
                }

                // Generate a unique file name
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/pricecut/upload/Image/';
                // Create directory if it doesn't exist
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }

                // Move the image to the destination path
                $image->move($destinationpath, $img);

                // Delete the old image if it exists
                $oldImg = $request->input('hiddenPhoto');
                if ($oldImg && file_exists($destinationpath . '/' . $oldImg)) {
                    unlink($destinationpath . '/' . $oldImg);
                }
            } else {
                // If no image is uploaded, keep the old image name
                $img = $request->input('hiddenPhoto');
            }
            $data = [

                'subcat_id' => $request->AreasubCategoryid,
                'cat_name' => $categoriesname,
                'category_id' => $request->Categoryid,
                'subcat_name' => $subcategoryname,
                'Image' => $img,
                'updated_at' => now(),
                'strIP' => $request->ip(),
            ];

            Image::where("id", "=", $request->imageid)->update($data);



            DB::commit();

            Toastr::success('Image updated successfully :)', 'Success');
            return redirect()->route('image.index')->with('success', 'Image Update Successfully.');
        } catch (ValidationException $e) {
            DB::rollBack();
            $errorMessageString = implode(', ', Arr::flatten($e->errors()));
            Toastr::error($errorMessageString, 'Error');
            return redirect()->back()->withInput();
        } catch (\Throwable $th) {
            DB::rollBack();
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function category_subcategory_mapping(Request $request)

    {


        $categoryid = $request->categoryid;
        // dd($request);


        if ($categoryid) {

            $subcategory =  SubCategories::orderBy('strSubCategoryName', 'asc')->where(['iCategoryId' => $categoryid])->get();

            // dd($cities);

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




    public function delete(Request $request)
    {

        DB::beginTransaction();

        try {
            $Image = Image::where([

                'isDelete' => 0,
                'id' => $request->id
            ])->delete();

            DB::commit();

            Toastr::success('Image deleted successfully :)', 'Success');
            return response()->json(['success' => true]);
            //return back();
        } catch (ValidationException $e) {
            DB::rollBack();
            Toastr::error('Validation Error: ' . implode(', ', $e->errors()));
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
            $ids = $request->input('image_ids', []);
            Image::whereIn('id', $ids)->delete();

            Toastr::success('Image deleted successfully :)', 'Success');
            return back();
        } catch (ValidationException $e) {
            DB::rollBack();
            Toastr::error('Validation Error: ' . implode(', ', $e->errors()));
            return redirect()->back()->withInput();
        } catch (\Throwable $th) {
            DB::rollBack();
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function updateStatus(Request $request)
    {
        // dd($request);
        try {
            if ($request->status == 1) {
                SubCategories::where(['iSubCategoryId' => $request->iSubCategoryId])->update(['iStatus' => 0]);
                Toastr::success('Subcategory inactive successfully :)', 'Success');
            } else {
                SubCategories::where(['iSubCategoryId' => $request->iSubCategoryId])->update(['iStatus' => 1]);
                Toastr::success('Subcategory active successfully :)', 'Success');
            }
            echo 1;
        } catch (ValidationException $e) {
            DB::rollBack();
            Toastr::error('Validation Error: ' . implode(', ', $e->errors()));
            return 0;
        } catch (\Throwable $th) {
            DB::rollBack();
            Toastr::error('Error: ' . $th->getMessage());
            return 0;
        }
    }
}
