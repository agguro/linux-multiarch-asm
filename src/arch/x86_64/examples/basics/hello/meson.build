# arch/x86_64/examples/basics/hello/meson.build

hello_exe = executable(
  'hello',
  ['hello.S'],
  include_directories : [ arch_inc],
  link_args: ['-nostdlib'],
  install: false
)

if build_machine.cpu_family() != 'x86_64'
    emulator = find_program('qemu-x86_64', required: true)
    test('hello', emulator, args: [hello_exe], verbose: true)
else
    test('hello', hello_exe, verbose: true)
endif
