QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++11

# Create position independed executables
# Some Linux version (Mint) doesn't allow to run applications to run from GUI
# because the apps are treated as libraries instead of executable code
QMAKE_LFLAGS += -no-pie
QMAKE_LFLAGS_DEBUG += -no-pie -O0

# NASM support
QMAKE_EXTRA_COMPILERS += nasm

NASMEXTRAFLAGS = -f elf64 -g -F dwarf

nasm.output = ${QMAKE_FILE_BASE}.o
nasm.commands = nasm $$NASMEXTRAFLAGS -o ${QMAKE_FILE_BASE}.o ${QMAKE_FILE_NAME}
nasm.input = NASM_SOURCES

# The following define makes your compiler emit warnings if you use
# any Qt feature that has been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    main.cpp \
    mainwindow.cpp

HEADERS += \
    mainwindow.h \
    inc/sayhello.inc

FORMS += \
    mainwindow.ui

DISTFILES += $$NASM_SOURCES \


# NASM sources going here
NASM_SOURCES += \
    asm/sayhello.asm

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
