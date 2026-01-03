/*
* sse_addarrays - Use SSE instructions to add two arrays.
* main.cpp
*/

#include <iostream>

// Updated name
extern "C" void sse_addarrays(float dest[], float arr1[], float arr2[]);

// Aligned to 16-byte boundaries for vmovaps
float array1[4] __attribute__((aligned(16))) = {1.1f, 2.2f, 3.3f, 4.4f};
float array2[4] __attribute__((aligned(16))) = {10.0f, 20.0f, 30.0f, 40.0f};
float dest[4]   __attribute__((aligned(16)));

int main() {
    sse_addarrays(dest, array1, array2);

    std::cout << "SSE Result (4 floats):" << std::endl;
    for (int i = 0; i < 4; i++) {
        std::cout << dest[i] << "\t";
    }
    std::cout << std::endl;

    return 0;
}
