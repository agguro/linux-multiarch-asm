/* arch/x86_64/examples/avx/avx2_addArrays/main.cpp */

/*
* avx2_addArrays - Use AVX2 instructions to add two arrays.
*
* Source: https://www.physicsforums.com/insights/an-intro-to-avx-512-assembly-programming/
*/

#include <iostream>

using std::cout;
using std::endl;

extern "C" void avx2_addArrays(float dest[], float arr1[], float arr2[]);

void printArray(float[], int count);

// Data is aligned to 32-byte boundaries
float array1[] __attribute__((aligned(32))) =   // First source array
{
    1, 2, 3, 4, 5, 6, 7, 8
};

float array2[] __attribute__((aligned(32))) =   // Second source array
{
    1, 2, 3, 4, 5, 6, 7, 8
};

float dest[8] __attribute__((aligned(32)));     // Destination arrayµ

int main() {

    avx2_addArrays(dest, array1, array2);       // Call the assembly routine
    printArray(dest, 8);
}

void printArray(float arr[], int count)
{
    for (int i = 0; i < count; i++)
    {
        cout << arr[i] << '\t';
    }
    cout << endl;
}
