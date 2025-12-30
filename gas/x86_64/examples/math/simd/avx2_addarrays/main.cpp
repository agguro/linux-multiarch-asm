/*
* avx2_addarrays - Use AVX2 instructions to add two arrays.
* main.cpp
*/

#include <iostream>
#include <iomanip>

using std::cout;
using std::endl;

// Updated signature: added 'int n' to match our loop-based assembly
extern "C" void avx2_addarrays(float dest[], float arr1[], float arr2[]);

// Data aligned to 32-byte boundaries (standard for AVX2)
float array1[8] __attribute__((aligned(32))) = {1.8, 2.7, 3.6, 4.5, 5.4, 6.3, 7.2, 8.1};
float array2[8] __attribute__((aligned(32))) = {8.2, 7.3, 6.4, 5.5, 4.6, 3.7, 2.8, 1.9};
float dest[8]   __attribute__((aligned(32)));



void printArray(float arr[], int count) {
    for (int i = 0; i < count; i++) {
        cout << std::fixed << std::setprecision(1) << arr[i] << "\t";
    }
    cout << endl;
}

int main() {
    avx2_addarrays(dest, array1, array2);

    for (int i = 0; i < 8; i++) {
        std::cout << dest[i] << "\t";
    }
    std::cout << std::endl;

    return 0;
}
