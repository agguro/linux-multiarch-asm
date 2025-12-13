// %{Filename}.c main file

#include <stdio.h>

extern void %{CN}(void);

int main()
{
    %{CN}();
    return 0;
}
