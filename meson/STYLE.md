# linux-nasm — Project Style Guide

This document defines the coding style, directory conventions, and general
development rules used throughout the linux-nasm project.  
The guidelines apply to all supported architectures:

- x86_64  
- AArch64  
- RISC-V 64  
- MIPS64  

The purpose of this file is to ensure that the codebase remains clean,
consistent, readable, and easy to maintain, even as multiple architectures
and contributors are involved.

---

# 1. Directory Layout

```
linux-nasm/
  arch/
    x86_64/
      include/        → Architecture-specific headers
      examples/
        basics/
        avx/
        avx2/
        avx512/

    aarch64/
      include/
      examples/

    riscv64/
      include/
      examples/

    mips/
      include/
      examples/

  meson/              → Build configuration fragments
  scripts/            → Helper tools and automation
  tools/              → C/C++ utilities or generators
  docs/               → Optional documentation
```

## Rules
- Architecture-specific code **never leaks** into another architecture’s directory.
- Shared headers should go into a top-level `include/` folder (if applicable).
- Build outputs **must not** be stored inside source directories.

---

# 2. Assembly Style (GAS AT&T Syntax)

All architectures use **GAS (GNU assembler)** with **AT&T syntax**.

This ensures:
- consistency across the entire project  
- compatibility with Meson + GCC/Clang  
- uniformity when switching between architectures  

## 2.1 General AT&T rules
- Registers always begin with `%`  
  Example: `%rax`, `%rdi`, `%xmm0`
- Immediates always begin with `$`  
  Example: `$1`, `$0x20`, `$len`
- Memory addressing uses parentheses  
  Example: `(%rsi)`, `msg(%rip)`
- Instructions are lowercase  
  Example: `mov`, `lea`, `push`, `vaddps`
- Comments use `#`  
  Example: `mov $1, %rdi    # file descriptor`

## 2.2 Labels
- Use lowercase snake_case.
- Labels end with a colon (`:`).
- Local labels (`1:` / `2:` / `1f`) may be used only inside tight loops.

Example:
```asm
loop_start:
    add $1, %rax
    cmp $10, %rax
    jl loop_start
```

---

# 3. Calling Conventions

## 3.1 Linux Syscalls (x86_64)
If syscalls are used, follow the System V ABI:

| Argument | Register |
|----------|----------|
| arg1 | %rdi |
| arg2 | %rsi |
| arg3 | %rdx |
| arg4 | %r10 |
| arg5 | %r8  |
| arg6 | %r9  |

Syscall number goes in `%rax`, and the instruction is:

```asm
syscall
```

**IMPORTANT:**  
All register setup must be done explicitly by the caller (no automatic type-handling macros).

---

# 4. Stack Frames

Use stack frames **only when needed**.

### Do *not* use a stack frame for:

- leaf functions  
- AVX/AVX2/AVX-512 kernels  
- pure register operations  
- trivial syscalls  

### Use a stack frame when:

- local stack storage is required  
- function calls are nested  
- callee-saved registers must be preserved  

Minimal SysV stack frame:

```asm
push %rbp
mov %rsp, %rbp
...
leave
ret
```

---

# 5. Alignment Rules

For performance-sensitive SIMD code:

- Align functions to **32 bytes** minimum  
- Align AVX/AVX2 kernels to **32 or 64 bytes**  
- Align AVX-512 kernels to **64 bytes**

Example:

```asm
.p2align 6      # 64-byte alignment
```

---

# 6. C / C++ Interoperability

When exposing assembly functions to C or C++:

- Export the symbol using `.globl <name>`
- Use the exact same name as in the C prototype
- Follow the System V ABI strictly
- Do not clobber caller-saved registers unless documented
- Preserve callee-saved registers (`rbx`, `rbp`, `r12`–`r15`) when used

Example:

```asm
.globl add_vectors
add_vectors:
    ...
    ret
```

In C++:

```cpp
extern "C" void add_vectors(float* dst, const float* a, const float* b);
```

---

# 7. Meson Build Rules

## 7.1 Build directory naming

Recommended convention:

```
meson setup build_x86_64 --cross-file cross/x86_64.ini
meson compile -C build_x86_64
```

NEVER commit `build_*` directories.

## 7.2 Source grouping
Meson build files inside each architecture should stay minimal:

```
executable('hello', ['hello.S'])
```

Special flags (AVX, AVX2, AVX-512) go into the corresponding `meson.build`.

---

# 8. Formatting Rules

- 4 spaces indentation (no tabs)
- Labels flush left
- Instructions start at column 5
- Comments on the right side when possible

Example:

```asm
_start:
    mov $1, %rdi                # fd
    lea msg(%rip), %rsi         # pointer
    mov $len, %rdx              # length
    syscall
```

---

# 9. Test Logging

Any test output should be written to files named:

```
test.log
tests.log
*.testlog
```

These files are always part of `.gitignore`.

---

# 10. File Naming Conventions

- Assembly files use `.S` if preprocessing is needed, otherwise `.s`
- Directory names follow lowercase snake_case
- Example directories reflect architecture features (`avx`, `avx2`, etc.)

---

# End of STYLE.md

