# /meson.build
project('linux-multiarch-asm', ['c', 'cpp'], version: '0.1')

message('>>> Building linux-multiarch-asm in ' + get_option('buildtype') + ' mode')

# Global security flags for all architectures
add_project_arguments('-Wa,--noexecstack', language : ['c', 'cpp'])

# Enter the subdirectories
subdir('architectures')

# Separate logic for the legacy archive (NASM)
if host_machine.cpu_family() == 'x86_64'
    subdir('archive')
endif
