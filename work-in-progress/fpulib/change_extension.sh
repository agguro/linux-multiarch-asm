#!/bin/sh
## start from directory where fpu.lib reside
## create directories
rm -rf disassembly;
mkdir disassembly;
mkdir disassembly/archive;
mkdir disassembly/objectfiles;
mkdir disassembly/sourcefiles;
## copy static library to archive folder, renaming file to .a
cp fpu.lib disassembly/archive/fpu.a
## disassemble fpu.a
cd disassembly/archive
objdump -D -M intel fpu.a > fpu.disasm
## extract all objectfiles to objectfiles directory
## rename .obj to .o files
cd ../objectfiles/
ar xo ../archive/fpu.a
for file in *.obj;
do
	bfile=$(basename ${file} .obj);
	mv ${file} ${bfile}.o;
done
## create the disassemblies of the .o files in sourcefiles folder
cd ../sourcefiles/
for file in ../objectfiles/*.o;
do
	bfile=$(basename ${file} .o);
	objdump -D -M intel ${file} > ${bfile}.disasm;
done
cd ..
ls -R
