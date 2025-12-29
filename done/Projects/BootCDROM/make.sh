#!/bin/bash

echo "Removing earlier files"
rm -rfv cdrom/*
rm -fv bootcat/bootcat
rm -fv bootloader/bootloader
rm -fv kernel/kernel.bin
rm -fv shell/shell.bin

echo "Assembling..."
mkdir cdrom
cd bootcat/ && make && cd ..
cd bootloader/ && make && cd ..
cd kernel/ && make && cd ..
cd shell/ && make && cd ..

echo "Copying..."
cp -v bootcat/bootcat cdrom/
cp -v bootloader/bootloader cdrom/
cp -v kernel/kernel.bin cdrom/
cp -v shell/shell.bin cdrom/

echo "Run demo..."
mkisofs -V "AGGURO" -R -J -c bootcat -b bootloader -no-emul-boot -boot-load-size 4 -o cd.iso cdrom/
qemu-system-x86_64 -boot d -cdrom cd.iso -vga cirrus -m 512

echo "Done."

### for flashing usb media
### sudo dd bs=4M if=cd.iso of=/dev/sdg && sync
