#!/usr/bin/env bash

calc -d -q -s -- $1 << CALEOT

define main(toval) {
    local i, j, sumval=0;
    for (i = 0 ; i < toval ; i++ ) {
        for ( j = 0 ; j < toval ; j++) {
            sumval += ( i + ( j ^ 1 ) );
        }
    }
    print "calc: ", sumval;
}

main(eval(argv(1)));
quit;
CALEOT
