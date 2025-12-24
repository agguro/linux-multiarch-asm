BIN=sslsocket

NASM=/usr/bin/nasm
NASMOPTS=-felf64
LDOPS=-melf_x86_64 --dynamic-linker /lib64/ld-linux-x86-64.so.2
LIBS=-lc `pkg-config --libs openssl`

all: $(BIN)

$(BIN): $(BIN).o
	$(LD) $(LDOPS) -o $(BIN) $(BIN).o $(LIBS)

$(BIN).o: $(BIN).asm
	$(NASM) $(NASMOPTS) -o $(BIN).o $(BIN).asm

.PHONY: clean
clean:
	rm -f $(BIN).o $(BIN)
