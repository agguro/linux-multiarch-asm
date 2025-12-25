# projects/agguro/AppIconMemory/meson.build
# Pure NASM example (_start), linked with ld

asm_file = 'appiconmem.asm'
name     = 'appiconmem'

lst_build_dir = join_paths(meson.current_build_dir(), 'lst')

lst_dir = custom_target(
  name + '_lst_dir',
  output: 'lst',
  command: ['mkdir', '-p', lst_build_dir],
)

# -------------------------------
# Assemble (debug)
# -------------------------------

obj_debug = custom_target(
  name + '_obj_debug',
  input: asm_file,
  output: name + '.debug.o',
  depends: lst_dir,
  command: [nasm] + nasm_common_flags + [
    '-g',
    '-Fdwarf',
    '-l', join_paths(lst_build_dir, name + '.debug.lst'),
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

# -------------------------------
# Assemble (release)
# -------------------------------

obj_release = custom_target(
  name + '_obj_release',
  input: asm_file,
  output: name + '.o',
  depends: lst_dir,
  command: [nasm] + nasm_common_flags + [
    '-l', join_paths(lst_build_dir, name + '.lst'),
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

# -------------------------------
# Link (debug)
# -------------------------------

exe_debug = custom_target(
  name + '.debug',
  input: obj_debug,
  output: name + '.debug',
  command: [ld] + ld_common_flags + [
    '-g',
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

# -------------------------------
# Link (release)
# -------------------------------

exe_release = custom_target(
  name,
  input: obj_release,
  output: name,
  command: [ld] + ld_common_flags + [
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)
