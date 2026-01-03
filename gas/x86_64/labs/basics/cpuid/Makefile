# 1. Project Name
BIN=cpuid

# 2. Source Files
SRCS = $(wildcard *.s)
LIB_SRCS = 

# 3. Object and Listing Mapping
OBJS = $(notdir $(SRCS:.s=.o)) $(notdir $(LIB_SRCS:.s=.o))
LSTS = $(OBJS:.o=.lst)

# Compiler / Linker Setup
AS = /usr/bin/as
# Added -al=$@.lst to generate the listing file for each object
ASFLAGS = --64 -g --noexecstack
LD = /usr/bin/ld
LDFLAGS = -m elf_x86_64 -pie -z noexecstack --dynamic-linker /lib64/ld-linux-x86-64.so.2
INC = -I ../../../include

.PHONY: all clean

all: $(BIN)

# 4. Link Step
$(BIN): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $^

# 5. Assembly Pattern for Local Files
# Added -al flag to capture the listing
%.o: %.s
	$(AS) $(ASFLAGS) $(INC) -al=$(@:.o=.lst) $< -o $@

# 6. Assembly Pattern for Library Files
VPATH = $(dir $(LIB_SRCS))
%.o: %.s
	$(AS) $(ASFLAGS) $(INC) -al=$(@:.o=.lst) $< -o $@

clean:
	rm -f *.o *.lst $(BIN)