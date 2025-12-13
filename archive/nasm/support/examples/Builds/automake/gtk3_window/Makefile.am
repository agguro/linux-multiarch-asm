NASM = /usr/bin/nasm
LD   = /usr/bin/ld

bin_PROGRAMS = window

nasm_NASMFLAGS = @PACKAGE_NASMFLAGS@
nasm_LDFLAGS = @PACKAGE_LDFLAGS@
nasm_LIBS = @PACKAGE_LIBS@
nasm_OBJS = mainwindow.o main.o

.asm.o:
	$(NASM) $(nasm_NASMFLAGS) $< -o $@
	
window$(EXEEXT): $(nasm_OBJS)
	ld $(nasm_LDFLAGS) $(nasm_LIBS) $(nasm_OBJS) -o $(bin_PROGRAMS)
	
no-debug: $(bin_PROGRAMS)$(EXEEXT)
	strip -s $(bin_PROGRAMS)$(EXEEXT)
	
clean:
	rm -rf $($(bin_PROGRAM)_OBJS) $(nasm_OBJS) $(bin_PROGRAMS)$(EXEEXT)