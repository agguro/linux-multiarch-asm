#!/usr/bin/python3

from ctypes import *

so_file = "./libpyfunctions.so.1.0.0"
nasmfunctions = CDLL(so_file)

def square(a):
    return nasmfunctions.square(a)
