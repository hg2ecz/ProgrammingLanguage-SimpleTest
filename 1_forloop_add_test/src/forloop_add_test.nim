#!/usr/bin/env -S nim c -r

import os
import strutils

proc main(toval: int) =
    var sumval = 0;
    for i in 0..toval-1:
        for j in 0..toval-1:
            sumval += i+(j xor 1)

    echo "Nim:", sumval

main( parseInt( paramStr(1) ) )
