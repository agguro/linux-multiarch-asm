// %{Filename}.c main file

#include <stdio.h>

extern "C" void %{CN}(void);

int main()
{
    %{CN}();
    return 0;
}
