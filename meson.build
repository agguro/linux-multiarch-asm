# /meson.build
project('linux-multiarch-asm', 'c', 'cpp', version: '1.0')

# Detect NASM for the Archive
nasm = find_program('nasm', required: false)

# 1. Handle New Multi-Arch (GAS)
subdir('architectures')

# 2. Handle Archive (NASM) - Only if on x86_64
if host_machine.cpu_family() == 'x86_64' and nasm.found()
    subdir('archive')
else
    message('NASM or x86_64 host not found. Skipping Archive build.')
endif
