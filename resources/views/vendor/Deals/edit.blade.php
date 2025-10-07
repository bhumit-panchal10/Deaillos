@extends('layouts.app')

@section('title', 'Edit Area')
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
                    <a href="{{ route('deal.index', $Deals->vendorid) }}" class="text-slate-400 dark:text-zink-200">Area
                        List</a>
                </li>
                <li class="text-slate-700 dark:text-zink-100">
                    Edit Area
                </li>
            </ul>
        </div>


        <div class="grid grid-cols-1 gap-x-5 xl:grid-cols-12">
            <div class="xl:col-span-12">
                <div class="card" id="customerList">
                    @include('vendor.Deals.orderTab', ['dealid' => $dealid])


                    <div class="">
                        <div class="grid grid-cols-1 gap-5 mb-5 ">
                            <div class="rtl:md:text-start">
                                <div class="bg-white shadow rounded-md dark:bg-zink-600">
                                    <div
                                        class="flex items-center justify-between p-4 border-b border-slate-200 dark:border-zink-500">
                                        <h5 class="text-16" id="exampleModalLabel">Edit Deal</h5>
                                        <a href="{{ route('deal.index', $Deals->vendorid) }}">
                                            <button type="button"
                                                class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20"
                                                data-modal-target="AddModal">
                                                <i class="ri-arrow-left-line"></i> Back
                                            </button>
                                        </a>
                                    </div>
                                    <div class="max-h-[calc(theme('height.screen')_-_180px)] overflow-y-auto p-4">
                                        <form onsubmit="return EditvalidateFile()" class="tablelist-form"
                                            action="{{ route('deal.update', ['id' => $Deals->Deals_id]) }}"
                                            method="POST" enctype="multipart/form-data">
                                            @csrf

                                            <div class="grid grid-cols-3 gap-4">


                                                <div class="mb-3">
                                                    <label for="email-field" class="">Title</label>
                                                    <input type="text" id="email-field" name="title"
                                                        maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Title Name" autocomplete="off" autofocus
                                                        value="{{ $Deals->main_title }}">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field" class="">Description </label>
                                                    <textarea id="Description" name="Description"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        style="height: 70px !important;" placeholder="Enter Description">{{ strip_tags($Deals->deal_description) }}
                                                    </textarea>
                                                </div>



                                                <div class="mb-3">
                                                    <label for="email-field"
                                                        class="inline-block mb-2 text-base font-medium">Category
                                                        Name</label>
                                                    <select id="Categoryid" name="Categoryid"
                                                        onchange="getsubcategory();"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
                                                        <option value="" disabled selected>Select a Category
                                                        </option>
                                                        @foreach ($categories as $category)
                                                        <option value="{{ $category->Categories_id }}"
                                                            @if ($category->Categories_id == $Deals->deal_category_id) selected @endif>
                                                            {{ $category->Category_name }}
                                                        </option>
                                                        @endforeach
                                                    </select>


                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field"
                                                        class="inline-block mb-2 text-base font-medium">Sub Category
                                                    </label>
                                                    <select id="AreasubCategoryid" name="AreasubCategoryid"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
                                                        <option value="" disabled selected>Select a SubCategory
                                                        </option>
                                                        @foreach ($subcategories as $subcategory)
                                                        <option value="{{ $subcategory->iSubCategoryId }}"
                                                            @if ($subcategory->iSubCategoryId == $Deals->deal_sub_category_id) selected @endif>
                                                            {{ $subcategory->strSubCategoryName }}
                                                        </option>
                                                        @endforeach
                                                    </select>


                                                </div>



                                                <div class=" mb-3">
                                                    <label for="email-field" class="">State</label>
                                                    <select name="areastateId" id="areastateId" onchange="getcity();"
                                                        class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
                                                        <option selected="" value="">Select State</option>
                                                        @foreach ($states as $state)
                                                        <option value="{{ $state->stateId }}"
                                                            @if ($state->stateId == $Deals->deal_state_id) selected @endif
                                                            {{ old('areastateId') == $state->stateId ? 'selected' : '' }}>
                                                            {{ $state->stateName }}
                                                        </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field" class="">City</label>
                                                    <select name="areacityId" id="areacityId"
                                                        class="form-select border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200">
                                                        <option selected="" value="">Select City</option>
                                                        @foreach ($cities as $city)
                                                        <option value="{{ $city->cityId }}"
                                                            @if ($city->cityId == $Deals->deal_city_id) selected @endif
                                                            {{ old('areacityId') == $city->cityId ? 'selected' : '' }}>
                                                            {{ $city->cityName }}
                                                        </option>
                                                        @endforeach
                                                    </select>
                                                </div>



                                                <div class="mb-3">
                                                    <label for="email-field" class="">Display Start Date</label>
                                                    <input type="date" id="display_start_date"
                                                        name="display_start_date" maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Best Deals Name" autocomplete="off" autofocus
                                                        value="{{ $Deals->display_start_date ?? old('display_start_date') }}">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field" class="">Display End Date</label>
                                                    <input type="date" id="display_end_date"
                                                        name="display_end_date" maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Best Deals Name" autocomplete="off"
                                                        autofocus
                                                        value="{{ $Deals->display_end_date ?? old('display_end_date') }}">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field" class="">Marketing Start
                                                        Date</label>
                                                    <input type="date" id="offer_start_date"
                                                        name="offer_start_date" maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Best Deals Name" autocomplete="off"
                                                        autofocus
                                                        value="{{ $Deals->offer_start_date ?? old('offer_start_date') }}">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field" class="">Marketing End Date</label>
                                                    <input type="date" id="offer_end_date" name="offer_end_date"
                                                        maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Best Deals Name" autocomplete="off"
                                                        autofocus
                                                        value="{{ $Deals->offer_end_date ?? old('offer_end_date') }}">
                                                </div>

                                                <div class="mb-3">
                                                    <label for="email-field" class="">Address</label>
                                                    <input type="text" id="email-field" name="deals_location"
                                                        maxlength="150"
                                                        class="form-input border-slate-200 dark:border-zink-500 focus:outline-none focus:border-custom-500 disabled:bg-slate-100 dark:disabled:bg-zink-600 disabled:border-slate-300 dark:disabled:border-zink-500 dark:disabled:text-zink-200 disabled:text-slate-500 dark:text-zink-100 dark:bg-zink-700 dark:focus:border-custom-800 placeholder:text-slate-400 dark:placeholder:text-zink-200"
                                                        placeholder="Enter Address" autocomplete="off" autofocus
                                                        value="{{ $Deals->deals_location }}">
                                                </div>

                                                <?php

                                                $ProductImages = \App\Models\DealImage::select('deal_image_id', 'image_url')
                                                    ->where(['Deal_images.iStatus' => 1, 'Deal_images.isDelete' => 0, 'deals_id' => $Deals->Deals_id])
                                                    ->get();
                                                // dd($ProductImages);
                                                $count = $ProductImages->count();
                                                $arr = [];
                                                foreach ($ProductImages as $value) {
                                                    $arr[] = $value->image_url;
                                                }
                                                ?>

                                                <div class="mb-3">
                                                    <div>
                                                        Upload Images
                                                        @if ($count == 0)
                                                        <input type="file" name="photo[]" multiple
                                                            class="form-control" id="Editphoto"
                                                            onKeyPress="if(this.value.length==0) return false;">
                                                        <label id="photo-error" class="error"
                                                            for="photo"></label>
                                                        @else
                                                        <input type="file" name="photo[]" multiple
                                                            class="form-control" id="Editphoto">
                                                        @endif

                                                    </div>
                                                </div>

                                                <div class="col-lg-4 col-md-6">
                                                    <div>
                                                        <div class="d-flex justify-content-between mt-3 mb-3">
                                                            @foreach ($ProductImages as $ProductImage)
                                                            <?php if (in_array($ProductImage->image_url, $arr)) { ?>
                                                                <div id="PHOTOID_<?= $ProductImage->deal_image_id ?>">
                                                                    <img src="/pricecut/upload/deal-images/thumbnail/{{ $ProductImage->image_url }}"
                                                                        width="50px" height="50px">

                                                                    <button type="button"
                                                                        onclick="imagedelete(<?= $ProductImage->deal_image_id ?>);"
                                                                        class="btn btn-link p-0">
                                                                        <span class="text-500 fas fa-trash-alt"></span>
                                                                    </button>

                                                                </div> &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <?php } ?>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="ltr:md:text-end  mt-10">
                                                <button type="submit"
                                                    class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">Submit</button>

                                                <a href="{{ route('deal.index', $Deals->vendorid) }}"
                                                    class="text-white transition-all duration-200 ease-linear btn bg-custom-500 border-custom-500 hover:text-white hover:bg-custom-600 hover:border-custom-600 focus:text-white focus:bg-custom-600 focus:border-custom-600 focus:ring focus:ring-custom-100 active:text-white active:bg-custom-600 active:border-custom-600 active:ring active:ring-custom-100 dark:ring-custom-400/20">
                                                    Cancel
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


