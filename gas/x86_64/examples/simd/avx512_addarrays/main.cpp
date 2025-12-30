/*
* avx512_addarrays - Use AVX2 instructions to add two arrays.
*
* main.cpp
*
* g++ -g -c -pipe -no-pie -O2 -std=gnu++1z -Wall -Wextra -fPIC -o main.o main.cpp
* nasm -felf64 -g -Fdwarf -o avx512_addarrays.o avx512_addarrays.asm
* g++ -no-pie -o avx512_addarrays main.o avx512_addarrays.o
*
* Source: https://www.physicsforums.com/insights/an-intro-to-avx-512-assembly-programming/
* non-supported systems: /opt/sde/sde64 -icl -- ./avx512_addarrays
*/

#include <iostream>

using std::cout;
using std::endl;

extern "C" void avx512_addarrays(float dest[], float arr1[], float arr2[]);

// Mandatory: 16 items and 64-byte alignment
float array1[16] __attribute__((aligned(64))) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
float array2[16] __attribute__((aligned(64))) = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
float dest[16]   __attribute__((aligned(64)));

void printArray(float arr[], int count)
{
    for (int i = 0; i < count; i++)
    {
        cout << arr[i] << '\t';
    }
    cout << endl;
}

int main() {
    // Call with 3 arguments only
    avx512_addarrays(dest, array1, array2);
    
    // Print the 16 results
    for(int i=0; i<16; i++) std::cout << dest[i] << " ";
    std::cout << std::endl;
    
    return 0;
}

