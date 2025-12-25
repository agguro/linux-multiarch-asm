;name: nibblebcd2bin.asm
;
;description:  nibblebcd2bin: packed bcd nibble to binary conversion.
;
;use:
;packed bcd:   mov      rdi,packedbcd
;              call     nibblebcd2bin
;
;algorithm:
;The algorithm to convert from bcd to binary is quite easy and looks similar to
;the convertion from binary to bcd.  Now we shift the least significant bit to the right
;and start the convertion from bit 1.  Subsequent we compare each group of 3 bits with 100b
;if bigger than 100b then we subtract 011b from it.  Once processed all bitgroups, we shift
;again one bit to the right and start again until the last 3 bits remains.  The result is the
;last three bits followed by the bits shifted to the right.
;
;Doing the method above on 64 bits means that we have to loop at most 16 times to check all
;nibbles of a qword.  Combined with the number of bits we need to shift right and repeat the
;algorithm takes a lot of loops.  This can be done otherwise.
;
;The biggest value that a nibble can take is 1100b. (99 = 10011001, shifted right one place gives
;1001100 1, the last nibble here is 1100b.)  Because we need to check if a nibble is bigger than 4
;(0100b) we see when we write them all down and add 3 to it, bit 3 will be set when the value
;is bigger than 0100b (4)
;        0000b  0001b  0010b  0011b  0100b  0101b  0110b  0111b  1000b  1001b  1010b  1011b  1100b
;add 3 : 0011b  0100b  0101b  0110b  0111b  1000b  1001b  1010b  1011b  1100b  1101b  1110b  1111b
;without the risk that the result overflows and change the entire value.
;If we mask off bit 0, 1 and 2 then
;mask 1000b : 0000b  0000b  0000b  0000b  0000b  1000b  1000b  1000b  1000b  1000b  1000b  1000b  1000b
;successively shift 2 right, subtract from original value, shift 1 right and subtract from original value,
;we only subtract 3 from the nibbles bigger than 0100b.
;             0000b  0001b  0010b  0011b  0100b  0101b  0110b  0111b  1000b  1001b  1010b  1011b  1100b
;add 3      : 0011b  0100b  0101b  0110b  0111b  1000b  1001b  1010b  1011b  1100b  1101b  1110b  1111b
;mask 1000b : 0000b  0000b  0000b  0000b  0000b  1000b  1000b  1000b  1000b  1000b  1000b  1000b  1000b
;>> 2       : 0000b  0000b  0000b  0000b  0000b  0010b  0010b  0010b  0010b  0010b  0010b  0010b  0010b
;subtract:  : 0000b  0001b  0010b  0011b  0100b  0011b  0100b  0101b  0110b  0111b  1000b  1001b  1010b
;>> 1       : 0000b  0000b  0000b  0000b  0000b  0001b  0001b  0001b  0001b  0001b  0001b  0001b  0001b
;subtract:  : 0000b  0001b  0010b  0011b  0100b  0010b  0011b  0100b  0101b  0110b  0111b  1000b  1001b
;
;to just convert a nibble it's a longer algorith than just compare and subtract, but for longer nibble
;sequences we can expand this method for bytes, words, dwords, qwords, dqwords .... even for SSE and AVX.
;
;build: nasm -felf64 nibblebcd2bin.asm -o nibblebcd2bin.o

bits 64

global nibblebcd2bin

section .text

nibblebcd2bin:
    ;convert packed bcd in AL to binary in AL.
    mov     rax,rdi             ;value in RAX
    and     al,0x0F             ;only lower nibble count
    mov     ah,al               ;nibble in AH
    add     ah,3                ;add 3
    and     ah,0x08             ;mask off bit 0,1 and 2
    shr     ah,2                ;divide by 4, giving 0 or 2                        
    sub     al,ah               ;subtract from AL
    ror     ah,1                ;divide by 2, giving 0 or 1
    sub     al,ah               ;subtract from AL
    xor     ah,ah               ;make AH zero
    ret
