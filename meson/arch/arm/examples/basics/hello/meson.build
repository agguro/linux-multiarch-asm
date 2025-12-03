dep = dependency('arch_x86')

nasm = dep.get_variable('nasm')
ld   = dep.get_variable('ld')
incdir = dep.get_variable('incdir')

if get_option('buildtype') == 'debug'
  nasm_flags = dep.get_variable('nasm_dbg_flags').split()
  ld_flags = dep.get_variable('ld_dbg_flags').split()
else
  nasm_flags = dep.get_variable('nasm_rel_flags').split()
  ld_flags = dep.get_variable('ld_rel_flags').split()
endif

hello_obj = custom_target(
  'hello_obj',
  input: 'hello.asm',
  output: 'hello.o',
  command: [nasm] + nasm_flags + ['-I', incdir, '-o', '@OUTPUT@', '@INPUT@'],
  build_by_default: true,

)

hello_bin = custom_target(
  'hello',
  input: hello_obj,
  output: 'hello',
  command: [ld] + ld_flags + ['-o', '@OUTPUT@', '@INPUT@'],
  build_by_default: true,
  install: false,
)

