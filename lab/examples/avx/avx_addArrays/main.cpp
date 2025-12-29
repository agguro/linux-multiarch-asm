/*
* avx_addArrays - Use AVX instructions to add two arrays.
*
* main.cpp
*
* g++ -g -c -pipe -no-pie -O2 -std=gnu++1z -Wall -Wextra -fPIC -o main.o main.cpp
* nasm -felf64 -g -Fdwarf -o avx_addArrays.o avx_addArrays.asm
* g++ -no-pie -o avx_addArrays main.o avx_addArrays.o
*
* Source: https://www.physicsforums.com/insights/an-intro-to-avx-512-assembly-programming/
*/

#include <iostream>

using std::cout;
using std::endl;

extern "C" void avx_addArrays(float dest[], float arr1[], float arr2[]);

void printArray(float[], int count);

// Data is aligned to 16-byte boundaries
float array1[] __attribute__((aligned(16))) =   // First source array
{
	1, 2, 3, 4
};

float array2[] __attribute__((aligned(16))) =   // Second source array
{
	5, 6, 7, 8
};

float dest[4] __attribute__((aligned(16)));     // Destination arrayµ

int main() {

    avx_addArrays(dest, array1, array2);        // Call the assembly routine
    printArray(dest, 4);
}

void printArray(float arr[], int count)
{
    for (int i = 0; i < count; i++)
    {
        cout << arr[i] << '\t';
    }
    cout << endl;
}
