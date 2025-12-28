# BCD2ASCII-CONV: Vectorized Parallel BCD to ASCII Library
**Version:** 2.6 (2025-12-28)  
**Algorithm:** SWAR (SIMD Within A Register) & Vectorized Unpacking  
**Target Architecture:** x86_64 (NASM) with AVX2/AVX-512 Support

## 📝 Overview
This library provides high-speed conversion of Packed BCD (Binary Coded Decimal) to ASCII character strings. It is designed for maximum throughput by avoiding traditional loops and bit-by-bit processing, instead utilizing **Parallel Spreading** and **SIMD Interleaving**.

---

## 🔍 Technical Audit (Review 2.6)

### 1. Scalar Optimization: SWAR (SIMD Within A Register)
The functions for 16-bit and 32-bit values utilize **SWAR** techniques. 
* **Mechanism:** By shifting and masking entire registers, the code "spreads" 4-bit nibbles into 8-bit byte slots in a single operation.
* **Benefit:** Converts all digits simultaneously. For example, `bcd2ascii_uint32` converts 8 digits in roughly 12 instructions without a single branch or loop.
* **Reversing Signature:** Look for "Spreading Masks" like `0x0f0f0f0f` and "ASCII Bias" additions of `0x30303030`.

### 2. Vector Optimization: Interleaved Unpacking
The 128-bit, 256-bit, and 512-bit functions leverage hardware-level SIMD instructions (`vpunpcklbw` / `vpunpckhbw`).
* **Mechanism:** The algorithm isolates high and low nibbles into separate registers, then uses the CPU's "Unpack" unit to interleave them. This is the hardware-native way to expand 4-bit data into 8-bit data.
* **Benefit:** The 512-bit version converts **128 BCD digits** into an ASCII string in a constant-time execution path.

### 3. Implementation Checklist
| Feature | Status | Notes |
| :--- | :--- | :--- |
| **Branchless** | ✅ Yes | No jump instructions; immune to branch misprediction. |
| **Zero-Loop** | ✅ Yes | Entirely straight-line code. |
| **Parallelism** | ✅ High | Exploits superscalar execution and wide vector lanes. |
| **Memory Policy** | ⚠️ Aligned | Requires destination pointers to be 16/32/64-byte aligned (VMOVDQA). |

---

## 🏗️ Architecture & Logic Flow



### The Spreading Logic (Example: 16-bit)
1. **Input:** `0x1234` (BCD)
2. **Spread:** Bytes are separated into `0x120034`
3. **Isolate:** Nibbles are masked and shifted to `0x01020304`
4. **Bias:** `0x30` is added to every byte simultaneously.
5. **Output:** `0x31323334` (ASCII "1234")

---

## 🛠️ API Usage

### Scalar Calls (Returns result in RAX)
- `uint8_t  bcd2ascii_uint4(uint8_t bcd)`   -> Returns 1 ASCII char
- `uint16_t bcd2ascii_uint8(uint8_t bcd)`   -> Returns 2 ASCII chars
- `uint32_t bcd2ascii_uint16(uint16_t bcd)` -> Returns 4 ASCII chars
- `uint64_t bcd2ascii_uint32(uint32_t bcd)` -> Returns 8 ASCII chars

### Memory-Based Calls (Writes to destination pointers)
- `bcd2ascii_uint64`: Writes 16 bytes to 2 pointers.
- `bcd2ascii__m128i`: Writes 32 bytes to 2 XMM-sized buffers.
- `bcd2ascii__m256i`: Writes 64 bytes to 2 YMM-sized buffers.
- `bcd2ascii__m512i`: Writes 128 bytes to 2 ZMM-sized buffers.

---

## ⚠️ Important Considerations
- **Alignment:** Ensure your output buffers are aligned to the size of the register used (e.g., 64-byte alignment for ZMM). Failure to align will result in a `#GP` exception.
- **Hardware Support:** - `m256` requires **AVX2**.
  - `m512` requires **AVX-512F** and **AVX-512BW**.

---
