BIN=arguments

NASM=/usr/bin/nasm
NASMOPTS=-felf64 -Fdwarf
LDOPS=-melf_x86_64 -g
INC=../../../include/

all: $(BIN)

$(BIN): $(BIN).o
	$(LD) $(LDOPS) -o $(BIN) $(BIN).o

$(BIN).o: $(BIN).asm
	$(NASM) $(NASMOPTS) -L $(INC) -o $(BIN).o $(BIN).asm

.PHONY: clean
clean:
	rm -f $(BIN).o $(BIN)
