# arch/x86_64/examples/avx/avx512_addArrays/meson.build

# 1. Compiler Flags
# We do NOT use -nostdlib here because <iostream> is required.
cpp_args = [
  '-g',                 # Debug info (required for SDE/GDB)
  '-O2',
  '-std=c++17',         # C++17 standard
  '-Wall',
  '-Wextra',
  '-fno-asynchronous-unwind-tables' # Keeps the assembly output cleaner
]

linker_flags = [
  '-no-pie',            # Disable Position Independent Executable (easier debugging)
  # '-static'           # <--- NOTE: Only enable if 'glibc-static' is installed.
                        # Dynamic linking (default) is safer for C++ for now.
]

# 2. Source Files
# Here we combine the C++ driver with the Assembly routine
sources = [
  'main.cpp',
  'avx512_addArrays.S'
]

# 3. Build Executable
# We store the result object in 'exe_avx512'
exe_avx512 = executable(
  'avx512_addArrays',
  sources,
  cpp_args : cpp_args,
  link_args : linker_flags,
  install : false
)

# 4. Test Configuration (With Intel SDE)
# We look for the SDE tool specifically for this project.
# Since AVX-512 hardware is rare, SDE allows us to emulate it.
sde = find_program('sde64', '/opt/sde/sde64', required: false)

if sde.found()
    # Instruct SDE to run the executable using Skylake-X (-skx) emulation.
    # The double dash '--' is crucial: arguments following it are passed to your program.
    test('avx512_addArrays', 
         sde, 
         args: ['-skx', '--', exe_avx512],
         verbose: true
    )
else
    message('Intel SDE not found. Skipping AVX-512 test.')
endif
