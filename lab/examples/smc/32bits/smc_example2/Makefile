BIN=smc_example2

NASM=/usr/bin/nasm
NASMOPTS=-felf32
LDOPS=-m elf_i386

all: $(BIN)

$(BIN): $(BIN).o
	$(LD) $(LDOPS) -o $(BIN) $(BIN).o

$(BIN).o: $(BIN).asm
	$(NASM) $(NASMOPTS) -l $(BIN).lst -o $(BIN).o $(BIN).asm

.PHONY: clean
clean:
	rm -f $(BIN).o $(BIN)
