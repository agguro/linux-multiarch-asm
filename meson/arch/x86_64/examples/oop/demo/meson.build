# arch/x86_64/examples/oop/demo/meson.build

oop_demo_exe = executable('oop_demo',
  sources : 'main.S',
  # Hier combineren we beide include paden!
  # 1. generic_inc -> zodat hij "oop.h" vindt in de root
  # 2. arch_inc    -> zodat hij "oop/aggregator.h" vindt in x86_64
  include_directories : [generic_inc, arch_inc],
  install : false
)

if build_machine.cpu_family() != 'x86_64'
    emulator = find_program('qemu-x86_64', required: true)
    test('hello', emulator, args: [oop_demo_exe], verbose: true)
else
    test('hello', oop_demo_exe, verbose: true)
endif
