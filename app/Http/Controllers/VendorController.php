<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Vendor;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Str;


class VendorController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        try {
            $vendors = Vendor::orderBy('vendor_id', 'asc')
                ->where(['isDelete' => 0])
                ->paginate(config('app.per_page'));
            return view('vendor.index', compact('vendors'));
        } catch (\Throwable $th) {
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function add()
    {
        try {
            return view('vendor.add');
        } catch (\Throwable $th) {
            Toastr::error('Error: ' . $th->getMessage());
            return redirect()->back()->withInput();
        }
    }

    public function store(Request $request)
    {
        DB::beginTransaction();

        try {
            $request->validate([
                'vendorname' => 'required',
                'vendormobile' => ['required', 'digits:10'],
                'vendoremail' => 'required',
                'vendorimg' => 'required',
                'vendoraddress' => 'required',
                'vendorpassword' => 'required',
                'facbooklink' => 'required',
                'instragramlink' => 'required',
            ], [
                'vendormobile.digits' => 'The mobile number must contain exactly 10 digits.',
            ]);

            $img = "";
            if ($request->hasFile('vendorimg')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('vendorimg');
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/pricecut/upload/vendor/';
                // $destinationpath = $root . '/upload/images/';
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }
                $image->move($destinationpath, $img);
            }

            Vendor::create([
                'vendorname' => $request->vendorname,
                'vendormobile' => $request->vendormobile,
                'email' => $request->vendoremail,
                'vendorimg' => $img,
                'vendoraddress' => Str::title($request->vendoraddress),
                //'password' => $request->vendorpassword,
                'facbooklink' => $request->facbooklink,
                'instragramlink' => $request->instragramlink,
                'created_at' => now(),
                'strIP' => $request->ip(),
            ]);

            DB::commit();

            Toastr::success('Vendor created successfully :)', 'Success');
            return redirect()->route('vendor.index');
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
            Toastr::error('Failed to create Vendor: ' . $th->getMessage(), 'Error');
            return redirect()->back()->withInput()->with('error', $th->getMessage());
        }
    }

    public function edit(Request $request)
    {
        // dd($request);
        $vendor = Vendor::where('vendor_id', $request->vendor_id)->first();


        return view('vendor.edit', compact('vendor'));
    }

    public function update(Request $request, $vendor_id)
    {
        // dd($request);
        $request->validate([
            'editvendorname' => 'required',
            'editvendormobile' => ['required', 'digits:10'],
            'editvendoremail' => 'required',
            'editvendoraddress' => 'required',
            'editfacbooklink' => 'required',
            'editinstragramlink' => 'required',
        ], [
            'editvendormobile.digits' => 'The mobile number must contain exactly 10 digits.',
        ]);
        DB::beginTransaction();

        try {

            $img = "";
            if ($request->hasFile('editvendorimg')) {
                $root = $_SERVER['DOCUMENT_ROOT'];
                $image = $request->file('editvendorimg');
                $img = time() . '_' . date('dmYHis') . '.' . $image->getClientOriginalExtension();
                $destinationpath = $root . '/pricecut/upload/vendor/';
                // $destinationpath = $root . '/upload/images/';
                if (!file_exists($destinationpath)) {
                    mkdir($destinationpath, 0755, true);
                }
                $image->move($destinationpath, $img);
                $oldImg = $request->input('hiddenPhoto') ? $request->input('hiddenPhoto') : null;

                if ($oldImg != null || $oldImg != "") {
                    if (file_exists($destinationpath . $oldImg)) {
                        unlink($destinationpath . $oldImg);
                    }
                }
            } else {
                $oldImg = $request->input('hiddenPhoto');
                $img = $oldImg;
            }

            $data = [
                'vendorname' => $request->editvendorname,
                'vendormobile' => $request->editvendormobile,
                'email' => $request->editvendoremail,
                'vendorimg' => $img,
                'vendoraddress' => Str::title($request->editvendoraddress),
                //'password' => $request->editvendorpassword,
                'facbooklink' => $request->editfacbooklink,
                'instragramlink' => $request->editinstragramlink,
                'updated_at' => now(),
                'strIP' => $request->ip(),
            ];

            Vendor::where("vendor_id", "=", $vendor_id)->update($data);

            DB::commit();

            Toastr::success('Vendor updated successfully :)', 'Success');
            return redirect()->route('vendor.index');
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

        // dd($request);
        DB::beginTransaction();

        try {
            $vendor = Vendor::where(['vendor_id' => $request->id])->first();
            // dd($vendor);

            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationPath = $root . '/upload/vendor/';
            // $destinationpath = $root . '/upload/images/';

            // Check if the testimonial has an image and delete it if exists
            if ($vendor->vendorimg && file_exists($destinationPath . $vendor->vendorimg)) {
                unlink($destinationPath . $vendor->vendorimg);
            }

            Vendor::where([
                'iStatus' => 1,
                'isDelete' => 0,
                'vendor_id' => $request->id
            ])->delete();

            DB::commit();

            Toastr::success('Vendor deleted successfully :)', 'Success');
            // return back();
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
        // dd($request->all());
        try {
            $ids = $request->input('vendor_ids', []);
            $vendors = Vendor::whereIn('vendor_id', $ids)->get();
            //Testimonial::whereIn('id', $ids)->delete();
            $root = $_SERVER['DOCUMENT_ROOT'];
            $destinationPath = $root . '/upload/vendor/';
            // $destinationpath = $root . '/upload/images/';
            foreach ($vendors as $vendor) {
                // Check if the testimonial has an image and delete it if exists
                if ($vendor->vendorimg && file_exists($destinationPath . $vendor->vendorimg)) {
                    unlink($destinationPath . $vendor->vendorimg);
                }
                Vendor::whereIn('vendor_id', $ids)->delete();
            }

            Toastr::success('vendor deleted successfully :)', 'Success');
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
        // dd($request);
        try {
            if ($request->status == 1) {
                Vendor::where(['vendor_id' => $request->vendorId])->update(['iStatus' => 0]);
                Toastr::success('Vendor inactive successfully :)', 'Success');
            } else {
                Vendor::where(['vendor_id' => $request->vendorId])->update(['iStatus' => 1]);
                Toastr::success('Vendor active successfully :)', 'Success');
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
