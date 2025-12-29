# Assembly Examples & Projects Archive

This repository is an **archive of older, still functional assembly examples and small projects**.
They were originally written using **NASM**, built with **Makefiles**, and linked directly using
`ld`.

While the [code](#contents) remains valid and working, the build system and toolchain reflect practices that
have since evolved.

---

## Purpose of this Archive

- Preserve **working low-level examples** that are still useful for learning and reference
- Document the **evolution of the build system** from traditional Makefiles to Meson
- Provide a **clear migration path** toward more modern tooling
- Keep historical context without freezing development

This archive is not deprecated — it is **actively maintained through modernization**.

---

## Modernization Effort

The ongoing work in this repository focuses on:

- Replacing **Makefiles** with `meson.build`
- Migrating from **NASM** syntax to **GAS** (GNU assembler)
- Improving project structure and reproducibility
- Keeping examples buildable on modern Linux systems
- Maintaining clarity between *original* and *ported* versions

Where possible, the original layout and intent of the examples are preserved.

---

## Structure

Each directory may contain:

- A `README.md` describing the example or project
- A `meson.build` file for Meson-based builds
- Assembly source files (`.s`, `.S`)
- Optional linker scripts or support files

Subdirectories are organized logically by topic or project scope.

---

## Status

- ✅ Original NASM examples: **working**
- 🔄 Porting to GAS: **in progress**
- 🔄 Migration to Meson: **in progress**

Both old and new approaches may coexist during the transition.

---

## Audience

This archive is intended for:

- Developers interested in **low-level programming**
- Students learning **assembly and linking**
- Anyone exploring the **transition from legacy toolchains to modern build systems**
- Personal reference and long-term preservation

---

## Notes

This repository prioritizes **clarity, reproducibility, and technical accuracy** over novelty.
Examples are kept minimal and explicit, even when modern tooling allows for more abstraction.

If you are browsing this archive, consider it both a **toolbox** and a **timeline**.

## Contents

- [includes](includes)
- [functions](functions)
- [projects](projects)
- [examples](examples)
- [todo](todo)
