#!/bin/bash
#

find . -name '*.asm' | xargs -I{} basename {} '.asm' | xargs -i mkdir -p {}
find . -type d | xargs -i cp ./index.php {}
find . -type d | xargs -i cp ./Makefile {}
