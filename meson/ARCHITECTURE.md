# linux-nasm — Architecture Overview

This document describes how the linux-nasm project supports multiple CPU
architectures, how the source tree is organised, and which Application
Binary Interfaces (ABIs), calling conventions, and syscall mechanisms
apply to each target.

The goal is to keep the architecture-specific parts well isolated, while
maintaining a unified coding style and developer experience across all
architectures.

---

# 1. Supported Architectures

The project currently supports:

- **x86_64** (AMD64, System V ABI, Linux)
- **AArch64** (ARMv8-A 64-bit)
- **RISC-V RV64GC**
- **MIPS64 (little-endian)**

Each architecture has its own directory under `arch/`, containing:

```
arch/<arch>/include/     → architecture-specific headers
arch/<arch>/examples/    → example programs
arch/<arch>/meson.build  → per-architecture build rules
```

Architecture code **never overlaps**; cross-architecture files live only
in the root or in `include/`.

---

# 2. High-Level Build Flow

The project uses **Meson + Ninja** as build system.

Per architecture, a dedicated build directory is recommended:

```
meson setup build_x86_64
meson setup build_aarch64 --cross-file cross/aarch64.ini
meson setup build_riscv64 --cross-file cross/riscv64.ini
meson setup build_mips64  --cross-file cross/mips64.ini
```

All build outputs inside `build_*` are excluded from Git.

Each architecture has its own Meson rules, flags, and optional optimizations
(e.g., AVX, AVX2, AVX-512, NEON, or RISC-V V-extension).

---

# 3. Calling Conventions Per Architecture

The project follows the official Linux ABIs for each target.

---

## 3.1 x86_64 — System V ABI

### Register usage
| Purpose         | Register                          |
|-----------------|-----------------------------------|
| arg1            | %rdi                              |
| arg2            | %rsi                              |
| arg3            | %rdx                              |
| arg4            | %r10                              |
| arg5            | %r8                               |
| arg6            | %r9                               |
| return value    | %rax                              |
| syscall number  | %rax                              |
| scratch regs    | %rax %rcx %rdx %rsi %rdi %r8–%r11 |
| callee-saved    | %rbx %rbp %r12–%r15               |

### Syscall mechanism

```
mov $__NR_<name>, %rax
syscall
```

The caller is responsible for placing arguments in the appropriate registers.

---

## 3.2 AArch64 — AAPCS64 ABI

### Register usage

| Purpose         | Register |
|-----------------|----------|
| arg1–arg8       | x0–x7    |
| return value    | x0       |
| syscall number  | x8       |
| scratch regs    | x0–x15   |
| callee-saved    | x19–x28  |

### Syscall mechanism

```
mov x8, #<syscall number>
svc #0
```

### PC-relative addressing

Use:

```
adrp x0, label
add  x0, x0, :lo12:label
```

---

## 3.3 RISC-V RV64GC — Linux ABI

### Register usage

| Purpose         | Register |
|-----------------|----------|
| arg1–arg8       | a0–a7    |
| return value    | a0       |
| syscall number  | a7       |
| scratch regs    | t0–t6    |
| callee-saved    | s0–s11   |

### Syscall mechanism

```
li a7, <syscall number>
ecall
```

### Addressing

Use `la` for label addresses:

```
la a0, label
```

---

## 3.4 MIPS64 — Linux N64 ABI (little-endian)

### Register usage

| Purpose         | Register |
|-----------------|----------|
| arg1–arg4       | a0–a3    |
| arg5–arg8       | a4–a7    |
| return value    | v0       |
| syscall number  | v0       | 
| scratch regs    | t0–t9    |
| callee-saved    | s0–s7    |

### Syscall mechanism

```
li $v0, <syscall number>
syscall
```

### Addressing

```
la $a0, label
```

---

# 4. Source File Types

The project uses:

- `.s` — plain assembly files (no preprocessing)
- `.S` — preprocessed assembly (for macros, includes, constants, etc.)
- `.h` — architecture-specific headers in `include/`
- `.c` / `.cpp` — helper tools or test harnesses

Preprocessed `.S` files are used only when necessary.

---

# 5. SIMD and Vector Extensions

Different architectures support different SIMD instruction sets.

### x86_64
- SSE / SSE2 (baseline)
- AVX / AVX2
- AVX-512F + subsets

Examples are located in:

```
arch/x86_64/examples/avx/
arch/x86_64/examples/avx2/
arch/x86_64/examples/avx512/
```

### AArch64
- NEON is baseline and always available.
- SVE and SVE2 are optional (not yet used by project).

### RISC-V
- Vector Extension (RVV) is optional.
- Currently the project does not yet provide RVV examples.

### MIPS
- MSA is optional (not currently used).

SIMD kernels should follow the alignment and ABI rules defined in `STYLE.md`.

---

# 6. Alignment Requirements

For performance-sensitive code:

| Architecture    | Recommended alignment             |
|-----------------|-----------------------------------|
| x86_64 AVX/AVX2 | 32 bytes                          |
| x86_64 AVX-512  | 64 bytes                          |
| AArch64 NEON    | 16 bytes                          |
| RISC-V RVV      | varies (implementation-dependent) |
| MIPS            | 16 bytes                          |

Example:

```
.p2align 6    # 64-byte alignment (x86_64 AVX-512)
```

---

# 7. Error Handling and Syscalls

All syscall-related work must follow these rules:

- The caller sets registers explicitly.
- The assembly does not hide register manipulations behind complex macros.
- Functions intended for C/C++ interoperability return error codes in the
  platform’s standard register (x86_64: `%rax`, AArch64: `x0`, etc.).

---

# 8. Cross-Compilation

Cross files are located in:

```
cross/aarch64.ini
cross/riscv64.ini
cross/mips64.ini
```

Each file defines:

- toolchain binaries
- CPU family
- endianness
- system root (if required)
- compiler flags for the specific architecture

Example workflow:

```
meson setup build_riscv64 --cross-file cross/riscv64.ini
meson compile -C build_riscv64
```

---

# 9. Interoperability Across Architectures

Each architecture must implement its examples in a comparable way:

- `hello.s` or `hello.S`
- consistent directory hierarchy
- same functional behavior
- same build invocation pattern

This ensures that examples across architectures remain easy to compare and understand.

---

# 10. Extending the Project

When adding a new architecture:

1. Create `arch/<newarch>/include/`
2. Create `arch/<newarch>/examples/`
3. Add `arch/<newarch>/meson.build`
4. Add cross file (if not native)
5. Follow `STYLE.md` for uniform formatting
6. Update this document with ABI and syscall details

---

# End of ARCHITECTURE.md

