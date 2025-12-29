#!/usr/bin/python3
#

import functions


def main():
    for a in range(1, 11):
        print('{:>4}'.format(functions.square(a)))

main()
