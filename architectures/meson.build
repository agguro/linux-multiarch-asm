# architectures/meson.build

# architecture global include files
generic_inc = include_directories('include')

# Detect architecture
target_arch = host_machine.cpu_family()
message('>>> Configuring build for architecture: ' + target_arch)

subdir('arch' / target_arch)
