#!/bin/bash

# --- 1. CONFIGURATION ---
REAL_HOST_ARCH=$(uname -m)
if [[ "$REAL_HOST_ARCH" == "arm64" || "$REAL_HOST_ARCH" == "aarch64" ]]; then
    REAL_HOST_ARCH="aarch64"
fi

declare -A CROSS_FILES=( 
    ["x86_64"]="x86_64.ini" 
    ["aarch64"]="aarch64.ini" 
    ["mips64"]="mips64.ini" 
    ["riscv64"]="riscv64.ini" 
)

# --- 2. USAGE HELP ---
usage() {
    # If an argument is passed to usage, print it as an error
    if [ -n "$1" ]; then
        echo -e "[ERROR] $1"
    fi

    echo "Usage: $0 --arch <ARCH> [OPTIONS]"
    echo ""
    echo "Required:"
    echo "  --arch <NAME>      Targets: x86_64, aarch64, mips64, riscv64, all"
    echo ""
    echo "Options:"
    echo "  --buildtype <T>    debug, release (Default: debug)"
    echo "  --clean            Clean the specific target build folder before building"
    echo "  --clean-all        Delete the entire 'build/' directory"
    echo "  --help             Show this help screen"
    exit 1
}

# --- 3. DEPENDENCY CHECK ---
check_dependencies() {
    local TARGET=$1
    local tools=("meson" "ninja")

    if [ "$TARGET" == "all" ]; then
        tools+=("gcc" "g++" "mips64-linux-gnu-gcc" "aarch64-linux-gnu-gcc" "riscv64-linux-gnu-gcc")
    elif [ "$TARGET" == "$REAL_HOST_ARCH" ]; then
        tools+=("gcc" "g++")
    else
        case $TARGET in
            x86_64)  tools+=("x86_64-linux-gnu-gcc") ;;
            mips64)  tools+=("mips64-linux-gnu-gcc") ;;
            aarch64) tools+=("aarch64-linux-gnu-gcc") ;;
            riscv64) tools+=("riscv64-linux-gnu-gcc") ;;
        esac
    fi

    for tool in "${tools[@]}"; do
        if ! command -v "$tool" &> /dev/null; then
            echo "[ERROR] Required tool not found: $tool"
            exit 1
        fi
    done
}

# --- 4. BUILD LOGIC ---
build_one() {
    local ARCH=$1
    local TYPE=$2
    local BUILD_DIR="build/${TYPE}-${ARCH}"
    
    echo ""
    echo ">>> TARGET: ${ARCH} (${TYPE})"

    if [ "$CLEAN_SET" = true ] && [ -d "$BUILD_DIR" ]; then
        rm -rf "$BUILD_DIR"
    fi

    if [ ! -d "$BUILD_DIR" ]; then
        local SETUP_CMD=("meson" "setup" "$BUILD_DIR" "--buildtype=$TYPE")
        if [ "$ARCH" != "$REAL_HOST_ARCH" ]; then
            local CROSS_FILE="cross/${CROSS_FILES[$ARCH]}"
            if [ ! -f "$CROSS_FILE" ]; then
                echo "[SKIP] Missing cross-file: $CROSS_FILE"
                return 1
            fi
            SETUP_CMD+=("--cross-file" "$CROSS_FILE")
        fi
        "${SETUP_CMD[@]}"
    else
        meson setup "$BUILD_DIR" --reconfigure --buildtype="$TYPE"
    fi

    meson compile -C "$BUILD_DIR"
    return $?
}

# --- 5. MAIN ---

ARCH_SET=""
TYPE_SET="debug"
CLEAN_SET=false

# Argument Parsing
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

# Check if arch was provided
if [ -z "$ARCH_SET" ]; then
    usage "No architecture specified."
fi

check_dependencies "$ARCH_SET"

if [ "$ARCH_SET" = "all" ]; then
    SUCCESS=0
    TOTAL=0
    # Explicitly order the loop for the students
    for a in "x86_64" "aarch64" "mips64" "riscv64"; do
        build_one "$a" "$TYPE_SET"
        [ $? -eq 0 ] && ((SUCCESS++))
        ((TOTAL++))
    done
    echo -e "\nSummary: $SUCCESS/$TOTAL architectures built successfully."
else
    # Validate specific arch name
    if [[ -z "${CROSS_FILES[$ARCH_SET]}" ]]; then
        usage "Unsupported architecture: $ARCH_SET"
    fi
    build_one "$ARCH_SET" "$TYPE_SET"
fi
