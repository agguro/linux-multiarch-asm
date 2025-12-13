# arch/x86_64/examples/basics/mixed/meson.build

mixed_exe = executable(
  'mixed_demo',
  [
    'main.cpp',    # C++
    'wrapper.S',   # Preprocessed ASM
    'raw.s'        # Pure ASM
  ],
  include_directories: arch_inc,
  link_args: ['-no-pie'], 
  install: false
)

test('mixed_demo', mixed_exe)
