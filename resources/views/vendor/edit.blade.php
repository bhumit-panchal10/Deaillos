@extends('layouts.app')

@section('title', 'Edit Vendor')

@section('content')
{!! Toastr::message() !!}

<!-- Page-content -->
<div
    class="group-data-[sidebar-size=lg]:ltr:md:ml-vertical-menu group-data-[sidebar-size=lg]:rtl:md:mr-vertical-menu group-data-[sidebar-size=md]:ltr:ml-vertical-menu-md group-data-[sidebar-size=md]:rtl:mr-vertical-menu-md group-data-[sidebar-size=sm]:ltr:ml-vertical-menu-sm group-data-[sidebar-size=sm]:rtl:mr-vertical-menu-sm pt-[calc(theme('spacing.header')_*_1)] pb-[calc(theme('spacing.header')_*_0.8)] px-4 group-data-[navbar=bordered]:pt-[calc(theme('spacing.header')_*_1.3)] group-data-[navbar=hidden]:pt-0 group-data-[layout=horizontal]:mx-auto group-data-[layout=horizontal]:max-w-screen-2xl group-data-[layout=horizontal]:px-0 group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:ltr:md:ml-auto group-data-[layout=horizontal]:group-data-[sidebar-size=lg]:rtl:md:mr-auto group-data-[layout=horizontal]:md:pt-[calc(theme('spacing.header')_*_1.6)] group-data-[layout=horizontal]:px-3 group-data-[layout=horizontal]:group-data-[navbar=hidden]:pt-[calc(theme('spacing.header')_*_0.9)]">
    <div class="container-fluid group-data-[content=boxed]:max-w-boxed mx-auto">

        <div class="flex flex-col gap-2 py-4 md:flex-row md:items-center print:hidden">
            <div class="grow">
                {{-- <h5 class="text-16">State List</h5>  --}}
            </div>
            <ul class="flex items-center gap-2 text-sm font-normal shrink-0">
                <li
                    class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                    <a href="#!" class="text-slate-400 dark:text-zink-200">Master Entry</a>
                </li>
                <li
                    class="relative before:content-['\ea54'] before:font-remix ltr:before:-right-1 rtl:before:-left-1  before:absolute before:text-[18px] before:-top-[3px] ltr:pr-4 rtl:pl-4 before:text-slate-400 dark:text-zink-200">
                    <a href="{{ route('vendor.index') }}" class="text-slate-400 dark:text-zink-200">Vendor
                        List</a>
                </li>
                <li class="text-slate-700 dark:text-zink-100">
                    Vendor Testimonial
                </li>
            </ul>
        </div>


        <div class="grid grid-cols-1 gap-x-5 xl:grid-cols-12">
            <div class="xl:col-span-12">
                <div class="card" id="customerList">
                    <div class="">
                        <div class="grid grid-cols-1 gap-5 mb-5 ">

                            <div class="rtl:md:text-start">
                                <div class="bg-white shadow rounded-md dark:bg-zink-600">
                                    <div
                                        class="flex items-center justify-between p-4 border-b border-slate-200 dark:border-zink-500">
                                        <h5 class="text-16" id="exampleModalLabel">Edit Vendor</h5>
                                        <a href="{{ route('vendor.index') }}">
                                            <button type="button"
                                                class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20"
                                                data-modal-target="AddModal">
                                                <i class="ri-arrow-left-line"></i> Back
                                            </button>
                                        </a>
                                    </div>
                                    <div class="max-h-[calc(theme('height.screen')_-_180px)] overflow-y-auto p-4">
                                        <form onsubmit="return validateFile()" class="tablelist-form"
                                            action="{{ route('vendor.update', $vendor->vendor_id) }}" method="POST"
                                            enctype="multipart/form-data">
                                            @csrf

                                            <div class="grid grid-cols-3 gap-4">
                                                <div class="xl:">
                                                    Name <span style="color:red;">*</span>
                                                    <input type="text" id="email-field" name="editvendorname"
                                                        maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Name" value="{{ $vendor->vendorname }}"
                                                        autocomplete="off" required autofocus>
                                                </div>

                                                <div class="mb-3">
                                                    Mobile <span style="color:red;">*</span>
                                                    <input type="number" id="email-field" name="editvendormobile"
                                                        maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Mobile" value="{{ $vendor->vendormobile }}"
                                                        autocomplete="off" required>
                                                </div>

                                                <div class=" mb-3">
                                                    Email <span style="color:red;">*</span>
                                                    <input type="text" id="email-field" name="editvendoremail"
                                                        maxlength="250"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Email" value="{{ $vendor->email }}"
                                                        autocomplete="off" required>
                                                </div>

                                                <div class="mb-3 ">
                                                    Photo
                                                    <input type="file" id="vendorimg" name="editvendorimg"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        autocomplete="off">

                                                    <div id="viewimg">
                                                        @if($vendor->vendorimg)
                                                        <img src="{{ asset('upload/vendor/') . '/' . $vendor->vendorimg }}"
                                                            height="70" width="70" alt="">
                                                        <!--<img src="https://vybecabs.com/upload/images/{{ $vendor->vendorimg }}"-->
                                                        <!--    height="70" width="70" alt="">-->
                                                        @else
                                                        <img class="img-fluid"
                                                            src="{{ asset('assets/images/noimage.png') }}"
                                                            alt="" height="50" width="50">
                                                        @endif
                                                    </div>


                                                </div>
                                                <input type="hidden" name="hiddenPhoto" class="form-control"
                                                    value="{{ old('vendorimg') ? old('vendorimg') : $vendor->vendorimg }}"
                                                    id="hiddenPhoto">

                                                <div class=" mb-3">
                                                    Address <span style="color:red;">*</span>
                                                    <input type="text" id="email-field" name="editvendoraddress"
                                                        maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Address" value="{{ $vendor->vendoraddress }}"
                                                        autocomplete="off" autofocus required>
                                                </div>

                                                {{-- <div class=" mb-3">
                                                        Password
                                                        <input type="text" id="email-field" name="editvendorpassword"
                                                            class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                            placeholder="Enter vendorpassword"
                                                            value="{{ $vendor->vendorpassword }}" autocomplete="off"
                                                autofocus>
                                            </div> --}}

                                            <div class=" mb-3">
                                                Facebook Link <span style="color:red;">*</span>
                                                <input type="text" id="email-field" name="editfacbooklink"
                                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                    placeholder="Enter Facebook Link"
                                                    value="{{ $vendor->facbooklink }}" autocomplete="off"
                                                    autofocus required>
                                            </div>

                                            <div class=" mb-3">
                                                Instragram Link <span style="color:red;">*</span>
                                                <input type="text" id="email-field" name="editinstragramlink"
                                                    class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                    placeholder="Enter Instragram Link"
                                                    value="{{ $vendor->instragramlink }}" autocomplete="off"
                                                    autofocus required>
                                            </div>


                                    </div>



                                    <div class="ltr:md:text-end  mt-10">
                                        <button type="submit"
                                            class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">Submit</button>
                                        <a href="{{ route('vendor.index') }}">
                                            <button type="button"
                                                class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">
                                                Cancel
                                            </button>
                                        </a>
                                    </div>

                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </div>
    <!-- End Page-content -->

</div>
</div>

<script src="{{ asset('assets/libs/%40ckeditor/ckeditor5-build-classic/build/ckeditor.js') }}"></script>
<script src="{{ asset('assets/js/pages/form-editor-classic.init.js') }}"></script>


<script>
    function EditvalidateFile() {
        //alert('hello');
        var allowedExtension = ['jpeg', 'jpg', 'png', 'webp'];
        var fileExtension = document.getElementById('editvendorimg').value.split('.').pop().toLowerCase();
        var isValidFile = false;
        var image = document.getElementById('editvendorimg').value;
        for (var index in allowedExtension) {
            if (fileExtension === allowedExtension[index]) {
                isValidFile = true;
                break;
            }
        }
        if (image != "") {
            if (!isValidFile) {
                alert('Allowed Extensions are : *.' + allowedExtension.join(', *.'));
            }
            return isValidFile;
        }
        return true;
    }
</script>

{{-- Edit photo --}}
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                $('#hello').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#editvendorimg").change(function() {
        html =
            '<img src="' + readURL(this) +
            '"   id="hello" width="70px" height = "70px" > ';
        $('#viewimg').html(html);
    });
</script>
@endsection