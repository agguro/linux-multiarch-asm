# examples/smc/32bits/smc_example1/meson.build
# Pure NASM example (_start), linked with ld
# Produces:
#   - smc_example1
#   - smc_example1.debug
#   - lst/smc_example1.lst
#   - lst/smc_example1.debug.lst

asm_file = 'smc_example1.asm'
name     = 'smc_example1'

# -------------------------------
# Listing directory
# -------------------------------

lst_dir = custom_target(
  name + '_lst_dir',
  output: 'lst',
  command: ['mkdir', '-p', '@OUTPUT@'],
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
    '-l', 'lst/' + name + '.debug.lst',
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
    '-l', 'lst/' + name + '.lst',
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
