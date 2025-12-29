; Name:         optimizingstep1.asm
;
; 1st optimization step : n = Array length
;
; The bubble sort algorithm can be easily optimized by observing that
; the n-th pass finds the n-th largest element and puts it into its
; final place. So, the inner loop can avoid looking at the last n-1
; items when running for the n-th time.
;
; source: http://en.wikipedia.org/wiki/Bubble_sort#Optimizing_bubble_sort

BubbleSort:
     xor       r8,r8                         ; number of iterations
     xor       r9,r9                         ; number of swaps (informative)
     mov       r10, array.length             ; *** ADDED ***
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
     xor       rax, rbx                      ; then swap both values           
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
     cmp       rcx,r10                       ; if i <= arrayLength-1 *** MODIFIED ***
     jle       .for                          ; next comparison
.until:
     dec       r10                           ; *** ADDED ***
     cmp       rdx,TRUE                      ; if isSwapped == true
     je        .repeat                       ; then repeat sort algorithm
