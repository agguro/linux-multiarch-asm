TARGETS=isatty
ASM=/usr/bin/nasm
LD=/usr/bin/ld
ASMOPTS=-felf64
LDOPTS=-m elf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2
LIBS=-lc `pkg-config --libs gtk+-3.0`

.PHONY: all clean pristine

all: $(TARGETS)

clean:
	rm -f $(TARGETS) *.o

pristine: clean

%: %.asm
	$(ASM) $(ASMOPTS) -o $@.o $<
	$(LD) -o $@ $(LDOPTS) $@.o $(LIBS)
