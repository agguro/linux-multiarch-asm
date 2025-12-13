#!/usr/bin/env python3
import argparse
import subprocess
import shutil
import sys
import os
import platform

# --- CONFIGURATION ---
# Map architecture names to their cross-file filenames (in the 'cross' folder)
CROSS_FILES = {
    "x86_64": "x86_64.ini",
    "aarch64": "aarch64.ini",
    "mips": "mips.ini",
    "riscv64": "riscv64.ini"
}

# --- COLORS & FORMATTING ---
class Colors:
    HEADER = '\033[95m'
    BLUE = '\033[94m'
    CYAN = '\033[96m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def log(message, color=Colors.BLUE):
    print(f"{color}{message}{Colors.ENDC}")

def get_host_arch():
    """Normalize the host architecture name."""
    machine = platform.machine()
    if machine == "x86_64": return "x86_64"
    elif machine in ["aarch64", "arm64"]: return "aarch64"
    else: return machine

def print_custom_help():
    """Displays a nicely formatted help screen."""
    archs = ", ".join(CROSS_FILES.keys())
    host = get_host_arch()
    
    print(f"""
{Colors.HEADER}{Colors.BOLD}LINUX MULTI-ARCH BUILD SYSTEM{Colors.ENDC}
{Colors.HEADER}============================={Colors.ENDC}

{Colors.BOLD}DESCRIPTION:{Colors.ENDC}
  Build and cross-compile the kernel/application for different 
  architectures using Meson. 
  
  Artifacts are stored in: {Colors.CYAN}build/<buildtype>-<arch>/{Colors.ENDC}
  (e.g., build/debug-x86_64, build/release-mips)

{Colors.BOLD}USAGE:{Colors.ENDC}
  {Colors.CYAN}./build.py --arch <ARCH> [OPTIONS]{Colors.ENDC}
  {Colors.CYAN}./build.py --clean-all{Colors.ENDC}

{Colors.BOLD}REQUIRED:{Colors.ENDC}
  {Colors.GREEN}--arch <NAME>{Colors.ENDC}       Select target architecture (Required for building).
                      {Colors.BOLD}Available:{Colors.ENDC} {archs}
                      {Colors.BOLD}Or:{Colors.ENDC} all (builds them all sequentially)

{Colors.BOLD}OPTIONS:{Colors.ENDC}
  {Colors.YELLOW}--buildtype <TYPE>{Colors.ENDC}  Select build type: debug, release, minsize.
                      (Default: {Colors.UNDERLINE}debug{Colors.ENDC})
  
  {Colors.YELLOW}--clean{Colors.ENDC}             Remove the *specific* build directory before building.
                      (e.g. only cleans build/debug-x86_64)

  {Colors.YELLOW}--clean-all{Colors.ENDC}         Remove the ENTIRE 'build/' directory (all architectures).
                      (Deep clean / Reset)

  {Colors.YELLOW}--test{Colors.ENDC}              Run unit tests after successful compilation.

{Colors.BOLD}EXAMPLES:{Colors.ENDC}
  1. Deep clean everything:
     {Colors.CYAN}./build.py --clean-all{Colors.ENDC}

  2. Fresh start: clean everything, then build x86_64 release:
     {Colors.CYAN}./build.py --clean-all --arch x86_64 --buildtype release{Colors.ENDC}

{Colors.BOLD}HOST STATUS:{Colors.ENDC}
  You are currently running on: {Colors.HEADER}{host}{Colors.ENDC}
""")

def run_command(cmd, cwd=None):
    """Run a shell command and stop on errors."""
    try:
        # Print command in grey/dim
        print(f"\033[90m$ {' '.join(cmd)}\033[0m") 
        subprocess.run(cmd, cwd=cwd, check=True)
    except subprocess.CalledProcessError:
        log(f"\n[ERROR] Command failed: {' '.join(cmd)}", Colors.FAIL)
        sys.exit(1)

