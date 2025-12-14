# arch/x86_64/examples/avx/avx2_addArrays/meson.build

cpp_args = [
  '-g', '-O2', '-std=c++17', '-Wall', '-Wextra',
  '-no-pie', '-fno-asynchronous-unwind-tables',
  '-mavx2' # Optioneel: vertelt GCC dat hij AVX2 mag gebruiken in C++ code
]

exe_avx2 = executable(
  'avx2_addArrays',
  ['main.S', 'avx2_addArrays.S'],
  cpp_args : cpp_args,
  link_args : [],
  install : false
)

test('avx2_addArrays', exe_avx2, verbose: true)
