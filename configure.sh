#!/bin/bash
# ================================================================= #
# Linux Multi-Arch ASM Configuration Script                         #
# ================================================================= #

# ------------------------------------------------------------
# Configuration & Architecture Detection
# ------------------------------------------------------------
REAL_HOST_ARCH=$(uname -m)
[ "$REAL_HOST_ARCH" = "arm64" ] && REAL_HOST_ARCH="aarch64"

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
    echo "  --prefix <PATH>    Installation prefix (Default: local dist/ folder)"
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
# Default prefix to a 'dist' folder in the current project directory
PREFIX_PATH="$(pwd)/dist"

while [[ $# -gt 0 ]]; do
    case $1 in
        --arch) ARCH_SET="$2"; shift 2 ;;
        --prefix) PREFIX_PATH="$2"; shift 2 ;;
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
EXIT_STATUS=0
echo "===================================================="
echo "Host Machine: $REAL_HOST_ARCH"
echo "Target Arch:  $ARCH_SET"
echo "Prefix:       $PREFIX_PATH"
echo "===================================================="

check_cmd meson
check_cmd ninja
check_cmd gdb-multiarch

# 2. Dynamic Tool Checks
check_compiler_for() {
    local TARGET=$1
    local PREFIX=""
    local EMULATOR=""
    
    # 1. Standard GNU Binutils & Compiler (Needed for EVERYTHING)
    local TOOLS=("gcc" "as" "ld" "objdump")

    if [ "$TARGET" = "$REAL_HOST_ARCH" ]; then
        # Check standard GNU tools
        for tool in "${TOOLS[@]}"; do check_cmd "$tool"; done
        
        # 2. Add NASM ONLY for x86_64 (For your archive directory)
        if [ "$TARGET" = "x86_64" ]; then
            check_cmd nasm
        fi
    else
        case $TARGET in
            x86_64)  PREFIX="x86_64-linux-gnu-"; EMULATOR="qemu-x86_64" ;;
            aarch64) PREFIX="aarch64-linux-gnu-"; EMULATOR="qemu-aarch64" ;;
            mips64)  PREFIX="mips64-linux-gnuabi64-"; EMULATOR="qemu-mips64" ;;
            riscv64) PREFIX="riscv64-linux-gnu-"; EMULATOR="qemu-riscv64" ;;
        esac

        # Check Cross-GNU tools
        for tool in "${TOOLS[@]}"; do check_cmd "${PREFIX}${tool}"; done
        [ -n "$EMULATOR" ] && check_cmd "$EMULATOR"
        
        # 3. Add NASM ONLY for x86_64 Cross-target
        if [ "$TARGET" = "x86_64" ]; then 
            check_cmd nasm 
        fi
    fi
}

if [ "$ARCH_SET" = "all" ]; then
    for a in "x86_64" "aarch64" "mips64" "riscv64"; do check_compiler_for "$a"; done
else
    check_compiler_for "$ARCH_SET"
fi

echo "----------------------------------------------------"
if [ $EXIT_STATUS -ne 0 ]; then
    echo "Error: Configuration failed due to missing tools."
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
        # Added --prefix to the setup command
        local SETUP_CMD=("meson" "setup" "$BUILD_DIR" "--prefix" "$PREFIX_PATH" "--buildtype=$TYPE_SET")
        
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
        # Update prefix even on reconfigure
        meson setup "$BUILD_DIR" --reconfigure --prefix "$PREFIX_PATH"
    fi

    meson compile -C "$BUILD_DIR"
    # Optional: Automatically install to the prefix directory
    # meson install -C "$BUILD_DIR"
}

if [ "$ARCH_SET" = "all" ]; then
    for a in "x86_64" "aarch64" "mips64" "riscv64"; do build_one "$a"; done
else
    build_one "$ARCH_SET"
fi

echo ""
echo "Configuration and build finished."
