TEMPLATE = app
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

SOURCES += \
        main.c

win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../../../usr/lib/x86_64-linux-gnu/release/ -lbluetooth
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../../../usr/lib/x86_64-linux-gnu/debug/ -lbluetooth
else:unix: LIBS += -L$$PWD/../../../../../usr/lib/x86_64-linux-gnu/ -lbluetooth

INCLUDEPATH += $$PWD/../../../../../usr/lib/x86_64-linux-gnu
DEPENDPATH += $$PWD/../../../../../usr/lib/x86_64-linux-gnu
