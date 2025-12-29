file=databus
target=elf64

.PHONY : clean
.PHONY : again

$(file) : $(file).o
	ld -s $(file).o -o $(file)
$(file).o : $(file).asm
	nasm -f $(target) -o $(file).o $(file).asm -l $(file).list
clean:
	rm -f *.o *~ *.list *.dump $(file) *.out.*
again:
	touch $(file).asm
	make
