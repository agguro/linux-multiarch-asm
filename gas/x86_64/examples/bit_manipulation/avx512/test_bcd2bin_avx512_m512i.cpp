#include <immintrin.h>
#include <iostream>
#include <iomanip>
#include <cstring>

extern "C" __m512i bcd2bin_avx512_m512i(const void* src);

/* ------------------------------------------------------------
 * Print 512-bit value as hex (MSB → LSB)
 * ------------------------------------------------------------ */
static void print512(const unsigned char* data) {
    for (int i = 63; i >= 0; --i) {
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
 * Clear BCD buffer
 * ------------------------------------------------------------ */
static void clear_bcd(unsigned char* bcd) {
    std::memset(bcd, 0, 77);
}

/* ------------------------------------------------------------
 * Encode 10^exp into 154-digit LSB-aligned packed BCD
 *
 * digit 0  -> bcd[0] & 0x0F
 * digit 1  -> bcd[0] >> 4
 * digit 2  -> bcd[1] & 0x0F
 * ...
 * digit 153 -> bcd[76] >> 4
 * ------------------------------------------------------------ */
static void set_power10_154(unsigned char* bcd, int exp) {
    // exp must be in [0,153]
    clear_bcd(bcd);

    int digit = exp;           // LSB-aligned!
    int byte   = digit / 2;
    int nibble = digit % 2;

    if (nibble == 0)
        bcd[byte] |= 0x01;     // low nibble
    else
        bcd[byte] |= 0x10;     // high nibble
}

/* ------------------------------------------------------------
 * Set maximum value: 10^154 − 1
 * ------------------------------------------------------------ */
static void set_all_9s_154(unsigned char* bcd) {
    std::memset(bcd, 0x99, 77);
    bcd[76] &= 0x0F;  // top nibble unused
}

/* ------------------------------------------------------------
 * Main test harness
 * ------------------------------------------------------------ */
int main() {
    alignas(64) unsigned char bcd[77];
    alignas(64) unsigned char bin[64];

    struct Test {
        const char* name;
        int power;
        bool all9;
    };

    Test tests[] = {
        { "10^0",    0,   false },
        { "10^16",   16,  false },
        { "10^64",   64,  false },
        { "10^127",  127, false },
        { "10^153",  153, false },
        { "10^154 - 1 (all 9s)", 0, true },
    };

    for (const auto& t : tests) {
        if (t.all9)
            set_all_9s_154(bcd);
        else
            set_power10_154(bcd, t.power);

        __m512i v = bcd2bin_avx512_m512i(bcd);
        _mm512_storeu_si512(bin, v);

        std::cout << "\nTest: " << t.name << "\n";
        std::cout << "Hex (512-bit): 0x";
        print512(bin);
    }

    return 0;
}

