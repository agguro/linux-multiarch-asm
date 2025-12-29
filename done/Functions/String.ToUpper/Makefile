test: test.o toupper.o
	ld -melf_x86_64 -o test test.o toupper.o

toupper.o:toupper.asm
	/usr/bin/nasm -felf64 -Fdwarf -o toupper.o toupper.asm

test.o:test.asm
	/usr/bin/nasm -felf64 -Fdwarf -o test.o test.asm

.PHONY: clean
clean:
	rm -f gmon.out test toupper *.o

