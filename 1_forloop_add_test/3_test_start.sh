#!/bin/bash

function starttimetest() {
    echo
    echo -n "$1 ($2x start) "
    bash -c "time (for i in {0..$2}; do $1 0 2>/dev/null; done > /dev/null)"
}

if [ $# -ne 1 ]; then
    echo 'Require program start number (e.g. 1000)'
    exit
fi

NORMAL=$1
SLOW=$[ $NORMAL / 10 ]

for fname in *forloop_add_test*; do
    if [ $fname == 'forloop_add_test-forth.sh' ]; then
        ./forloop_add_test-forth.sh 1
        starttimetest /tmp/forth.fs $NORMAL # real test
    elif [ $fname == 'forloop_add_test.jl' -o $fname == 'forloop_add_test.js' \
        -o $fname == 'forloop_add_test.m'  -o $fname == 'forloop_add_test.py-numba' \
        -o $fname == 'forloop_add_test.r' ]; then
        echo -n "--- SLOW ---"
        starttimetest ./$fname $SLOW        # slow startable program
    else
        starttimetest ./$fname $NORMAL
    fi
done
