#!/bin/bash
#
# autogenerates README.md files recursively skipping existing README.ms files.
# each README.md has the directory name as title and a list of subdirs as links.

find . -type d | while read -r d; do
  readme="$d/README.md"
  [ -f "$readme" ] && continue

  name="$(basename "$d")"

  {
    echo "# ${name}"
    echo

    find "$d" -mindepth 1 -maxdepth 1 -type d | while read -r sub; do
      subname="$(basename "$sub")"
      echo "- [${subname}](${subname})"
    done
  } > "$readme"
done
