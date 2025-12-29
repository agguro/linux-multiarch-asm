#include <stdio.h>
#include <stdint.h>
#include <string.h>

// Define 512-bit structure for clarity
typedef struct {
    uint64_t q[8]; // 8 * 64 bits = 512 bits
} bcd512_t;

// Assembly Function Prototypes
extern "C" {
    void bcd2ascii_m128i(const void* src, char* dest);
    void bcd2ascii_m256i(const void* src, char* dest);
    void bcd2ascii_m512i(const void* src, char* dest);
}

int main() {
    // 1. Prepare 512-bit Test Data (0x1234...90)
    // We fill it so each 128-bit chunk is recognizable
    bcd512_t data;
    data.q[0] = 0x1111222233334444; // Low 128-bit chunk (Part A)
    data.q[1] = 0x5555666677778888; // Low 128-bit chunk (Part B)
    
    data.q[2] = 0x9999000011112222; // Second 128-bit chunk
    data.q[3] = 0x3333444455556666;
    
    data.q[4] = 0x7777888899990000; // Third 128-bit chunk
    data.q[5] = 0x1212343456567878;
    
    data.q[6] = 0x9090121234345656; // Fourth 128-bit chunk
    data.q[7] = 0x7878909012123434;

    // 2. Prepare Output Buffer
    // 512 bits = 128 BCD digits. +1 for null terminator.
    char result[129]; 
    memset(result, 0, sizeof(result));

    printf("--- 512-BIT BCD2ASCII TEST ---\n");

    // 3. Call the Assembly Procedure
    bcd2ascii_m512i(&data, result);

    // 4. Print Result
    // We print the string. If it's 128 chars, it's correct.
    printf("Output String (128 chars):\n\"%s\"\n", result);

    // Verify length
    if (strlen(result) == 128) {
        printf("\nSUCCESS: String length is exactly 128 characters.\n");
    } else {
        printf("\nERROR: Expected 128 chars, got %zu\n", strlen(result));
    }

    return 0;
}
