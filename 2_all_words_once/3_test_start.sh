#!/bin/bash

function starttimetest() {
    echo
    echo -n "$1 ($2 $3x start) "
    bash -c "time (for i in {0..$3}; do $1 $2 0 2>/dev/null; done > /dev/null)"
}

if [ $# -ne 2 ]; then
    echo 'Require testfile program_start_number (e.g. testfile.txt 1000)'
    exit
fi

TESTFILE=$1
NORMAL=$2
SLOW=$[ $NORMAL / 10 ]

for fname in all_words_once*; do
    if [ $fname == 'all_words_once.jl' -o $fname == 'all_words_once.js' \
        -o $fname == 'all_words_once.m'  -o $fname == 'all_words_once.py-numba' \
        -o $fname == 'all_words_once.r' ]; then
        echo -n "--- SLOW ---"
        starttimetest ./$fname $TESTFILE $SLOW        # slow startable program
    else
        starttimetest ./$fname $TESTFILE $NORMAL
    fi
done
