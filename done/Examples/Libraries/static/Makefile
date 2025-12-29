LIBNAME=static
AS=nasm
LD=ld
AR          = ar
AROPT	    = rcs
O           = .o
ASM         = .asm
INC         = .inc
LST         = .lst
ARCH        = .a
ASFLAGS     = "-felf64"
LDFLAGS     = -s -melf_x86_64

OBJS = $(NAME)$(O)

lib$(LIBNAME)$(ARCH): $(LIBNAME)$(O)
	$(AR) $(AROPT) lib$(LIBNAME)$(ARCH) $(LIBNAME)$(O)

$(LIBNAME)$(O): $(LIBNAME)$(ASM)
	$(AS) $(ASFLAGS) $(LIBNAME)$(ASM) -o $(LIBNAME)$(O)

release:
	$(MAKE) lib$(LIBNAME)$(ARCH) ASFLAGS="-felf64" LDFLAGS="-melf_x86_64" AROPT="rcs"

debug:
	$(MAKE) lib$(LIBNAME)$(ARCH) ASFLAGS="-felf64 -Fdwarf -g" LDFLAGS="-g -melf_x86_64" AROPT="rcs"

clean:
	rm -f lib$(LIBNAME)$(ARCH) $(LIBNAME)$(LST) $(LIBNAME)$(O) *$(LST) gmon.out