def build_target(arch, host_arch, args):
    # Directory is now build/<buildtype>-<arch>
    dir_name = f"{args.buildtype}-{arch}"
    build_dir = os.path.join("build", dir_name)
    
    cross_file = os.path.join("cross", CROSS_FILES.get(arch, f"{arch}.ini"))

    log(f"\n==========================================", Colors.HEADER)
    log(f" TARGET: {arch.upper()} ({args.buildtype.upper()})", Colors.BOLD)
    log(f" DIR:    {build_dir}", Colors.BOLD)
    log(f"==========================================", Colors.HEADER)

    # 1. CLEAN (Specific)
    # Only runs if --clean is used (and not --clean-all, because that already deleted everything)
    if args.clean and not args.clean_all:
        if os.path.exists(build_dir):
            log(f"> Cleaning specific directory: {build_dir}...", Colors.WARNING)
            shutil.rmtree(build_dir)

    # 2. CONFIGURE (Meson Setup)
    if not os.path.exists(build_dir):
        log(f"> Configuring build directory...", Colors.GREEN)
        
        setup_cmd = ["meson", "setup", build_dir, f"--buildtype={args.buildtype}"]
        
        # Determine if we need Native or Cross build
        if arch == host_arch:
            log(f"  Mode: NATIVE ({host_arch})")
        else:
            log(f"  Mode: CROSS ({host_arch} -> {arch})")
            # Check if cross file exists
            if not os.path.exists(cross_file):
                log(f"[ERROR] Cross file not found: {cross_file}", Colors.FAIL)
                sys.exit(1)
            setup_cmd.extend(["--cross-file", cross_file])
            
        run_command(setup_cmd)
    else:
        log(f"> Reconfiguring existing build...", Colors.GREEN)
        # We use --reconfigure to ensure buildtype changes are picked up
        run_command(["meson", "setup", build_dir, "--reconfigure", f"--buildtype={args.buildtype}"])

    # 3. COMPILE
    log(f"> Compiling...", Colors.GREEN)
    run_command(["meson", "compile", "-C", build_dir])

    # 4. TEST (Optional)
    if args.test:
        log(f"> Running Tests...", Colors.GREEN)
        # -v for verbose output, --num-processes 1 to preserve order
        run_command(["meson", "test", "-C", build_dir, "-v", "--num-processes", "1"])

def main():
    # If no arguments provided: show custom help and exit
    if len(sys.argv) == 1:
        print_custom_help()
        sys.exit(1)

    # Normal argparse logic
    parser = argparse.ArgumentParser(add_help=False) # Disable default help to prevent conflicts
    
    # Manually add --help so argparse handles it gracefully
    parser.add_argument("--help", action="store_true")
    parser.add_argument("--arch", required=False) # Set to False for pre-check
    parser.add_argument("--buildtype", default="debug", choices=["debug", "release", "minsize", "debugoptimized"])
    parser.add_argument("--clean", action="store_true")
    parser.add_argument("--clean-all", action="store_true") # <-- NEW OPTION
    parser.add_argument("--test", action="store_true")

    # First parse known args to check if --help is present
    args, unknown = parser.parse_known_args()

    if args.help:
        print_custom_help()
        sys.exit(0)

    # --- HANDLE CLEAN-ALL ---
    if args.clean_all:
        if os.path.exists("build"):
            log(f"> Removing entire 'build' directory...", Colors.WARNING)
            shutil.rmtree("build")
        else:
            log(f"> Build directory does not exist, nothing to clean.", Colors.WARNING)
        
        # If the user ONLY provided --clean-all (no architecture), we stop here.
        if not args.arch:
            log(f"\n[SUCCESS] Clean complete.", Colors.GREEN)
            sys.exit(0)

    # --- ARCHITECTURE CHECK ---
    # Now arch is required because we are proceeding to build
    if not args.arch:
        print(f"{Colors.FAIL}[ERROR] Argument '--arch' is required (unless using --clean-all only).{Colors.ENDC}")
        print(f"Use {Colors.CYAN}./build.py --help{Colors.ENDC} for instructions.")
        sys.exit(1)

    # Validation of architecture
    avail_archs = list(CROSS_FILES.keys()) + ['all']
    if args.arch not in avail_archs:
        print(f"{Colors.FAIL}[ERROR] Unknown architecture: {args.arch}{Colors.ENDC}")
        print(f"Choose from: {', '.join(avail_archs)}")
        sys.exit(1)

    host_arch = get_host_arch()
    log(f"Host Detected: {host_arch}", Colors.BOLD)

    # Determine targets
    targets = []
    if args.arch == "all":
        targets = list(CROSS_FILES.keys())
    else:
        targets = [args.arch]

    # Loop through targets
    for arch in targets:
        build_target(arch, host_arch, args)

    log(f"\n[SUCCESS] Build(s) finished for: {', '.join(targets)}", Colors.GREEN)

if __name__ == "__main__":
    main()
