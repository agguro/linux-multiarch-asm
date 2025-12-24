# THIS REPO ISN4T COMPLETE YET....
when this line is removed it will be useable

# linux-multiarch-asm

Linux-focused, multi-architecture assembly programming examples and low-level experiments.

This repository is a long-running, evolving collection of assembly-related projects,
build experiments, and support files, focused on **Linux** and **multiple CPU architectures**
(x86_64, MIPS, AArch64, and others over time).

The emphasis is on understanding how things work at a low level rather than on
any single assembler, toolchain, or build system.

---

## Project scope

- Linux-only focus
- Multiple architectures (multi-arch)
- Assembly-first, but not assembler-locked
- Educational, experimental, and exploratory in nature

This is **not** a polished framework or SDK, but a working lab and reference
that grows as the I learn and experiment.

---

## Assemblers and toolchains

Historically, much of this repository was based on **NASM**.
Over time, the focus is shifting towards:

- GNU assembler (GAS)
- mixed GCC + GAS projects
- raw GAS where appropriate
- architecture-native toolchains

NASM is **being phased out**.
Existing NASM-based material will be **archived rather than removed**, as it still
has historical and educational value. I 've learned a lot using NASM.
The exact archiving strategy is still evolving.

---

## Build systems

Various build systems are (or have been) explored in this repository:

- native Makefiles
- CMake (work in progress)
- Autotools (experimental / legacy)
- QMake (historical experiments)

Support for building directly from a single source directory is an ongoing goal,
but not guaranteed for all subprojects.

---

## Debugging

The repository references **EDB Debugger** as a practical debugger for assembly work:

- https://github.com/eteran/edb-debugger
- cross-platform according to its maintainers
- useful for visual inspection and learning

In the longer term, the intention is to move towards **GDB-based workflows**.
GDB is powerful but has a steep learning curve; deeper GDB usage will be introduced
incrementally as understanding improves.

---

## Graphics and UI experiments

Earlier GTK-based examples have been removed from the current tree.

GTK and graphical work will return later in:
- mixed GCC + GAS projects
- and eventually raw GAS projects

Those experiments are intentionally postponed until the low-level foundations
are more solid.

---

## Examples and structure

The repository contains:
- small focused examples (e.g. `hello` programs)
- architecture-specific directories
- build-system-specific experiments
- legacy material kept for reference

Not all files or directories represent “best practice” — some exist purely to
document what was tried, what worked, and what did not.

---

## Notes and warnings

- Not all examples are tested on all architectures
- Some code reflects intermediate learning stages
- Expect inconsistencies while the project continues to evolve

If you are looking for a clean, minimal reference, treat this repository as a
**toolbox and lab**, not as a finished manual.

---

## Philosophy

> Learn the system by touching it.  
> Keep history visible.  
> Archive instead of erase.

Mistakes, rewrites, and course corrections are part of the project by design.

---


