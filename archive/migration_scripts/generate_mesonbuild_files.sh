#!/bin/bash
#
# script to autogenerate meson.build file in each directory recursively
# automatically add path comment in meson.build
# skips directories where meson.build already exists

find . -type d -print | while read -r d; do
  file="$d/meson.build"

  # Skip if meson.build already exists
  [ -f "$file" ] && continue

  rel="${d#./}"

  {
    echo "# ${rel:-.}/meson.build"
    find "$d" -mindepth 1 -maxdepth 1 -type d -printf "subdir('%f')\n"
  } > "$file"
done

