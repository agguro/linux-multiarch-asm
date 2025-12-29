.PHONY: release
.PHONY: debug
.PHONY: clean

ARCHNAME=%{FileName}

O		= .o
ASM		= .asm
INC		= .inc
LST		= .lst
ARCH		= .a
ASFLAGS		= "-felf64"
LDFLAGS		= -s -melf_x86_64
VERSION		= 1.0.0
DEBUG		= 			
CURRENTDIR	= $(shell pwd)
OBJS		= $(ARCHNAME)$(O)

$(ARCHNAME)$(ARCH): $(OBJS)
	ar rcs $(ARCHNAME).$(VERSION)$(DEBUG)$(ARCH) $(ARCHNAME)$(O)
	@ln -sf $(CURRENTDIR)/$(ARCHNAME).$(VERSION)$(DEBUG)$(ARCH) $(ARCHNAME)$(ARCH)
	
$(ARCHNAME)$(O): $(ARCHNAME)$(ASM)
	nasm $(ASFLAGS) $(ARCHNAME)$(ASM) -o $(ARCHNAME)$(O)

release:
	make clean
	make $(ARCHNAME)$(ARCH) ASFLAGS="-felf64" LDFLAGS="-s -melf_x86_64"

debug:
	make clean
	make $(ARCHNAME)$(DEBUG)$(ARCH) DEBUG="-dev" ASFLAGS="-felf64 -Fdwarf -g -l $(ARCHNAME)$(LST)" LDFLAGS="-g -melf_x86_64"

clean:
	rm -f *$(O) *$(ARCH) *$(LST)

