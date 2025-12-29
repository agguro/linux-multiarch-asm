# paths to include files must be set relative to build directory
QT -= gui
CONFIG -= app_bundle qt
QMAKE_LFLAGS_RELEASE += -s

TEMPLATE = lib

QMAKE_EXTRA_COMPILERS += nasm
NASMEXTRAFLAGS = -f elf64 -g -F dwarf

nasm.output = ${QMAKE_FILE_BASE}.o
nasm.commands = nasm $$NASMEXTRAFLAGS -o ${QMAKE_FILE_BASE}.o ${QMAKE_FILE_NAME}
nasm.input = NASM_SOURCES
OTHER_FILES += $$NASM_SOURCES

NASM_SOURCES += %{FileName}.asm

HEADERS += %{FileName}.inc

# Default rules for deployment.
unix {
    target.path = /usr/lib
}
!isEmpty(target.path): INSTALLS += target
