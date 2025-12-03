#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# 1. Detect Host Architecture
HOST_ARCH=$(uname -m)
echo "=========================================="
echo "   Host System: $HOST_ARCH"
echo "=========================================="

# 2. Build Function
build_target() {
    TARGET_ARCH=$1      # e.g., x86_64
    CROSS_FILE=$2       # e.g., cross/x86_64.txt
    BUILD_DIR="build_$TARGET_ARCH"

    echo ""
    echo ">>> Building target: $TARGET_ARCH"

    # A. CONFIGURATION
    if [ ! -d "$BUILD_DIR" ]; then
        echo "    Build directory not found. Running setup..."
        if [ "$HOST_ARCH" == "$TARGET_ARCH" ]; then
            echo "    (Mode: Native - Using system defaults)"
            meson setup "$BUILD_DIR"
        else
            echo "    (Mode: Cross - Using cross-file: $CROSS_FILE)"
            meson setup "$BUILD_DIR" --cross-file "$CROSS_FILE"
        fi
    else
        echo "    Build directory exists. Keeping configuration."
    fi

    # B. COMPILATION
    echo "    Starting compilation..."
    meson compile -C "$BUILD_DIR"

    # C. VERIFICATION (FIXED: Smart search using 'find')
    # We look for a file named 'hello' that is executable, anywhere in the build dir.
    FOUND_BIN=$(find "$BUILD_DIR" -name "hello" -type f -executable | head -n 1)

    if [ -n "$FOUND_BIN" ]; then
        echo "    [OK] Build successful!"
        echo "    Location: $FOUND_BIN"
        
        # Optional: Print file info
        echo "    Info: $(file -b "$FOUND_BIN" | cut -d',' -f2)"
    else
        echo "    [ERROR] Build finished, but binary 'hello' not found."
        exit 1
    fi
}

# 3. Execution List
# Ensure the first argument matches the output of 'uname -m' (x86_64, aarch64, etc.)

build_target "x86_64"   "cross/x86_64.txt"
# build_target "aarch64"  "cross/aarch64.txt"  <-- Uncomment when ready!
# build_target "mips"     "cross/mips.txt"
# build_target "riscv64"  "cross/riscv64.txt"

echo ""
echo "=========================================="
echo "   ALL BUILDS COMPLETED SUCCESSFULLY!"
echo "=========================================="
