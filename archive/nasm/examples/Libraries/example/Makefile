NAME=libexample
AS=nasm
LD=ld

O           = .o
ASM         = .asm
INC         = .inc
LST         = .lst

ASFLAGS     = "-felf64"
LDFLAGS     = -s -melf_x86_64
LIST        = -l $(NAME).lst
SHAREDLIBS  = ../shared/libshared.so
STATICLIBS  = ../static/libstatic.a
TYPE        =
LINK        = libshared.so

OBJS = $(NAME)$(O)

$(NAME): $(OBJS)
	make $(TYPE) -C ../static
	make $(TYPE) -C ../shared
	$(LD) $(SHAREDLIBS) -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 $(LDFLAGS) -o $(NAME) $(OBJS) $(STATICLIBS) -R .
	ln -sf $(SHAREDLIBS) $(LINK)
    
$(NAME)$(O): $(NAME)$(ASM)
	$(AS) $(ASFLAGS) $(NAME)$(ASM) $(LIST) -o $(NAME)$(O)

all:
	$(MAKE) debug
	$(MAKE) release
	
debug:
	TYPE=debug
	$(MAKE) $(NAME) ASFLAGS="-felf64 -Fdwarf" LDFLAGS="-g -melf_x86_64" LIST="-l $(NAME)$(LST)"

release:
	TYPE=release
	$(MAKE) $(NAME) ASFLAGS="-felf64" LDFLAGS="-melf_x86_64"

clean:
	make clean -C ../static
	make clean -C ../shared/
	rm -f $(NAME) $(NAME)$(LST) $(NAME)$(O) $(LINK) gmon.out
