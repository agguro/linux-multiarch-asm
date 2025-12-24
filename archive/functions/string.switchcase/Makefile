test: test.o switchcase.o
	ld -melf_x86_64 -o test test.o switchcase.o

switchcase.o:switchcase.asm
	/usr/bin/nasm -felf64 -Fdwarf -o switchcase.o switchcase.asm

test.o:test.asm
	/usr/bin/nasm -felf64 -Fdwarf -o test.o test.asm

.PHONY: clean
clean:
	rm -f gmon.out test switchcase *.o
