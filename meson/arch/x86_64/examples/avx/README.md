<p align="center">
  <img src="agguro-bol.png" alt="Project Logo" width="180">
</p>

<h1 align="center">High-Performance SIMD Array Addition  
<sub>AVX • AVX2 • AVX-512</sub></h1>

<p align="center">
  <img src="https://img.shields.io/badge/license-MIT-green.svg">
  <img src="https://img.shields.io/badge/platform-x86__64-blue.svg">
  <img src="https://img.shields.io/badge/SIMD-AVX%20%7C%20AVX2%20%7C%20AVX512-orange">
  <img src="https://img.shields.io/badge/build-Meson%20%2F%20Ninja-lightgrey">
</p>

---

## 📘 Overview

This repository implements **hand-optimized x86-64 assembly** to add two floating-point arrays using:

- **AVX** (128-bit xmm registers)
- **AVX2** (256-bit ymm registers)
- **AVX-512** (512-bit zmm registers)

Each SIMD backend is written in GNU assembler (`.S`, Intel syntax), tested through a shared C++ driver, and built using Meson.

---

## 📂 Directory Structure

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

## ⚙️ Requirements

### Build Tools

- GCC or Clang
- GNU assembler (`as`)
- Meson
- Ninja

Install on Debian/Ubuntu:

```sh
sudo apt install g++ meson ninja-build
```

### Optional (recommended for AVX-512)

- **Intel SDE** — needed to run AVX-512 code on CPUs without hardware support  
  https://www.intel.com/content/www/us/en/developer/articles/tool/software-development-emulator.html

---

## 🏗️ Building

### Configure Meson

```sh
meson setup builddir
```

### Build all SIMD executables

```sh
meson compile -C builddir
```

---

## ▶️ Running the SIMD Binaries

Example:

```sh
./builddir/arch/x86_64/avx/avx_addArrays
./builddir/arch/x86_64/avx2/avx2_addArrays
./builddir/arch/x86_64/avx512/avx512_addArrays
```

Each executable prints the resulting array.

---

## 🧪 Running AVX-512 with Intel SDE

On most CPUs (including many modern laptops), AVX-512 is not available.  
Intel SDE provides full software emulation.

### 1. Extract SDE

```sh
tar xf sde-external-*-lin.tar.xz
sudo mv sde-external-*-lin /opt/sde
```

### 2. Run AVX-512 program under a virtual Skylake-X CPU:

```sh
/opt/sde/sde64 -skx -avx512 -- ./avx512_addArrays
```

The `--` separator is mandatory.

---

## 🧩 Memory Alignment Requirements

SIMD loads must be aligned:

| Instruction | Register Width | Required Alignment |
|-------------|----------------|--------------------|
| `vmovaps xmm` | 128-bit | 16 bytes |
| `vmovaps ymm` | 256-bit | 32 bytes |
| `vmovaps zmm` | 512-bit | **64 bytes** |

Correct aligned arrays in C++:

```cpp
float array1[16] __attribute__((aligned(64)));
float array2[16] __attribute__((aligned(64)));
float dest[16]    __attribute__((aligned(64)));
```

Misalignment triggers Intel SDE errors such as:

```
unaligned memory reference
```

---

## 🛠️ Assembly Coding Style

All `.S` files use Intel syntax:

```asm
.intel_syntax noprefix
```

Example AVX-512 block:

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

to avoid executable-stack warnings.

---

## 🚀 Extending the Project

Possible future improvements:

- Mask registers (`k0–k7`)
- Tail handling for non-multiple-of-16 array lengths
- VNNI / VBMI / IFMA examples
- Performance benchmarking (C++ `<chrono>`)
- CPU feature detection and fallback paths (AVX-512 → AVX2 → AVX)

---

## 📜 License

MIT License.

---

### ❤️ Acknowledgement

This project represents significant work, experimentation, and refinement.  
It serves as a solid foundation for deeper exploration into SIMD and high-performance computing.
