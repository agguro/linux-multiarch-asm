# paths to include files must be set relative to build directory
QT -= gui
CONFIG -= app_bundle qt c++11 console app_bundle
QMAKE_LFLAGS += -no-pie

QMAKE_EXTRA_COMPILERS += nasm
NASMEXTRAFLAGS = -f elf64 -g -F dwarf

nasm.output = ${QMAKE_FILE_BASE}.o
nasm.commands = nasm $$NASMEXTRAFLAGS -o ${QMAKE_FILE_BASE}.o ${QMAKE_FILE_NAME}
nasm.input = NASM_SOURCES

NASM_SOURCES += mysqlversion.asm

HEADERS += mysqlversion.inc

LIBS += -lmysqlclient
