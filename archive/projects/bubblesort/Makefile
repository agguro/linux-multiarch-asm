.PHONY: all
.PHONY: debug
.PHONY: clean

NAME=bubblesort
AS=nasm
LD=ld

O           = .o
ASM         = .asm
INC         = .inc
LST         = .lst

ASFLAGS     = -felf64
OPTIMIZE    =
LDFLAGS     = -s -melf_x86_64

OBJS = $(NAME)$(O)

$(NAME): $(OBJS)
	$(LD) $(LDFLAGS) -o $(NAME) $(OBJS) $(LIBS)

$(NAME)$(O): $(NAME)$(ASM) optimizingstep0.asm optimizingstep1.asm optimizingstep2.asm
	$(AS) $(ASFLAGS) $(OPTIMIZE) $(NAME)$(ASM) -l $(NAME)$(LST) -o $(NAME)$(O)

optimize0:
	touch $(NAME)$(ASM)
	$(MAKE) OPTIMIZE="-dOPTIMIZE_STEP=0" $(NAME)
	
optimize1:
	touch $(NAME)$(ASM)
	$(MAKE) OPTIMIZE="-dOPTIMIZE_STEP=1" $(NAME)

optimize2:
	touch $(NAME)$(ASM)
	$(MAKE) OPTIMIZE="-dOPTIMIZE_STEP=2" $(NAME)
	
debug:
	touch $(NAME)$(ASM)
	$(MAKE) $(NAME) ASFLAGS="-felf64 -Fstabs -g" LDFLAGS="-g -melf_x86_64"
	valgrind --tool=callgrind --dump-instr=yes --collect-jumps=yes ./$(NAME)
clean:
	@rm -f *.out.* $(NAME) $(NAME)$(LST) $(NAME)$(O)
