#!/usr/bin/env bash

cat << BCEND | bc
define main(toval) {
    auto i, j, sumval
    sumval = 0
    for (i = 0 ; i < toval ; i++ ) {
        for ( j = 0 ; j < toval ; j++) {
            sumval += i + ( j ^ 1 )
        }
    }
    print "bc: ", sumval
}

main($1)
BCEND
