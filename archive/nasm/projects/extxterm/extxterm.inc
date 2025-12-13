%ifndef _EXTXTERM_INC_
%define _EXTXTERM_INC_

%include "unistd.inc"
%include "sys/stat.inc"
%include "asm-generic/errno.inc"

%define SCRIPT      'tty > /tmp/xterm_fifo;trap \"\" INT QUIT TSTP;exec<&-;exec>&-;while :;do sleep 3600;done'
%define COMMAND     '/usr/bin/xterm'
%define FIFOBUFFER  '/tmp/xterm_fifo'
%define DISPLAYNAME "TERMINAL"

%endif
