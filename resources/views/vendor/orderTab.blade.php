<ul class="flex flex-wrap w-full text-sm font-medium text-center nav-tabs">
    <li class="group grow @if (request()->routeIs('deal.index') || request()->routeIs('deal.add')) {{ 'active' }} @endif">
        <a href="{{ route('deal.index', $id) }}"
            class="relative inline-block px-4 w-full py-2 text-base transition-all duration-300 ease-linear rounded-md text-slate-500 dark:text-zink-200 border border-transparent group-[.active]:bg-custom-500 group-[.active]:text-white hover:text-custom-500 active:text-custom-500 dark:group-[.active]:text-white dark:hover:text-custom-500 dark:active:text-custom-500 -mb-[1px] before:absolute before:-bottom-1.5 before:-rotate-[135deg] before:left-2/4 before:-translate-x-2/4 before:bg-transparent group-[.active]:before:bg-custom-500 before:h-3 before:w-3">Deals
        </a>
    </li>
    <li class="group grow @if (request()->routeIs('promocode.index') ||
            request()->routeIs('promocode.add') ||
            request()->routeIs('promocode.edit')) {{ 'active' }} @endif">
        <a href="{{ route('promocode.index', $id) }}"
            class="relative inline-block px-4 w-full py-2 text-base transition-all duration-300 ease-linear rounded-md text-slate-500 dark:text-zink-200 border border-transparent group-[.active]:bg-custom-500 group-[.active]:text-white hover:text-custom-500 active:text-custom-500 dark:group-[.active]:text-white dark:hover:text-custom-500 dark:active:text-custom-500 -mb-[1px] before:absolute before:-bottom-1.5 before:-rotate-[135deg] before:left-2/4 before:-translate-x-2/4 before:bg-transparent group-[.active]:before:bg-custom-500 before:h-3 before:w-3">Promocode</a>
    </li>

</ul>
