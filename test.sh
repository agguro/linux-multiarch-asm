#!/bin/bash
rm -rf build/
meson setup build
meson compile -C build
meson install -C build
