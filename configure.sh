#!/bin/bash
# ================================================================= #
# Linux Multi-Arch ASM Configuration Script                         #
# ================================================================= #

# ------------------------------------------------------------
# Configuration & Architecture Detection
# ------------------------------------------------------------
REAL_HOST_ARCH=$(uname -m)
[ "$REAL_HOST_ARCH" = "arm64" ] && REAL_HOST_ARCH="aarch64"

# Mapping arch keys to cross-file names
declare -A CROSS_FILES=( 
    ["x86_64"]="x86_64.ini" 
    ["aarch64"]="aarch64.ini" 
    ["mips64"]="mips64.ini" 
    ["riscv64"]="riscv64.ini" 
)

# ------------------------------------------------------------
# Helper Functions
# ------------------------------------------------------------
check_cmd() {
    printf "Checking for %-35s ... " "$1"
    if command -v "$1" >/dev/null 2>&1; then
        echo "[YES]"
    else
        echo "[NO]"
        EXIT_STATUS=1
    fi
}

usage() {
    [ -n "$1" ] && echo "ERROR: $1"
    echo ""
    echo "Usage: $0 --arch <ARCH> [OPTIONS]"
    echo ""
    echo "Required:"
    echo "  --arch <NAME>      Targets: x86_64, aarch64, mips64, riscv64, all"
    echo ""
    echo "Options:"
    echo "  --buildtype <T>    debug, release (Default: debug)"
    echo "  --clean            Clean target folder before building"
    echo "  --clean-all        Delete the entire 'build/' directory"
    echo "  --help             Show this help screen"
    exit 1
}

# ------------------------------------------------------------
# Argument Parsing
# ------------------------------------------------------------
ARCH_SET=""
TYPE_SET="debug"
CLEAN_SET=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --arch) ARCH_SET="$2"; shift 2 ;;
        --buildtype) TYPE_SET="$2"; shift 2 ;;
        --clean) CLEAN_SET=true; shift ;;
        --clean-all) echo "Wiping build directory..."; rm -rf build/; shift ;;
        --help) usage ;;
        *) usage "Unknown option: $1" ;;
    esac
done

if [ -z "$ARCH_SET" ]; then usage "No architecture specified."; fi

# ------------------------------------------------------------
# Pre-flight Tool Check
# ------------------------------------------------------------
# ------------------------------------------------------------
# Pre-flight Tool Check
# ------------------------------------------------------------
EXIT_STATUS=0
echo "===================================================="
echo "Host Machine: $REAL_HOST_ARCH"
echo "Target Arch:  $ARCH_SET"
echo "===================================================="

# 1. Core Build Tools (Always needed)
check_cmd meson
check_cmd ninja

# 2. Dynamic Compiler Checks
# This function decides which compiler name to look for
check_compiler_for() {
    local TARGET=$1
    
    if [ "$TARGET" = "$REAL_HOST_ARCH" ]; then
        # If we are ON the target machine, we just need the local gcc
        check_cmd gcc
    else
        # If we are NOT on the target, we need the specific cross-compiler
        case $TARGET in
            x86_64)  check_cmd x86_64-linux-gnu-gcc ;;
            aarch64) check_cmd aarch64-linux-gnu-gcc ;;
            mips64)  check_cmd mips64-linux-gnuabi64-gcc ;;
            riscv64) check_cmd riscv64-linux-gnu-gcc ;;
        esac
    fi
}

# Run the checks based on what the student wants to build
if [ "$ARCH_SET" = "all" ]; then
    for a in "x86_64" "aarch64" "mips64" "riscv64"; do
        check_compiler_for "$a"
    done
else
    check_compiler_for "$ARCH_SET"
fi

echo "----------------------------------------------------"

if [ $EXIT_STATUS -ne 0 ]; then
    echo "Error: Configuration failed due to missing tools."
    echo "Please install the tools marked with [NO] and run again."
    exit 1
fi

# ------------------------------------------------------------
# Build Logic
# ------------------------------------------------------------
build_one() {
    local ARCH=$1
    local BUILD_DIR="build/${TYPE_SET}-${ARCH}"
    
    echo ""
    echo ">>> STARTING BUILD FOR: ${ARCH}"

    [ "$CLEAN_SET" = true ] && rm -rf "$BUILD_DIR"

    if [ ! -d "$BUILD_DIR" ]; then
        local SETUP_CMD=("meson" "setup" "$BUILD_DIR" "--buildtype=$TYPE_SET")
        
        # Only use cross-file if target != host machine
        if [ "$ARCH" != "$REAL_HOST_ARCH" ]; then
            local CROSS_FILE="cross/${CROSS_FILES[$ARCH]}"
            if [ ! -f "$CROSS_FILE" ]; then
                echo "SKIP: Missing cross-file $CROSS_FILE"
                return 1
            fi
            SETUP_CMD+=("--cross-file" "$CROSS_FILE")
        fi
        "${SETUP_CMD[@]}"
    else
        meson setup "$BUILD_DIR" --reconfigure
    fi

    meson compile -C "$BUILD_DIR"
}

# Run the builds
if [ "$ARCH_SET" = "all" ]; then
    for a in "x86_64" "aarch64" "mips64" "riscv64"; do 
        build_one "$a"
    done
else
    if [[ -z "${CROSS_FILES[$ARCH_SET]}" ]]; then
        usage "Unsupported architecture: $ARCH_SET"
    fi
    build_one "$ARCH_SET"
fi

echo ""
echo "Configuration and build finished."
