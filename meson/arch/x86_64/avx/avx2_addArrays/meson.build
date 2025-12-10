cpp = meson.get_compiler('cpp')

cpp_args = [
  '-g',
  '-pipe',
  '-O2',
  '-std=gnu++1z',
  '-Wall',
  '-Wextra',
  '-fPIC',
]

linker_flags = [
    '-no-pie',
    '-Wl,--strip-all',
    '-Wl,--gc-sections',
    '-Wl,--build-id=none',
    '-fno-asynchronous-unwind-tables',
]

# ---------------------------
# Declare source files
# ---------------------------
asm_obj  = files('avx2_addArrays.S')
main_obj = files('main.cpp')

# ---------------------------
# Build executable
# ---------------------------
executable(
  'avx2_addArrays',
  [main_obj, asm_obj],
  cpp_args : cpp_args,
  link_args : linker_flags,
  install : false
)

