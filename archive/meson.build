# archive/meson.build

# NASM include path (string!)
nasm_incdir = join_paths(meson.current_source_dir(), 'includes')

# Default NASM flags
nasm_common_flags = [
  '-felf64',
  '-Fdwarf',
  '-I', nasm_incdir,
]

# Default ld flags for pure NASM programs
ld_common_flags = [
  '-melf_x86_64',
  '-z', 'noexecstack',
]

# Default dynamic linker
ld_dynamic_linker = '/lib64/ld-linux-x86-64.so.2'

subdir('examples')