<script>
    $(document).ready(function() {
        $('#Editphoto').change(function() {
            var files = $('#Editphoto')[0].files;
            var numFiles = files.length;
            //alert(numFiles);
            if (numFiles > 0) {
                $("#photo-error").hide();
            }
            //$('#fileLengthInfo').text("Number of files selected: " + numFiles);
        });
    });

    function getcity() {
        var state = $("#areastateId").val();
        var url = "{{ route('area.state_city_mapping', ':state') }}";
        url = url.replace(":state", state);
        $.ajax({
            url: url,
            type: 'GET',
            data: {
                state: state,
            },
            success: function(data) {
                $("#areacityId").html('');
                $("#areacityId").append(data);
            }
        });
    }


    function getsubcategory() {
        var categoryid = $("#Categoryid").val();
        //var url = "{{ route('deal.category_subcategory_mapping', ':categoryid') }}";
       // url = url.replace(":categoryid", categoryid);
       var url = "{{ route('deal.category_subcategory_mapping') }}";

        $.ajax({
            url: url,
            type: 'GET',
            data: {
                categoryid: categoryid,
            },
            success: function(data) {
                $("#AreasubCategoryid").html('');
                $("#AreasubCategoryid").append(data);
            }
        });
    }
</script>

<script>
    document.getElementById('discount_type').addEventListener('change', calculateDiscount);
    document.getElementById('discount_value').addEventListener('input', calculateDiscount);
    document.getElementById('original_price').addEventListener('input', calculateDiscount);

    function calculateDiscount() {
        var originalPrice = parseFloat(document.getElementById('original_price').value);
        var discountType = document.getElementById('discount_type').value;
        var discountValue = parseFloat(document.getElementById('discount_value').value) || 0;
        var finalPrice = originalPrice;

        if (discountType === 'percentage') {
            finalPrice = originalPrice - (originalPrice * discountValue / 100);
        } else if (discountType === 'flat') {
            finalPrice = originalPrice - discountValue;
        }

        document.getElementById('final_price').value = finalPrice.toFixed(2);
    }
