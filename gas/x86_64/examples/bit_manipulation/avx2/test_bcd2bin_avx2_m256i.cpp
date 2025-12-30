#include <immintrin.h>
#include <iostream>
#include <iomanip>
#include <cstring>

extern "C" __m256i bcd2bin_avx2_m256i(const void* src);

/* ------------------------------------------------------------
 * Print 256-bit value as hex (MSB → LSB)
 * ------------------------------------------------------------ */
static void print256(const unsigned char* data) {
    for (int i = 31; i >= 0; --i) {
        std::cout << std::hex
                  << std::setw(2)
                  << std::setfill('0')
                  << (unsigned)data[i];
        if (i % 8 == 0 && i != 0)
            std::cout << "_";
    }
    std::cout << std::dec << "\n";
}

/* ------------------------------------------------------------
 * Clear BCD buffer (39 bytes)
 * ------------------------------------------------------------ */
static void clear_bcd(unsigned char* bcd) {
    std::memset(bcd, 0, 39);
}

/* ------------------------------------------------------------
 * Encode 10^exp into 77-digit LSB-aligned packed BCD
 *
 * digit 0  -> bcd[0] & 0x0F
 * digit 1  -> bcd[0] >> 4
 * ...
 * digit 76 -> bcd[38] >> 4
 * ------------------------------------------------------------ */
static void set_power10_77(unsigned char* bcd, int exp) {
    // exp must be in [0,76]
    clear_bcd(bcd);

    int digit = exp;          // LSB-aligned
    int byte   = digit / 2;
    int nibble = digit % 2;

    if (nibble == 0)
        bcd[byte] |= 0x01;    // low nibble
    else
        bcd[byte] |= 0x10;    // high nibble
}

/* ------------------------------------------------------------
 * Set maximum value: 10^77 − 1
 * ------------------------------------------------------------ */
static void set_all_9s_77(unsigned char* bcd) {
    std::memset(bcd, 0x99, 39);
    bcd[38] &= 0x0F;          // top nibble unused
}

/* ------------------------------------------------------------
 * Main test harness
 * ------------------------------------------------------------ */
int main() {
    alignas(32) unsigned char bcd[39];
    alignas(32) unsigned char bin[32];

    struct Test {
        const char* name;
        int power;
        bool all9;
    };

    Test tests[] = {
        { "10^0",    0,  false },
        { "10^16",   16, false },
        { "10^32",   32, false },
        { "10^64",   64, false },
        { "10^76",   76, false },
        { "10^77 - 1 (all 9s)", 0, true },
    };

    for (const auto& t : tests) {
        if (t.all9)
            set_all_9s_77(bcd);
        else
            set_power10_77(bcd, t.power);

        __m256i v = bcd2bin_avx2_m256i(bcd);
        _mm256_storeu_si256((__m256i*)bin, v);

        std::cout << "\nTest: " << t.name << "\n";
        std::cout << "Hex (256-bit): 0x";
        print256(bin);
    }

    return 0;
}

