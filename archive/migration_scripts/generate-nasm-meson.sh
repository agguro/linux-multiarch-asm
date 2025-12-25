#!/usr/bin/env bash
#
# Autogenerate meson.build files for pure NASM leaf directories
# - Finds directories with exactly one .asm file
# - Always overwrites meson.build (ignores existence)
# - Assumes pure NASM (_start) programs
# - Uses ld explicitly (no executable())
# - Adds a path comment for orientation
# - Generates a correct Meson test() invocation

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

asm_file = '${asm_file}'
name     = '${name}'

# -------------------------------
# Assemble
# -------------------------------

obj = custom_target(
  name + '_obj',
  input: asm_file,
  output: name + '.o',
  command: [nasm] + nasm_common_flags + [
    '-g',
    '-Fdwarf',
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
EOF
  echo "Generated: $dir/meson.build"
done

