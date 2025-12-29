# Use of makefile
# make          : build bootloader64 and bootloader16.lst
#               for a quick view you can use
#               qemu-system-x86_64 -hda bootloader64 -k nl-be -vga std (you can use cirrus instead of std too)
#               as mentioned on the developers website.
# make clean    : is called with make run to be sure to delete the floppy and iso image otherwise make results in an error
# make again    : to rebuild the program, even if the source isn't changed, can be run after makefile modifications
# make dump     : to create a hexdump of the different builded files
# make images   : build the images
# make run      : (re-)build all files except dumps and simulate with qemu-x86_64 the iso image
# make tar      : make a tar.gz file
# make all      : make programs and images

.PHONY : clean
.PHONY : again
.PHONY : dump
.PHONY : run
.PHONY : images
.PHONY : tar
.PHONY : all

NAME=bootloader16
TARGET=bin
AS=nasm
LD=ld

O           = .o
ASM         = .asm
INC         = .inc
LST         = .lst
DUMP        = .dump

OBJS = $(NAME)$(O)
$(NAME).o : $(NAME).asm
	$(AS) -f $(TARGET) -o $(NAME).$(TARGET) $(NAME)$(ASM) -l $(NAME)$(LST)
	nasm -fbin kernel.asm -o kernel.bin

clean:
	@rm -rf *$(O) *~ *$(LST) *$(DUMP) $(NAME)
	@rm -rf floppy/
	@rm -rf iso/
	@rm -rf dumps/
	@rm -rf tmp-loop/
	@rm -rf *$(TARGET)

again:
	touch $(NAME)$(ASM)
	make
    
dump:
	@rm -rf dumps/
	mkdir dumps
	make again
	hexdump -C $(NAME).$(TARGET) > dumps/$(NAME)$(DUMP)
	hexdump -C floppy/$(NAME).flp > dumps/$(NAME).flp$(DUMP)
	hexdump -C iso/$(NAME).iso > dumps/$(NAME).iso$(DUMP)

images:
	make again
	rm -rf floppy/
	rm -rf iso/
	rm -rf tmp-loop/
	mkdir floppy
	mkdir iso
	mkdosfs -C floppy/$(NAME).flp 1440
	dd status=noxfer conv=notrunc count=1 if=$(NAME).$(TARGET) of=floppy/$(NAME).flp
	mkdir tmp-loop
	sudo mount -o loop -t vfat floppy/bootloader16.flp tmp-loop
	sudo cp kernel.bin tmp-loop/
	sleep 0.2
	sudo umount tmp-loop
	rm -rf tmp-loop/
	mkisofs -quiet -V 'AGGURO' -input-charset iso8859-1 -o iso/$(NAME).iso -b $(NAME).flp floppy/

run:
	make images
	qemu-system-i386 -cdrom iso/$(NAME).iso -k nl-be -vga std
    
tar:
	make clean
	tar czf ../$(NAME).tar.gz ../$(NAME)/
    
all:
	make again
	make images
	make dump
