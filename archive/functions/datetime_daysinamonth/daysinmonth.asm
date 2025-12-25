;name: daysinmonth.asm
;
;build: nasm -felf64 daysinmonth.asm -o daysinmonth.o
;
;description: Allthough easy solvable with a table of monthnumber as index and the days as values,
;             I like demonstrate the calculation of the number of days in a month the binary way
;             using one register only.  My inspiration comes from the book Hacker's Delight.
;             Using vector registers we can put in all months and calculate the days in all months
;             at once.  Therefor this algorithm is nice because it's branch free.
;
;remark: February has in this program always 28 days. Combined with a leapyear you can add one day.
;        I don't have a nice formula for this algorithm, it's merely a trial and error combined with
;        binary logic.  The ame was to create branch free routines without looking up values in a table.
;        Reading the comments in the code must help you further.
;
; The first phase figures out if a month has at least 28 or sure 29 days.  Only february has 28 days.
; We can't just rely on a sudden bit because, when we look at the month values in a cyclic manner, we see
; that december,january and july and august have 31 days. An xor with bit 3 however give the right value
; in bit 0 as indication that a month has one day less or more than it's predecesor.  Adding 28 gives us
; a cycle of 29-28-29-28-29-28-29-29-28-29-28-29.
;
; month         nr     al     ah = al   ah >> 3   ah = ah xor al  ah = ah and 1   ah = ah or 00011100  days
; ----------   ---  --------  --------  --------  --------------  --------------  -------------------  ----
; january       1   00000001  00000001  00000000     00000001       00000001          00011101          29
; february      2   00000010  00000010  00000000     00000010       00000000          00011100          28
; march         3   00000011  00000011  00000000     00000011       00000001          00011101          29
; april         4   00000100  00000100  00000000     00000100       00000000          00011100          28
; may           5   00000101  00000101  00000000     00000101       00000001          00011101          29
; june          6   00000110  00000110  00000000     00000110       00000000          00011100          28
; july          7   00000111  00000111  00000000     00000111       00000001          00011101          29
; august        8   00001000  00001000  00000001     00001001       00000001          00011101          29
; september     9   00001001  00001001  00000001     00001000       00000000          00011100          28
; october      10   00001010  00001010  00000001     00001011       00000001          00011101          29
; november     11   00001011  00001011  00000001     00001010       00000000          00011100          28
; december     12   00001100  00001100  00000001     00001101       00000001          00011101          29
;
; The second phase eliminates the month february which doesn't need two additional days.  Doing so we got for each
; month its number of days in rax in return.
;
; month         nr     al     al = al - 2   al or 0xF0     al - 1   al >> 3    value in ah   al and 2  ah = ah or al  days
; ----------   ---  --------  ------------  -----------   --------  ---------  -----------   --------  -------------  ----
; january       1   00000001    11111111     11111111     11111110  00011111     00011101    00000010    00011111      31
; february      2   00000010    00000000     11110000     11101111  00011101     00011100    00000000    00011100      28
; march         3   00000011    00000001     11110001     11110000  00011110     00011101    00000010    00011111      31
; april         4   00000100    00000010     11110010     11110001  00011110     00011100    00000010    00011110      30
; may           5   00000101    00000011     11110011     11110010  00011110     00011101    00000010    00011111      31
; june          6   00000110    00000100     11110100     11110011  00011110     00011100    00000010    00011110      30
; july          7   00000111    00000101     11110101     11110100  00011110     00011101    00000010    00011111      31
; august        8   00001000    00000110     11110110     11110101  00011110     00011101    00000010    00011111      31
; september     9   00001001    00000111     11110111     11110110  00011110     00011100    00000010    00011110      30
; october      10   00001010    00001000     11111000     11110111  00011110     00011101    00000010    00011111      31
; november     11   00001011    00001001     11111001     11111000  00011111     00011100    00000010    00011110      30
; december     12   00001100    00001010     11111010     11111001  00011111     00011101    00000010    00011111      31

bits 64

section .text

global daysinmonth

daysinmonth:
;calculates the number of days in a month, february counts 28 days.
    ;phase one: figure out if we have more than 28 days
    mov     rax,rdi
    mov     ah,al               ;monthnumber in ah
    shr     ah,3                ;shift bit 3 to position 0 zeroing out all other bits 
    xor     ah,al               ;xor with month number
    and     ah,1                ;mask bit 0 from temp result
    ;we got now 0 or 1 in ah, indicating that a month has 31 or 30 days
    or      ah,28               ;adjust to number of days, ah has 29 or 28
    ;phase two: find out if we need to add two more days or not
    dec     al                  ;decrement month with two
    dec     al
    or      al,0xF0             ;erase lowest nibble
    dec     al                  ;decrement al
    shr     al,3                ;bit 4 of al in postion 0
    and     al,2                ;eliminate all bits except the one on position 1
    or      ah,al               ;or this bit in number of days
    ;ah has now 28,30 or 31 for number of days
    shr     ax,8                ;shift result in al
    ret                         ;return number of days in AL
