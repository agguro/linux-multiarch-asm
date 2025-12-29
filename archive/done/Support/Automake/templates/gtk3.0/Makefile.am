NASM = /usr/bin/nasm
LD   = /usr/bin/ld
bin_PROGRAMS = [template]
[template]_NASMFLAGS = @PACKAGE_NASMFLAGS@
[template]_LDFLAGS = @PACKAGE_LDFLAGS@
[template]_LIBS = @PACKAGE_LIBS@
[template]_SOURCES = $(bin_PROGRAMS).asm

.asm.o:
	$(NASM) $([template]_NASMFLAGS) $< -o $@
	
[template]$(EXEEXT): $(bin_PROGRAMS).o
	ld $([template]_LDFLAGS) $([template]_LIBS) $^ -o $@
	
no-debug: $(bin_PROGRAMS)$(EXEEXT)
	strip -s $(bin_PROGRAMS)$(EXEEXT)
	
clean:
	rm -rf $([template]_OBJS) $(bin_PROGRAMS)$(EXEEXT)
