#!/bin/bash
#
rm -rf Build
mkdir Build
cd Build
qmake ..
make

