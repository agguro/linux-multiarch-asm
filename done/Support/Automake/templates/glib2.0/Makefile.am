NASM = /usr/bin/nasm
LD   = /usr/bin/ld

bin_PROGRAMS = [template]

[template]_NASMFLAGS = @PACKAGE_NASMFLAGS@
[template]_LDFLAGS = @PACKAGE_LDFLAGS@
[template]_LIBS = @PACKAGE_LIBS@
[template]_OBJS = main.o


.asm.o:
        $(NASM) $(version_NASMFLAGS) $< -o $@
	
version$(EXEEXT): $(version_OBJS)
        ld $(version_LDFLAGS) $(version_LIBS) $(version_OBJS) -o $(bin_PROGRAMS)
	
no-debug: $(bin_PROGRAMS)$(EXEEXT)
	strip -s $(bin_PROGRAMS)$(EXEEXT)
	
clean:
        rm -rf $($(bin_PROGRAM)_OBJS) $(version_OBJS) $(bin_PROGRAMS)$(EXEEXT)