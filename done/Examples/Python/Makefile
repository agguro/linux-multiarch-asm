.PHONY: all
.PHONY: clean
.PHONY: debug

LIBNAME=libpyfunctions
LIBS=-lc
VERSION=1.0.0
O = .o
SO = .so
LST = .lst
ASM = .asm
ASFLAGS= -felf64
LDFLAGS=-s -melf_x86_64
SONAME=$(LIBNAME)$(SO)

$(LIBNAME)$(SO) : $(LIBNAME)$(O) 
	ld $(LIBS) --dynamic-linker /lib64/ld-linux-x86-64.so.2 -shared -soname $(SONAME) -o $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(O) -R .

$(LIBNAME)$(O) : $(LIBNAME)$(ASM)
	nasm $(ASFLAGS) -o $(LIBNAME)$(O) $(LIBNAME)$(ASM)

release:
	$(MAKE) $(LIBNAME)$(SO) ASFLAGS="-felf64" LDFLAGS="-melf_x86_64"
	ln -sf $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(SO)
	ln -sf $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(SO).1
	ln -sf $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(SO).1.0

debug:
	$(MAKE) $(LIBNAME)$(SO) ASFLAGS="-felf64 -Fdwarf -g" LDFLAGS="-g -melf_x86_64"
	ln -sf $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(SO)
	ln -sf $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(SO).1
	ln -sf $(LIBNAME)$(SO).$(VERSION) $(LIBNAME)$(SO).1.0

clean:
	rm -f *$(O) *.so.* *$(LST)
	rm -rf __pycache__
