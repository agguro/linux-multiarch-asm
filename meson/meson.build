project('scratch_project', 'c', version: '0.1')

# Detect the target architecture (from host PC or cross-file)
target_arch = host_machine.cpu_family()

message('>>> Configuring build for architecture: ' + target_arch)

# Enter the architecture specific tree
subdir('arch')
