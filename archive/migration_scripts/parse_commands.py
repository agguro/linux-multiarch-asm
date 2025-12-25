#!/usr/bin/env python3

import re
from collections import defaultdict

input_file = "output.txt"
output_file = "manual_commands_summary.txt"

def clean_path(path):
    # Removes absolute paths and directory prefixes to show just the file
    return path.split('/')[-1]

# Structure: projects[project_name][version] = [list of commands]
projects = defaultdict(lambda: defaultdict(list))

with open(input_file, 'r') as f:
    lines = f.readlines()
    
    for line in lines:
        # Identify which project this belongs to
        match = re.search(r'archive/examples/(.*?)/(.*?)/', line)
        if not match: continue
        
        project_name = match.group(2)
        # Determine if this is a debug or release command
        version = "DEBUG" if ".debug" in line else "RELEASE"
        
        # --- Handle NASM ---
        if "/usr/bin/nasm" in line:
            cmd = "nasm -f elf64 -I ../../includes "
            if "-g" in line: cmd += "-g -Fdwarf "
            
            out_match = re.search(r'-o (\S+)', line)
            in_match = re.search(r'(\S+\.asm)', line)
            
            if out_match and in_match:
                cmd += f"-o {clean_path(out_match.group(1))} {clean_path(in_match.group(1))}"
                projects[project_name][version].append(cmd)

        # --- Handle Linking (ld or g++) ---
        elif ("/usr/bin/ld" in line or " c++ " in line) and " -c " not in line:
            is_ld = "/usr/bin/ld" in line
            cmd = "ld " if is_ld else "g++ "
            
            if "-mavx2" in line: cmd += "-mavx2 "
            elif "-mavx512f" in line: cmd += "-mavx512f "
            elif "-mavx" in line: cmd += "-mavx "
            elif "-melf_x86_64" in line: cmd += "-m elf_x86_64 "
            if not is_ld and "-g" in line: cmd += "-g "
            
            out_match = re.search(r'-o (\S+)', line)
            if out_match:
                cmd += f"-o {clean_path(out_match.group(1))} *.o"
                projects[project_name][version].append(cmd)

# Write the grouped output
with open(output_file, 'w') as out:
    for proj in sorted(projects.keys()):
        out.write(f"\n{'='*70}\n")
        out.write(f" PROJECT: {proj}\n")
        out.write(f"{'='*70}\n")
        
        for ver in ["RELEASE", "DEBUG"]:
            if ver in projects[proj]:
                out.write(f"\n--- {ver} VERSION ---\n")
                for command in projects[proj][ver]:
                    out.write(f"  {command}\n")

print(f"Success! Grouped commands saved to {output_file}")
