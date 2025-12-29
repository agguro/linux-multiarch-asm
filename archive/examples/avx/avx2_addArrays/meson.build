# archive/examples/avx/avx2_addArrays/meson.build
#
# AVX example:
# - main.cpp (C++)
# - avx2_addArrays.asm (NASM helper)
# - linked via C++ compiler driver
# - AVX flags inherited from parent directory

asm_file = 'avx2_addArrays.asm'
cpp_file = 'main.cpp'
name     = 'avx2_addArrays'

lst_build_dir = join_paths(meson.current_build_dir(), 'lst')

lst_dir = custom_target(
  name + '_lst_dir',
  output: 'lst',
  command: ['mkdir', '-p', lst_build_dir],
)

# -------------------------------
# Assemble NASM (debug)
# -------------------------------

asm_obj_debug = custom_target(
  name + '_asm_debug',
  input: asm_file,
  output: name + '.debug.o',
  depends: lst_dir,
  command: [nasm] + nasm_common_flags + [
    '-g',
    '-Fdwarf',
    '-l', join_paths(lst_build_dir, name + '.debug.lst'),
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
)

# -------------------------------
# Assemble NASM (release)
# -------------------------------

asm_obj_release = custom_target(
  name + '_asm_release',
  input: asm_file,
  output: name + '.o',
  depends: lst_dir,
  command: [nasm] + nasm_common_flags + [
    '-l', join_paths(lst_build_dir, name + '.lst'),
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
)

# -------------------------------
# Executable (debug)
# -------------------------------

exe_debug = executable(
  name + '.debug',
  cpp_file,
  asm_obj_debug,
  cpp_args: avx2_cpp_args,
  install: false,
)

# -------------------------------
# Executable (release)
# -------------------------------

exe_release = executable(
  name,
  cpp_file,
  asm_obj_release,
  cpp_args: avx2_cpp_args,
  install: false,
)

