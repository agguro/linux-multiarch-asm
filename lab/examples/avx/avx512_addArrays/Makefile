all : main.o avx512_addArrays.o
	g++ -mavx -no-pie -o avx512_addArrays main.o avx512_addArrays.o
	strip -s avx512_addArrays

debug: main.o avx512_addArrays.o
	g++ -no-pie -o avx512_addArrays main.o avx512_addArrays.o

avx512_addArrays.o : avx512_addArrays.asm
	nasm -felf64 -g -Fdwarf -o avx512_addArrays.o avx512_addArrays.asm

main.o: main.cpp	
	g++ -mavx -g -c -pipe -no-pie -O2 -std=gnu++1z -Wall -Wextra -fPIC -o main.o main.cpp

clean:
	rm -f main.o avx512_addArrays.o avx512_addArrays
