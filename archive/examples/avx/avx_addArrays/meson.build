# archive/examples/avx/avx_addArrays/meson.build

name     = 'avx_addArrays'

asm_file = 'avx_addArrays.asm'
cpp_file = 'main.cpp'

nasm_obj = custom_target(
  name + '_asm',
  input: asm_file,
  output: name + '.o',
  command: [nasm,
    '-felf64',
    '-g',
    '-Fdwarf',
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

exe = executable(
  name,
  cpp_file,
  nasm_obj,
  cpp_args: avx_cpp_args,     # ← inherited
  link_args: avx_link_args,   # ← inherited
  install: false,
)

test(name, exe, verbose: true)

