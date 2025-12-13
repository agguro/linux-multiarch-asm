NAME=shell
TARGET=bin
AS=nasm

O           = .o
ASM         = .asm
INC         = .inc
LST         = .lst

OBJS = $(NAME)$(O)

$(NAME).o : $(NAME)$(ASM)
	$(AS) -f $(TARGET) -o $(NAME).$(TARGET) $(NAME)$(ASM) -l $(NAME)$(LST)
