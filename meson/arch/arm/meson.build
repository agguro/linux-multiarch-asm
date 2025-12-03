nasm = find_program('nasm')
ld   = find_program('ld')

nasm_dbg_flags = '-felf64 -Fdwarf'
nasm_rel_flags = '-felf64'

ld_dbg_flags = '-melf_x86_64 -g'
ld_rel_flags = '-melf_x86_64'

incdir = meson.current_source_dir() / 'include'

arch_x86 = declare_dependency(
  variables: {
    'nasm': nasm.full_path(),
    'ld': ld.full_path(),
    'incdir': incdir,

    'nasm_dbg_flags': nasm_dbg_flags,
    'nasm_rel_flags': nasm_rel_flags,
    'ld_dbg_flags': ld_dbg_flags,
    'ld_rel_flags': ld_rel_flags,
  }
)

# 👉 DEZE REGEL ontbrak
meson.override_dependency('arch_x86', arch_x86)

subdir('examples')

