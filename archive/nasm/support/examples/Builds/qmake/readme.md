## nasm projects with qmake and qtcreator (QT6 works too)
   (the simpliest method and within qtcreator you can use the debugger too if depency of libc and ld-linux-x86-64 is a must)
   
### This method is very usefull if you need to add external libraries to your project.
    The 'classic' method with make starts being complex with the addition of
    --dynamic-linker /lib64/ld-linux-x86-64.so.2, -lc and additional libraries.
    /lib64/ld-linux-x86-64.so.2 needs to be add anyway and the c library becomes
    usefull for the C functions etc...
    
    There are two examples:
    hello and a mysql program that uses libmysqlclient.

### Build the examples:
### helloworld
    open the directory qmake
    create a directory build-hello
    cd build-hello
    qmake ../hello
    make
    ./hello

### mysqlversion
    open the directory qmake
    create a directory build-mysqlversion
    cd build-mysqlversion
    qmake ../mysqlversion
    make
    ./mysqlversion
