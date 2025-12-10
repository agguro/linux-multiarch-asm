#!/bin/bash
set -e

echo "=========================================="
echo " linux-nasm MULTI-ARCH BUILD SYSTEM"
echo "=========================================="

# 1. Normalize host architecture
case $(uname -m) in
    x86_64) HOST_ARCH="x86_64" ;;
    aarch64|arm64) HOST_ARCH="aarch64" ;;
    *)
        echo "Unknown host architecture: $(uname -m)"
        exit 1
        ;;
esac

echo "Host detected: $HOST_ARCH"
echo ""

build_target() {
    TARGET_ARCH="$1"
    CROSS_FILE="$2"
    BUILD_DIR="build_${TARGET_ARCH}"

    echo ">>> Building for target arch: $TARGET_ARCH"

    # A. CONFIGURE
    if [ ! -d "$BUILD_DIR" ]; then
        echo "    Running first-time Meson setup..."

        if [ "$TARGET_ARCH" = "$HOST_ARCH" ]; then
            echo "    Mode: Native"
            meson setup "$BUILD_DIR" --buildtype=debug
        else
            echo "    Mode: Cross"
            meson setup "$BUILD_DIR" --cross-file "$CROSS_FILE" --buildtype=debug
        fi

    else
        echo "    Using existing build directory"
    fi

    # B. COMPILE
    echo "    Compiling..."
    meson compile -C "$BUILD_DIR"

    # C. VERIFY
    BIN_COUNT=$(find "$BUILD_DIR" -type f -executable | wc -l)

    if [ "$BIN_COUNT" -gt 0 ]; then
        echo "    [OK] Found $BIN_COUNT executable(s)."
    else
        echo "    [ERROR] No executables found!"
        exit 1
    fi

    echo ""
}

# 2. BUILD TARGETS
build_target "x86_64"  "cross/x86_64.ini"
build_target "aarch64" "cross/aarch64.ini"
build_target "mips"     "cross/mips.ini"
build_target "riscv64"  "cross/riscv64.ini"

echo "=========================================="
echo "   ALL BUILDS DONE!"
echo "=========================================="

