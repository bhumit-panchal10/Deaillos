<ul class="flex flex-wrap w-full text-sm font-medium text-center nav-tabs space-x-2">
    @if ($dealid)
        <li class="group grow @if (request()->routeIs('deal.edit')) active @endif">
            <a href="{{ route('deal.edit', ['id' => $dealid]) }}"
                class="relative inline-block px-4 w-full py-2 text-base transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent group-[.active]:bg-custom-500 group-[.active]:text-white hover:text-custom-500 active:text-custom-500">
                Edit Deal
            </a>
        </li>
    @else
        <li class="group grow @if (request()->routeIs('deal.add')) active @endif">
            <a href="{{ route('deal.add', ['id' => $id]) }}"
                class="relative inline-block px-4 w-full py-2 text-base transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent group-[.active]:bg-custom-500 group-[.active]:text-white hover:text-custom-500 active:text-custom-500">
                Add Deal
            </a>
        </li>
    @endif


    <li
        class="group grow @if (request()->routeIs('option.index')) active @endif  @if (!$dealid) pointer-events-none opacity-50 @endif">

        <a href="{{ route('option.index', ['id' => $id]) }}"
            class="relative inline-block px-4 w-full py-2 text-base transition-all duration-300 ease-linear rounded-md text-slate-500 border border-transparent group-[.active]:bg-custom-500 group-[.active]:text-white hover:text-custom-500 active:text-custom-500">
            Option
        </a>

    </li>
</ul>
