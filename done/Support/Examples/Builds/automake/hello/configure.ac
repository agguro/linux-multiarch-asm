AC_PREREQ([2.69])

AC_INIT([hello], [1.0.0], [aggurobe@gmail.com], [hello],[https://linuxnasm.be])

AX_PROG_NASM([nasm_avail="no"])

PACKAGE_LDFLAGS="-m elf_x86_64 -g"
PACKAGE_NASMFLAGS="-f elf64 -F dwarf -g"

AC_SUBST([PACKAGE_LDFLAGS])
AC_SUBST([PACKAGE_NASMFLAGS])

AM_INIT_AUTOMAKE(foreign)

AC_CONFIG_FILES(Makefile)
AC_OUTPUT