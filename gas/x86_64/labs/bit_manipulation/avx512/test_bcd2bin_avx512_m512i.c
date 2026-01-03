#include <iostream>
#include <iomanip>
#include <vector>
#include <cstring>

// Link the assembly function
extern "C" void bcd2bin_avx512_m512i(const void* src, void* dest);

// Helper to print 512-bit result in Hex
void print512(const unsigned char* data) {
    for (int i = 63; i >= 0; --i) {
        std::cout << std::hex << std::setw(2) << std::setfill('0') << (int)data[i];
        if (i % 8 == 0 && i != 0) std::cout << "_";
    }
    std::cout << std::dec << std::endl;
}

int main() {
    // 1. Prepare BCD Input: Let's set the number to "1" followed by 127 zeros.
    // In packed BCD, this is 0x10 at the highest offset (63) and 0x00 elsewhere.
    alignas(64) unsigned char bcd_input[64];
    std::memset(bcd_input, 0, 64);
    bcd_input[63] = 0x10; 

    // 2. Prepare Binary Output buffer
    alignas(64) unsigned char bin_output[64];
    std::memset(bin_output, 0, 64);

    std::cout << "Starting 512-bit BCD -> Binary Conversion..." << std::endl;

    // 3. Call the assembly Beast
    bcd2bin_avx512_m512i(bcd_input, bin_output);

    // 4. Output results
    std::cout << "BCD Input (High to Low):   0x1000...00" << std::endl;
    std::cout << "Binary Result (Hex 512b): 0x";
    print512(bin_output);

    return 0;
}
