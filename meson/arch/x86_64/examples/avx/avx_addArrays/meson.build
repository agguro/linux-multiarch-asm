# arch/x86_64/examples/avx/avx_addArrays/meson.build

cpp_args = [
  '-g', '-O2', '-std=c++17', '-Wall', '-Wextra',
  '-no-pie', '-fno-asynchronous-unwind-tables'
]

exe_avx = executable(
  'avx_addArrays',
  ['main.cpp', 'avx_addArrays.S'],
  cpp_args : cpp_args,
  link_args : ['-no-pie'], # Geen -nostdlib want we gebruiken C++ iostream
  install : false
)

# Native test (geen emulator nodig)
test('avx_addArrays', exe_avx, verbose: true)
