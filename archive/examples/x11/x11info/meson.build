# examples/x11/x11info/meson.build
# Pure NASM example (_start), linked with ld
# Produces:
#   - x11info
#   - x11info.debug
#   - x11info.lst
#   - x11info.debug.lst

asm_file = 'x11info.asm'
name     = 'x11info'

# -------------------------------
# Assemble (debug)
# -------------------------------

obj_debug = custom_target(
  name + '_obj_debug',
  input: asm_file,
  output: name + '.debug.o',
  command: [nasm] + nasm_common_flags + [
    '-g',
    '-Fdwarf',
    '-l', name + '.debug.lst',
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
  command: [nasm] + nasm_common_flags + [
    '-l', name + '.lst',
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
    '--dynamic-linker', ld_dynamic_linker,
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
    '--dynamic-linker', ld_dynamic_linker,
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)
