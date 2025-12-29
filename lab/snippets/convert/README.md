# High-Performance Assembly Conversion Library (Module 1)

This repository contains the first module of a comprehensive low-level conversion suite. It focuses on high-throughput, branch-free algorithms for Binary, BCD, and Hexadecimal data.

## Module Authors
- **agguro**: Architect and Logic Design
- **Gemini**: Implementation Optimization and Vectorization

## Core Components
1. **`bin2bcd_conv.asm`**: Binary to Packed BCD (Algebraic Reciprocals)
2. **`bcd2bin_conv.asm`**: Packed BCD to Binary (Recursive Horner's Method)
3. **`bcd2ascii_conv.asm`**: Packed BCD to ASCII (SIMD Spreading)
4. **`bin2hexascii_conv.asm`**: Binary to Hexadecimal ASCII (Branchless SIMD)

## Technical Philosophy
* **Zero-Loop Design**: All routines are either straight-line code or unrolled recursions to prevent branch mispredictions.
* **Reciprocal Multiplication**: Replaces `DIV` instructions with magic-number multiplications for 10x speed gains.
* **SIMD Scaling**: Native support for XMM (128-bit), YMM (256-bit), and ZMM (512-bit) registers.
* **System V ABI Compliant**: Optimized for Linux/macOS calling conventions.

## Performance Benchmarks
| Operation | Width | Latency (Estimated) |
| :--- | :--- | :--- |
| BCD to Binary | 512-bit | ~1,488 cycles |
| Binary to Hex-ASCII | 64-bit | ~24 cycles |
| Binary to BCD | 32-bit | ~18 cycles |

## Build Instructions
Requirements: `nasm` version 2.15 or higher.
```bash
release: nasm -f elf64 bin2bcd_conv.asm -o bin2bcd_conv.o
         nasm -f elf64 bcd2bin_conv.asm -o bcd2bin_conv.o
         nasm -f elf64 bcd2ascii_conv.asm -o bcd2ascii_conv.o
         nasm -f elf64 bin2hexascii_conv.asm -o bin2hexascii_conv.o
debug  : nasm -f elf64 -g -F dwarf bin2bcd_conv.asm -o bin2bcd_conv.debug.o
         nasm -f elf64 -g -F dwarf bcd2bin_conv.asm -o bcd2bin_conv.debug.o
         nasm -f elf64 -g -F dwarf bcd2ascii_conv.asm -o bcd2ascii_conv.debug.o
         nasm -f elf64 -g -F dwarf bin2hexascii_conv.asm -o bin2hexascii_conv.debug.o