</script>

<script>
    function imagedelete(id) {

        var url = "{{ route('deal.imagedelete', ':id') }}";
        url = url.replace(":id", id);

        if (id) {
            $.ajax({
                url: url,
                type: 'POST',
                data: {
                    id: id,
                    "_token": "{{ csrf_token() }}",
                },
                success: function(data) {

                    console.log(data);
                    var obj = JSON.parse(data);
                    console.log(obj);
                    if (data == 0) {
                        $('#Editphoto').prop('required', true);
                        window.location.href = "";

                    } else {
                        $("#PHOTOID_" + id).remove(); // Remove the entire element

                    }

                }
            });
        }
    }
</script>


<script>
    const startDateInput = document.getElementById('display_start_date');
    const endDateInput = document.getElementById('display_end_date');

    startDateInput.addEventListener('change', () => {
        // Set the minimum date of the end date input to the selected start date
        endDateInput.min = startDateInput.value;

        // Clear the end date value if it is earlier than the new start date
        if (endDateInput.value < startDateInput.value) {
            endDateInput.value = '';
        }
    });

    endDateInput.addEventListener('change', () => {
        // Ensure the end date is not earlier than the start date
        if (endDateInput.value < startDateInput.value) {
            alert('End date cannot be earlier than the start date.');
            endDateInput.value = '';
        }
    });
</script>

<script>
    const offerstartDateInput = document.getElementById('offer_start_date');
    const offerendDateInput = document.getElementById('offer_end_date');

    offerstartDateInput.addEventListener('change', () => {
        // Set the minimum date of the end date input to the selected start date
        offerendDateInput.min = offerstartDateInput.value;

        // Clear the end date value if it is earlier than the new start date
        if (offerendDateInput.value < offerstartDateInput.value) {
            offerendDateInput.value = '';
        }
    });

    offerendDateInput.addEventListener('change', () => {
        // Ensure the end date is not earlier than the start date
        if (offerendDateInput.value < offerstartDateInput.value) {
            alert('End date cannot be earlier than the start date.');
            offerendDateInput.value = '';
        }
    });
</script>

<script>
    function EditvalidateFile() {
        //alert('hello');
        var allowedExtension = ['jpeg', 'jpg', 'png', 'webp'];
        var fileExtension = document.getElementById('Editphoto').value.split('.').pop().toLowerCase();
        var isValidFile = false;
        var image = document.getElementById('Editphoto').value;
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

@endsection