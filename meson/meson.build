# meson.build (ROOT)

project('linux-multiarch-asm', ['c', 'cpp'], version: '0.1')
message('>>> Building linux-multiarch-asm in ' + get_option('buildtype') + ' mode')

# Vertel de compiler (gcc/clang) om de assembler (-Wa) de vlag --noexecstack mee te geven
add_project_arguments('-Wa,--noexecstack', language : 'c')

# Als je ook C++ bestanden hebt die asm bevatten of linken:
add_project_arguments('-Wa,--noexecstack', language : 'cpp')

# 1. Definieer de GENERIEKE include map (waar oop.h staat)
# Dit is nieuw en essentieel!
generic_inc = include_directories('include')

# Detect architecture
target_arch = host_machine.cpu_family()
message('>>> Configuring build for architecture: ' + target_arch)

# Duik de specifieke architectuur in
# (Je mag die if/else structuur houden, of direct subdir doen)
if target_arch == 'x86_64'
    subdir('arch/x86_64')
elif target_arch == 'mips'
    subdir('arch/mips')
elif target_arch == 'riscv64'
    subdir('arch/riscv64')
elif target_arch == 'aarch64'
    subdir('arch/aarch64')
endif
