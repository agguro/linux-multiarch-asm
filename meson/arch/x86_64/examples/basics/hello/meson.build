executable('hello',
    'hello.S',
    include_directories : arch_inc,
    link_args : [
        # --- Essential Flags ---
        '-nostdlib',                       # Do not link standard C library
        '-no-pie',                         # Disable Position Independent Executable (static)

        # --- Diet Flags (Size Optimization) ---
        '-fno-asynchronous-unwind-tables', # Remove .eh_frame section (unwind info)
        '-Wl,--build-id=none',             # Remove the unique Build-ID hash (saves ~100+ bytes)
        '-Wl,--strip-all',                 # Strip all symbols and debug information
        '-Wl,--gc-sections'                # Garbage collect unused sections
    ],
    install : false
)
