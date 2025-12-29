; Name:         optimizingstep0.asm
;
; The non-optimized bubblesort algorithm
;
; source: http://en.wikipedia.org/wiki/Bubble_sort

BubbleSort:
     xor       r8,r8                         ; number of iterations
     xor       r9,r9                         ; number of swaps
.repeat:      
     mov       rdx, FALSE                    ; isSwapped = false
     mov       rcx,1                         ; i = 1
     mov       rsi,array                     ; point to start of the array      
.for:
     lodsq                                   ; RBX = array[i]
     mov       rbx, rax
     lodsq                                   ; RAX = array[i+1]
     cmp       rax, rbx                      ; if array[i+1] >= array[i]
     jge       .next
     xor       rax, rbx                      ; if less then swap both values           
     xor       rbx, rax
     xor       rax, rbx
     mov       qword [rsi-datasize*2], rbx   ; and store swapped values in array
     mov       qword [rsi-datasize], rax
     mov       rdx,TRUE                      ; isSwapped = true
     inc       r9                            ; increment number of swaps
.next:
     inc       r8                            ; increment number of iterations
     sub       rsi,datasize                  ; adjust pointer in array      
     inc       rcx                           ; i++
     cmp       rcx,array.length-1            ; if i <= arrayLength-1
     jle       .for                          ; next comparison
.until:
     cmp       rdx,TRUE                      ; if isSwapped == true
     je        .repeat                       ; then repeat sort algorithm
