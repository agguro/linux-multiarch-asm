# examples/ipc/PipeDemo1/meson.build
# Pure NASM example (_start), linked with ld
# Produces:
#   - pipedemo1
#   - pipedemo1.debug
#   - pipedemo1.lst
#   - pipedemo1.debug.lst

asm_file = 'pipedemo1.asm'
name     = 'pipedemo1'

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
