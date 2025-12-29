BIN=notify
# install sudo apt install libnotify-dev

NASM=/usr/bin/nasm
NASMOPTS=-felf64 -Fdwarf
LDOPS=-melf_x86_64 -g --dynamic-linker /lib64/ld-linux-x86-64.so.2
LIBS=-lc -lnotify



.PHONY: all clean

all: $(BIN)

clean:
	rm -rf $(BIN)

%: %.asm
	$(NASM) $(NASMOPTS) -o $@.o $<
	$(LD) $(LDOPS) -o $@ $@.o $(LIBS)
