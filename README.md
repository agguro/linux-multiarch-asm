# linux-assembly-programming
Building linux assembly programs several ways

## added build features:
	native (makefile also shortest binary if not hacked)
	qmake  (linked with gcc/g++ very usefull with qtcreator)
	cmake  (still in progress, support build from same directory)
	autotools 'still in progress build from same directory)


## added support files:
	autotools ax_prog_nasm.m4 and ax_prog_nasm_opt.m4 for cmake (version 3.19.1)

## include files converted from C header files
	one warning is in place: Not all includes are tested and not all in one include file is tested.  Use at your own risk or if in doubt, use your include files.
	I've tried my best but even until today I find errors (typos mostly)

## test files:
	autotools
		hello.asm
		gtk3_window
	cmake
		hello.asm
	qmake
		hello.asm project
		mysqlclientversion project

## example files from linuxnasm.be:
	A collection of all examples from my website linuxnasm.be


All this is assembled with NASM version 2.15.05 and linked with GNU ld (GNU Binutils for Ubuntu) 2.34
The NASMENV has to be set.  
In the support files this is done with a script file nasm.sh in /etc/profile.d but root permissions can be required.
The NASMENV can also be set on user based in the home folder.(sudo nano ~/.bashrc)
