[original source](https://github.com/andystanton/cmake-nasm-test)
modified for my own needs

This project builds a hello world console application in x86-64 assembly with NASM using CMake.

## Requirements

* nasm
* CMake, Make and ld

## Usage

This command will build the application on Linux with recent nasm (tested with 2.16rc0):

    mkdir build
    cd build
    cmake ..
    ./hello