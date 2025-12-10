# arch/x86/examples/basics/hello/meson.build

hello_exe = executable(
  'hello',
  ['hello.S'],
  include_directories: arch_inc,
  link_args: [
    '-nostdlib',
    '-Wl,--build-id=none',
    '-Wl,--gc-sections',
    '-Wl,--strip-all',
    '-no-pie',
  ],
  install: false
)

if build_machine.cpu_family() != 'aarch64'
    emulator = find_program('qemu-aarch64', required: true)
    test('hello', emulator, args: [hello_exe], verbose: true)
else
    test('hello', hello_exe, verbose: true)
endif
