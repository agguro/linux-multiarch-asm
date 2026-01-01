
BIN=arguments

AS=/usr/bin/as
ASFLAGS=--64 -g
LD=/usr/bin/ld
LDFLAGS=-m elf_x86_64
INC=-I ../../../include

OBJS=arguments.o strlen.o u64toa.o

.PHONY: all clean
all: $(BIN)

$(BIN): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

strlen.o: ../../../lib/strlen.s
	$(AS) $(ASFLAGS) $< -o $@

u64toa.o: ../../../lib/u64toa.s
	$(AS) $(ASFLAGS) $< -o $@

arguments.o: arguments.s
	$(AS) $(ASFLAGS) $(INC) $< -o $@

clean:
	rm -f $(OBJS) $(BIN)
