#!/usr/bin/env -S gawk -f

function main(toval) {
    sumval=0
    for (i=0; i<toval; i++) {
        for (j=0; j<toval; j++) {
            sumval += i+(j^1)
        }
    }
    print "AWK: ", sumval
}

BEGIN {
    main( strtonum(ARGV[1]) )
}
