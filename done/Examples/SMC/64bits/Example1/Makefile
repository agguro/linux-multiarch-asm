BIN=smc_example1

NASM=/usr/bin/nasm
NASMOPTS=-felf64
LDOPS=-m elf_x86_64

all: $(BIN)

$(BIN): $(BIN).o
	$(LD) $(LDOPS) -o $(BIN) $(BIN).o

$(BIN).o: $(BIN).asm
	$(NASM) $(NASMOPTS) -l $(BIN).lst -o $(BIN).o $(BIN).asm

.PHONY: clean
clean:
	rm -f $(BIN).o $(BIN)
