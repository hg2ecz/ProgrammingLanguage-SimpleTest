#!/usr/bin/env nodejs

function main(toval) {
    var i, j, sumval = 0;
    for (i=0; i<toval; i++) {
        for (j=0; j<toval; j++) {
            sumval += i+(j^1);
        }
    }
    console.log("nodejs:", sumval);
}

main( parseInt(process.argv.slice(2)) );
