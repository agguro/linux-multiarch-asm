BIN=elf64header

NASM=/usr/bin/nasm
NASMOPTS=-fbin
LDOPS=-melf_x86_64 -g

.PHONY: all clean

all: $(BIN)

clean:
	rm -rf $(BIN)

%: %.asm
	$(NASM) $(NASMOPTS) -o $@ $<
	chmod +x $@
