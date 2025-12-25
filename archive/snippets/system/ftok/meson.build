# snippets/system/ftok/meson.build
# Pure NASM example (_start), linked with ld

asm_file = 'ftok.asm'
name     = 'ftok'

# -------------------------------
# Assemble
# -------------------------------

obj = custom_target(
  name + '_obj',
  input: asm_file,
  output: name + '.o',
  command: [nasm] + nasm_common_flags + [
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

# -------------------------------
# Link (ld, not compiler driver)
# -------------------------------

exe = custom_target(
  name,
  input: obj,
  output: name,
  command: [ld] + ld_common_flags + [
    '-g',
    '--dynamic-linker', ld_dynamic_linker,
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)
