test: test.o tolower.o
	ld -melf_x86_64 -o test test.o tolower.o

tolower.o:tolower.asm
	/usr/bin/nasm -felf64 -Fdwarf -o tolower.o tolower.asm

test.o:test.asm
	/usr/bin/nasm -felf64 -Fdwarf -o test.o test.asm

.PHONY: clean
clean:
	rm -f gmon.out test tolower *.o
