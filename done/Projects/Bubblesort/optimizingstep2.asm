; Name:         optimizingstep2.asm
;
; 2nd optimization step : no check after last swap
; 
; it can happen that more than one element is placed in their final position
; on a single pass. In particular, after every pass, all elements after the
; last swap are sorted, and do not need to be checked again. This allows us to
; skip over a lot of the elements, resulting in about a worst case 50% improvement
; in comparison count (though no improvement in swap counts), and adds very little
; complexity because the new code subsumes the "swapped" variable.
;
; source: http://en.wikipedia.org/wiki/Bubble_sort#Optimizing_bubble_sort

BubbleSort:
     xor       r8,r8                         ; number of iterations
     xor       r9,r9                         ; number of swaps (informative)
     mov       r10, array.length             ; r10 = n = arrayLength
.repeat:
     mov       r11, 0                        ; r11 = newn = 0     ADDED
     mov       rcx,1                         ; i = 1
     mov       rsi,array                     ; point to start of the array      
.for:
     lodsq                                   ; RBX = array[i]
     mov       rbx, rax
     lodsq                                   ; RAX = array[i+1]
     cmp       rax, rbx                      ; if array[i+1] >= array[i]
     jge       .next
     xor       rax, rbx                      ; then swap both values           
     xor       rbx, rax
     xor       rax, rbx
     mov       r11, rcx                      ; newn = i    ADDED
     mov       qword [rsi-datasize*2], rbx   ; and store swapped values in array
     mov       qword [rsi-datasize], rax
     inc       r9                            ; increment number of swaps
.next:
     inc       r8                            ; increment number of iterations
     sub       rsi,datasize                  ; adjust pointer in array
     inc       rcx                           ; i++
     cmp       rcx, r10                      ; if i <= arrayLength-1
     jle       .for
     mov       r10, r11                      ; n = newn   ADDED
.until:
     dec       r10
     cmp       r10, 0                        ; if r10 > 0
     jg        .repeat                       ; then repeat sort algorithm
