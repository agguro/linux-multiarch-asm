/* arch/x86_64/examples/avx/avx512_addArrays/main.cpp */

/*
 * AVX-512 test – add two arrays using zmm registers
 *
 ** Source: https://www.physicsforums.com/insights/an-intro-to-avx-512-assembly-programming/
 */

#include <iostream>
using std::cout;
using std::endl;

extern "C" void avx512_addArrays(float dest[], float arr1[], float arr2[]);

void printArray(float[], int);

// Must be 64-byte aligned for AVX-512 zmm loads
float array1[16] __attribute__((aligned(64))) =
{
    1,2,3,4,5,6,7,8,
    1,2,3,4,5,6,7,8
};

float array2[16] __attribute__((aligned(64))) =
{
    1,2,3,4,5,6,7,8,
    1,2,3,4,5,6,7,8
};

float dest[16] __attribute__((aligned(64)));

int main()
{
    avx512_addArrays(dest, array1, array2);

    printArray(dest, 16); // print 16 results (512 bits)
}

void printArray(float arr[], int count)
{
    for (int i = 0; i < count; i++)
    {
        cout << arr[i] << '\t';
    }
    cout << endl;
}

