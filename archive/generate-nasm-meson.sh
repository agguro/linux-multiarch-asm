#!/usr/bin/env bash
#
# Autogenerate meson.build files for pure NASM leaf directories
#
# - Finds directories with exactly one .asm file
# - Always overwrites meson.build
# - Assumes pure NASM (_start) programs
# - Uses ld explicitly (no executable())
# - Generates debug + release binaries
# - Generates .lst and .debug.lst in a lst/ subdirectory
# - Adds a path comment for orientation

set -euo pipefail

find . -type d | while read -r dir; do
  # Find .asm files directly in this directory
  mapfile -t asm_files < <(find "$dir" -maxdepth 1 -type f -name '*.asm')
  [ "${#asm_files[@]}" -eq 0 ] && continue

  # Skip non-leaf directories (ASM exists deeper)
  if find "$dir" -mindepth 2 -type f -name '*.asm' | grep -q .; then
    continue
  fi

  asm_file="$(basename "${asm_files[0]}")"
  name="${asm_file%.asm}"

  rel_path="${dir#./}"
  [ -z "$rel_path" ] && rel_path="."

  cat > "$dir/meson.build" <<EOF
# ${rel_path}/meson.build
# Pure NASM example (_start), linked with ld
# Produces:
#   - ${name}
#   - ${name}.debug
#   - lst/${name}.lst
#   - lst/${name}.debug.lst

asm_file = '${asm_file}'
name     = '${name}'

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
EOF

  echo "Generated: $dir/meson.build"
done

