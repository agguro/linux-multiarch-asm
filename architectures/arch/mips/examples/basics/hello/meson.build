# arch/mips/examples/basics/hello/meson.build

hello_exe = executable(
  'hello',
  ['hello.S'],
  c_args: ['-g','-fno-pic','-mno-abicalls'],
  link_args: ['-nostdlib', '-static', '-Wl,--build-id=none', '-no-pie'],
  install: false
)

# 2. Test logica
if build_machine.cpu_family() != 'mips'
    emulator = find_program('qemu-mips-static', required: true)
    test('hello/', emulator, args: [hello_exe], verbose: true)
else
    test('hello', hello_exe, verbose: true)
endif
