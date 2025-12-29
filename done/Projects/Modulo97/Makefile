.PHONY: all
.PHONY: clean

all:
	$(MAKE) libmodulo97.a
	$(MAKE) bebankacc
	$(MAKE) bedrvrlic
	$(MAKE) beidcard
	$(MAKE) berrn
	$(MAKE) besiscard
	$(MAKE) bevatnr
	$(MAKE) structmsg

clean:
	rm -f *.o *.a libmodulo97.a bebankacc bedrvrlic beidcard berrn besiscard bevatnr structmsg

libmodulo97.a: libmodulo97.o
	ar rcs libmodulo97.a libmodulo97.o

bebankacc: bebankacc.o libmodulo97.a
	ld -s -melf_x86_64 -o bebankacc bebankacc.o libmodulo97.a

bedrvrlic: bedrvrlic.o libmodulo97.a
	ld -s -melf_x86_64 -o bedrvrlic bedrvrlic.o libmodulo97.a

beidcard: beidcard.o libmodulo97.a
	ld -s -melf_x86_64 -o beidcard beidcard.o libmodulo97.a

berrn: berrn.o libmodulo97.a
	ld -s -melf_x86_64 -o berrn berrn.o libmodulo97.a

besiscard: besiscard.o libmodulo97.a
	ld -s -melf_x86_64 -o besiscard besiscard.o libmodulo97.a

bevatnr: bevatnr.o libmodulo97.a
	ld -s -melf_x86_64 -o bevatnr bevatnr.o libmodulo97.a

structmsg: structmsg.o libmodulo97.a
	ld -s -melf_x86_64 -o structmsg structmsg.o libmodulo97.a

libmodulo97.o: libmodulo97.asm
	nasm "-felf64" libmodulo97.asm -o libmodulo97.o

bebankacc.o: bebankacc.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" bebankacc.asm -o bebankacc.o

bedrvrlic.o: bedrvrlic.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" bedrvrlic.asm -o bedrvrlic.o

beidcard.o: beidcard.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" beidcard.asm -o beidcard.o

berrn.o: berrn.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" berrn.asm -o berrn.o

besiscard.o: besiscard.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" besiscard.asm -o besiscard.o

bevatnr.o: bevatnr.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" bevatnr.asm -o bevatnr.o

structmsg.o: structmsg.asm libmodulo97.asm mod97template.asm
	nasm "-felf64" structmsg.asm -o structmsg.o

