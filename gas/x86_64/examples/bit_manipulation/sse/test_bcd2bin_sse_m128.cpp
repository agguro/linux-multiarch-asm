#include <immintrin.h>
#include <stdio.h>
#include <string.h>

extern __m128i bcd2bin_sse_m128i(const void*);

static void print128(const unsigned char* x) {
    for (int i = 15; i >= 0; --i) {
        printf("%02x", x[i]);
        if (i % 8 == 0 && i) printf("_");
    }
    puts("");
}

static void set_power10_38(unsigned char* bcd, int exp) {
    memset(bcd, 0, 19);
    int byte = exp >> 1;
    if (exp & 1) bcd[byte] = 0x10;
    else         bcd[byte] = 0x01;
}

static void set_all_9s_38(unsigned char* bcd) {
    memset(bcd, 0x99, 19);
    bcd[18] &= 0x0F;
}

int main() {
    alignas(16) unsigned char bcd[19];
    alignas(16) unsigned char out[16];

    struct {
        const char* name;
        int exp;
        int all9;
    } tests[] = {
        { "10^0",  0, 0 },
        { "10^16", 16, 0 },
        { "10^32", 32, 0 },
        { "10^38 - 1", 0, 1 },
    };

    for (int i = 0; i < 4; i++) {
        if (tests[i].all9)
            set_all_9s_38(bcd);
        else
            set_power10_38(bcd, tests[i].exp);

        __m128i v = bcd2bin_sse2_m128i(bcd);
        _mm_storeu_si128((__m128i*)out, v);

        printf("\nTest: %s\nHex (128-bit): 0x", tests[i].name);
        print128(out);
    }
}

