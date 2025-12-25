# archive/meson.build

# archive global include files
nasm_inc = include_directories('includes')

# Detect architecture
target_arch = host_machine.cpu_family()
message('>>> Configuring NASM build for architecture: ' + target_arch)

subdir('examples')
subdir('functions')
subdir('projects')
# todo directory is a long term project
