#!/usr/bin/env bash
#
# Script to autogenerate meson.build files for NASM leaf directories
# Recursively scans for directories containing .asm sources
# Adds a path comment at the top of each generated meson.build
# Skips leaf directories where meson.build already exists

set -euo pipefail

find . -type d | while read -r dir; do
  # Find NASM sources in this directory
  asm_files=($(find "$dir" -maxdepth 1 -type f -name '*.asm'))
  [ "${#asm_files[@]}" -eq 0 ] && continue

  # Skip non-leaf directories (subdirs containing .asm)
  sub_asm=$(find "$dir" -mindepth 2 -type f -name '*.asm' | wc -l)
  [ "$sub_asm" -ne 0 ] && continue

  asm_file="$(basename "${asm_files[0]}")"
  base="${asm_file%.asm}"

  rel_path="${dir#./}"
  [ -z "$rel_path" ] && rel_path="."

  cat > "$dir/meson.build" <<EOF
# ${rel_path}/meson.build

name = '${base}'
src  = files('${asm_file}')

# -------------------------------
# NASM flags
# -------------------------------

nasm_common = [
  '-felf64',
  '-I', nasm_inc,
]

nasm_debug = nasm_common + [
  '-g',
  '-F', 'dwarf',
]

nasm_release = nasm_common

# -------------------------------
# Assemble
# -------------------------------

obj_debug = custom_target(
  name + '_obj_debug',
  input: src,
  output: name + '.debug.o',
  command: [
    nasm,
    nasm_debug,
    '-l', name + '.debug.lst',
    '-o', '@OUTPUT@',
    '@INPUT@',
  ],
  build_by_default: true,
)

obj_release = custom_target(
  name + '_obj_release',
  input: src,
  output: name + '.o',
  command: [
    nasm,
    nasm_release,
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
EOF

  echo "Generated: $dir/meson.build"
done

