# AVX / AVX2 / AVX‑512 Array Addition Demo
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](https://img.shields.io/badge/platform-x86__64-blue.svg)
![SIMD](https://img.shields.io/badge/SIMD-AVX%20%7C%20AVX2%20%7C%20AVX512-orange)
![Build System](https://img.shields.io/badge/build-Meson%20%2F%20Ninja-lightgrey)

A professional-grade demonstration of SIMD array addition using **AVX (128‑bit)**,  
**AVX2 (256‑bit)**, and **AVX‑512 (512‑bit)** instructions in hand‑written x86‑64 assembly.

This project includes:

- GNU `as` Intel-syntax assembly (`.S`)
- A C++ driver
- A complete multi‑architecture **Meson build system**
- Support for **Intel SDE** to run AVX‑512 code on CPUs that do not support AVX‑512 natively

---

## 📚 Table of Contents
- [Overview](#overview)
- [Directory Structure](#directory-structure)
- [Requirements](#requirements)
- [Building](#building)
- [Running the SIMD Binaries](#running-the-simd-binaries)
- [Running AVX‑512 with Intel SDE](#running-avx-512-with-intel-sde)
- [Memory Alignment Requirements](#memory-alignment-requirements)
- [Assembly Coding Style](#assembly-coding-style)
- [Extending the Project](#extending-the-project)
- [License](#license)

---

## Overview

This repository demonstrates vectorized array addition using three SIMD instruction sets:

| SIMD Level | Register | Width | Elements (float32) |
|------------|----------|--------|---------------------|
| **AVX** | xmm | 128‑bit | 4 |
| **AVX2** | ymm | 256‑bit | 8 |
| **AVX‑512** | zmm | 512‑bit | 16 |

Each implementation contains:

- A standalone `.S` file implementing `addArrays()`
- A shared C++ test driver (`main.cpp`)
- Meson build definitions for the respective architectures

---

## Directory Structure

```
.
├── main.cpp
├── meson.build
└── arch/x86_64/
    ├── avx/
    │   ├── avx_addArrays.S
    │   └── meson.build
    ├── avx2/
    │   ├── avx2_addArrays.S
    │   └── meson.build
    └── avx512/
        ├── avx512_addArrays.S
        └── meson.build
```

---

## Requirements

### Build Tools
- GCC or Clang with GNU assembler (`as`)
- Meson  
- Ninja

Install on Debian/Ubuntu:

```sh
sudo apt install g++ meson ninja-build
```

### Optional (for AVX‑512 simulation)
- **Intel SDE** (Software Development Emulator)

Download:  
https://www.intel.com/content/www/us/en/developer/articles/tool/software-development-emulator.html

---

## Building

### 1. Configure

```sh
meson setup builddir
```

### 2. Build everything

```sh
meson compile -C builddir
```

or:

```sh
ninja -C builddir
```

---

## Running the SIMD Binaries

Each SIMD backend generates its own binary.

Examples:

```sh
./builddir/arch/x86_64/avx/avx_addArrays
./builddir/arch/x86_64/avx2/avx2_addArrays
./builddir/arch/x86_64/avx512/avx512_addArrays
```

---

## Running AVX‑512 with Intel SDE

Most CPUs do **not** support AVX‑512.  
Intel SDE allows full AVX‑512 simulation anywhere.

### 1. Extract SDE

```sh
tar xf sde-external-*-lin.tar.xz
sudo mv sde-external-*-lin /opt/sde
```

### 2. Run your AVX‑512 program

Force a virtual Skylake‑X CPU:

```sh
/opt/sde/sde64 -skx -avx512 -- ./avx512_addArrays
```

The `--` separator is required.

---

## Memory Alignment Requirements

SIMD loads must be **properly aligned**:

| Instruction | Register | Required Alignment |
|-------------|----------|--------------------|
| `vmovaps xmm` | 128‑bit | 16 bytes |
| `vmovaps ymm` | 256‑bit | 32 bytes |
| `vmovaps zmm` | 512‑bit | **64 bytes** |

Correct C++ declarations:

```cpp
float array1[16] __attribute__((aligned(64)));
float array2[16] __attribute__((aligned(64)));
float dest[16]    __attribute__((aligned(64)));
```

Incorrect alignment will cause Intel SDE to halt with  
*“unaligned memory reference”*.

---

## Assembly Coding Style

All `.S` files use:

```asm
.intel_syntax noprefix
```

Example AVX‑512 block:

```asm
vmovaps zmm0, [rsi]
vmovaps zmm1, [rdx]
vaddps  zmm2, zmm0, zmm1
vmovaps [rdi], zmm2
```

Each file ends with:

```asm
.section .note.GNU-stack,"",@progbits
```

to prevent executable‑stack warnings.

---

## Extending the Project

Ideas for future enhancements:

- Mask registers (`k1`–`k7`) for selective operations
- AVX‑512F tail processing for arbitrary array lengths
- AVX512BW / AVX512DQ examples
- Performance benchmarking using C++ `<chrono>`
- CPU feature detection and automatic fallback (AVX512→AVX2→AVX)

---

## License

MIT License.
