# project root meson.buil

project('linux-asm', ['c', 'cpp'], version: '0.1')
message('>>> Building linux-asm in ' + get_option('buildtype') + ' mode')

cpp = meson.get_compiler('cpp')

# Detect the target architecture (from host PC or cross-file)
target_arch = host_machine.cpu_family()

message('>>> Configuring build for architecture: ' + target_arch)

if target_arch == 'mips'
    subdir('arch/mips')
elif target_arch == 'riscv64'
    subdir('arch/riscv64')
elif target_arch == 'aarch64'
    subdir('arch/aarch64')
elif target_arch == 'x86_64'
    subdir('arch/x86_64')
endif
