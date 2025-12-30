/*
* avx2_addarrays - Use AVX2 instructions to add two arrays.
* main.cpp
*/

#include <iostream>
#include <iomanip>

using std::cout;
using std::endl;

// Updated signature: added 'int n' to match our loop-based assembly
extern "C" void avx2_addarrays(float dest[], float arr1[], float arr2[], int n);

void printArray(float[], int count);

// Data is aligned to 32-byte boundaries for AVX
// Note: We use 8 elements to fill exactly one 256-bit YMM register
float array1[] __attribute__((aligned(32))) = { 1.1, 2.2, 3.3, 4.4, 5.5, 6.6, 7.7, 8.8 };
float array2[] __attribute__((aligned(32))) = { 10.0, 20.0, 30.0, 40.0, 50.0, 60.0, 70.0, 80.0 };
float dest[8]  __attribute__((aligned(32)));

int main() {
    // Pass '8' as the fourth argument so the assembly loop knows when to stop
    avx2_addarrays(dest, array1, array2, 8);

    cout << "Resulting Array:" << endl;
    printArray(dest, 8);

    return 0;
}

void printArray(float arr[], int count) {
    for (int i = 0; i < count; i++) {
        cout << std::fixed << std::setprecision(1) << arr[i] << "\t";
    }
    cout << endl;
}
