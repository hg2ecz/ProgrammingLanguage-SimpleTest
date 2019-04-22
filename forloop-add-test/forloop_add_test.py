#!/usr/bin/env pypy3

import sys

def main(toval):
    sumval = 0;
    for i in range(0, toval):
        for j in range(0, toval):
            sumval += i+(j^1)

    print ('Pypy:', sumval)

main( int(sys.argv[1]) )
