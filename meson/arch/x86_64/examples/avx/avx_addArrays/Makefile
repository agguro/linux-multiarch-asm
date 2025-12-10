all: main.o avx_addArrays.o
	g++ -no-pie -o avx_addArrays main.o avx_addArrays.o
	strip -s avx_addArrays

debug: main.o avx_addArrays.o
	g++ -no-pie -o avx_addArrays main.o avx_addArrays.o

avx_addArrays.o: avx_addArrays.asm
	nasm -felf64 -g -Fdwarf -o avx_addArrays.o avx_addArrays.asm

main.o: main.cpp
	g++ -g -c -pipe -no-pie -O2 -std=gnu++1z -Wall -Wextra -fPIC -o main.o main.cpp

clean:
	rm -f main.o avx_addArrays.o avx_addArrays
