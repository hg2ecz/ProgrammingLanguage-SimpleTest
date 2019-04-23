#!/bin/bash

function starttimetest() {
    echo
    echo -n "$1 ($2x start) "
    bash -c "time (for i in {0..$2}; do $1 0; done 2>&1 > /dev/null)"
}

if [ $# -ne 1 ]; then
    echo 'Require program start number (e.g. 100)'
    exit
fi

NORMAL= $1
SLOW= $[ $NORMAL / 10 ]

for fname in *forloop_add_test*; do
    if [ $fname == 'forloop_add_test-forth.sh' ]; then
        ./forloop_add_test-forth.sh 1
        starttimetest /tmp/forth.fs $NORMAL # real test
    elif [ $fname == 'forloop_add_test.jl' -o $fname == 'forloop_add_test.js' -o 'forloop_add_test.m' ]; then
        starttimetest ./$fname $SLOW        # slow startable program
    else
        starttimetest ./$fname $NORMAL
    fi
done
