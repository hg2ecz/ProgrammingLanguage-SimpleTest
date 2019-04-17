#!/usr/bin/env pypy3

import sys

toval = int(sys.argv[1])
sumval = 0;

for i in range(0, toval):
    for j in range(0, toval):
        sumval += i+(j^1)

print ('Pypy:', sumval)
