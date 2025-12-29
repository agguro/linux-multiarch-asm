NASM = /usr/bin/nasm
LD   = /usr/bin/ld

bin_PROGRAMS = hello

hello_NASMFLAGS = @PACKAGE_NASMFLAGS@
hello_LDFLAGS = @PACKAGE_LDFLAGS@

hello_SOURCES = main.asm print.asm

.asm.o:
	$(NASM) $(hello_NASMFLAGS) $< -o $@
	
hello$(EXEEXT): main.o print.o
	ld $(LDFLAGS) $^ -o $@
	
no-debug: hello
	strip -s hello
	
clean:
	rm -rf $(hello_OBJS) hello$(EXEEXT)
