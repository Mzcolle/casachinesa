@props([
    'active' => false,
    'activeIcon' => null,
    'badge' => null,
    'badgeColor' => null,
    'grouped' => false,
    'last' => false,
    'first' => false,
    'icon' => null,
    'shouldOpenUrlInNewTab' => false,
    'isWireNavigate' => false,
    'url',
])

<li
    @class([
        'fi-sidebar-item',
        'fi-active fi-sidebar-item-active' => $active,
    ])
>
    <a
        href="{{ $url }}"
        @if ($shouldOpenUrlInNewTab)
            target="_blank"
        @elseif ($isWireNavigate)
            wire:navigate
        @endif
        x-on:click="window.matchMedia(`(max-width: 1024px)`).matches && $store.sidebar.close()"
        @if (filament()->isSidebarCollapsibleOnDesktop())
            x-data="{ tooltip: false }"
            x-effect="
                tooltip = $store.sidebar.isOpen
                    ? false
                    : {
                          content: @js($slot->toHtml()),
                          placement: document.dir === 'rtl' ? 'left' : 'right',
                          theme: $store.theme,
                      }
            "
            x-tooltip.html="tooltip"
        @endif
        @class([
            'fi-sidebar-item-button relative flex items-center justify-center gap-x-3 rounded-lg px-2 py-2 text-sm outline-none transition duration-75',
            'hover:bg-[rgb(var(--primary-50))] focus:bg-[rgb(var(--primary-50))] dark:hover:bg-[rgb(var(--primary-900))] dark:focus:bg-[rgb(var(--primary-900))]' => !$active,
            'bg-[rgb(var(--primary-50))] dark:bg-[rgb(var(--primary-900))]' => $active,
        ])
    >
        @if (filled($icon))
            <x-filament::icon
                :icon="($active && $activeIcon) ? $activeIcon : $icon"
                @class([
                    'fi-sidebar-item-icon h-6 w-6',
                    'text-gray-400 dark:text-gray-500' => ! $active,
                    'text-[rgb(var(--primary-600))] dark:text-[rgb(var(--primary-500))]' => $active,
                ])
            />
        @elseif ($grouped)
            <div
                class="fi-sidebar-item-grouped-border relative flex h-6 w-6 items-center justify-center"
            >
                @if (! $first)
                    <div
                        class="absolute -top-1/2 bottom-1/2 w-px bg-gray-300 dark:bg-gray-600"
                    ></div>
                @endif

                @if (! $last)
                    <div
                        class="absolute -bottom-1/2 top-1/2 w-px bg-gray-300 dark:bg-gray-600"
                    ></div>
                @endif

                <div
                    @class([
                        'relative h-1.5 w-1.5 rounded-full',
                        'bg-gray-400 dark:bg-gray-500' => ! $active,
                        'bg-[rgb(var(--primary-600))] dark:bg-[rgb(var(--primary-500))]' => $active,
                    ])
                ></div>
            </div>
        @endif

        <span
            @if (filament()->isSidebarCollapsibleOnDesktop())
                x-show="true"
                x-transition:enter="lg:transition lg:delay-100"
                x-transition:enter-start="opacity-0"
                x-transition:enter-end="opacity-100"
            @endif
            @class([
                'fi-sidebar-item-label flex-1 truncate',
                'text-gray-700 dark:text-gray-200' => ! $active,
                'text-[rgb(var(--primary-600))] dark:text-[rgb(var(--primary-500))]' => $active,
                'font-semibold' => ! $grouped,
                'font-medium' => $grouped,
            ])
        >
            {{ $slot }}
        </span>

        @if (filled($badge))
            <span
                @if (filament()->isSidebarCollapsibleOnDesktop())
                    x-show="true"
                    x-transition:enter="lg:transition lg:delay-100"
                    x-transition:enter-start="opacity-0"
                    x-transition:enter-end="opacity-100"
                @endif
            >
                <x-filament::badge :color="$badgeColor">
                    {{ $badge }}
                </x-filament::badge>
            </span>
        @endif
    </a>
</li>