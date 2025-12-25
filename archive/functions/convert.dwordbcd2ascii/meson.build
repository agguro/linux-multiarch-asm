# functions/convert.dwordbcd2ascii/meson.build

asm_file = 'dwordbcd2ascii.asm'
name     = asm_file.split('.')[0]
src      = files(asm_file)

# -------------------------------
# NASM flags
# -------------------------------

nasm_common = [
  '-felf64',
  '-I', nasm_incdir,
]

nasm_debug = nasm_common + [
  '-g',
  '-F', 'dwarf',
]

nasm_release = nasm_common

# -------------------------------
# Assemble (debug)
# -------------------------------

obj_debug = custom_target(
  name + '_obj_debug',
  input: src,
  output: name + '.debug.o',
  command: [nasm] + nasm_debug + [
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
  input: src,
  output: name + '.o',
  command: [nasm] + nasm_release + [
    '-l', name + '.lst',
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

# -------------------------------
# Link
# -------------------------------

exe_debug = executable(
  name + '.debug',
  obj_debug,
  link_args: [
    '-g',
    '-z', 'noexecstack',
  ],
  install: false,
)

exe_release = executable(
  name,
  obj_release,
  link_args: [
    '-s',
    '-z', 'noexecstack',
  ],
  install: false,
)

# -------------------------------
# Tests
# -------------------------------

test(name, exe_release, verbose: true)
