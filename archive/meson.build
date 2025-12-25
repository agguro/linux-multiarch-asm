# archive/meson.build

nasm_inc = include_directories('includes')

message('>>> Configuring NASM build for architecture: ' +
        host_machine.cpu_family())
        
# for use with nasm commandline arguments
nasm_incdir = join_paths(meson.current_source_dir(), 'includes')

subdir('examples')
subdir('functions')
subdir('projects')

