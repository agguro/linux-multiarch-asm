all: main.o avx2_addArrays.o
	g++ -no-pie -o avx2_addArrays main.o avx2_addArrays.o
	strip -s avx2_addArrays

debug: main.o avx2_addArrays.o
	g++ -no-pie -o avx2_addArrays main.o avx2_addArrays.o

avx2_addArrays.o: avx2_addArrays.asm
	nasm -felf64 -g -Fdwarf -o avx2_addArrays.o avx2_addArrays.asm

main.o: main.cpp
	g++ -g -c -pipe -no-pie -O2 -std=gnu++1z -Wall -Wextra -fPIC -o main.o main.cpp

clean:
	rm -f main.o avx2_addArrays.o avx2_addArrays
