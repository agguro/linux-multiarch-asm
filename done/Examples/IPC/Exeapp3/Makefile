BIN=exeapp3

NASM=/usr/bin/nasm
NASMOPTS=-felf64 -Fdwarf
LDOPS=-melf_x86_64 -g

all: $(BIN)

$(BIN): $(BIN).o
	$(LD) $(LDOPS) -o $(BIN) $(BIN).o
	echo "#!/bin/bash\n#\n\nprintenv TESTVAR\n" > test.sh
	chmod +x test.sh

$(BIN).o: $(BIN).asm
	$(NASM) $(NASMOPTS) -o $(BIN).o $(BIN).asm

.PHONY: clean
clean:
	rm -f $(BIN).o $(BIN)
