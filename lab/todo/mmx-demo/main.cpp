#include <iostream>
#include <mmintrin.h>

//using namespace std;

int main()
{
    __m64 a,b,c;
    a = _mm_set1_pi16(9);
    b = _mm_set1_pi16(1);
    c = _mm_add_pi16(a, b);
    std::ios_base::fmtflags f( std::cout.flags() );  // save flags state
    std::cout << std::hex << (long long)(a) << std::endl;
    std::cout << std::hex << (long long)(b) << std::endl;
    std::cout << std::hex << (long long)(c) << std::endl;
    a[0] = 0x0A090B08;
    a[1] = 0x0C070D06;
    a = _mm_set_pi8('0','1','2','3','4','5','6','7');
    b = _mm_set_pi8('8','9','A','B','C','D','E','F');
    c = _mm_set_pi8('0','0','0','0','0','0','0','0');
    std::cout << std::hex << (long long)(a) << (long long)(b) << std::endl;
    std::cout << std::hex << (long long)(c) << std::endl;
    a = _mm_sub_pi8(a,c);
    b = _mm_sub_pi8(c,c);
    std::cout << std::hex << (long long)(_mm_cmpeq_pi8(a,b)) << std::endl;

    std::cout << std::hex << (long long)(a) << (long long)(b) << std::endl;

    int src = 1;
    int dst;

    asm ("mov %1, %0\n\t"
        "add $11, %0"
        : "=r" (dst)
        : "r" (src));

    std::cout << std::dec << dst << std::endl;
    std::cout << std::hex << dst << std::endl;

    std::cout.flags( f );  // restore flags state

    return 0;
}
