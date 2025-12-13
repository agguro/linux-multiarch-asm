AC_PREREQ([2.69])

AC_INIT([window], [1.0.0], [aggurobe@gmail.com], [window],[https://linuxnasm.be])

AX_PROG_NASM([nasm_avail="no"])

PACKAGE_LDFLAGS="-m elf_x86_64 -g --dynamic-linker /lib64/ld-linux-x86-64.so.2"
PACKAGE_NASMFLAGS="-f elf64 -F dwarf -g"
PACKAGE_LIBS="-lc `pkg-config --libs gtk+-3.0`"

AC_SUBST([PACKAGE_LDFLAGS])
AC_SUBST([PACKAGE_NASMFLAGS])
AC_SUBST([PACKAGE_LIBS])

AM_INIT_AUTOMAKE(foreign)
AM_PATH_GLIB_2_0([2.56.0],,AC_MSG_ERROR([GLib 2.56.0 or higher required.]))
AM_PATH_GTK_3_0([3.22.0],,AC_MSG_ERROR([Gtk+ 3.22.0 or higher required.]))
AC_CONFIG_FILES(Makefile)
AC_OUTPUT
