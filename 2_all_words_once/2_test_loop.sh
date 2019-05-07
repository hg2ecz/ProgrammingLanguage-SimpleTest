#!/bin/bash

function runtimetest() {
    echo
    echo -n "$1 ($2 $3x) "
    bash -c "time $1 $2 $3 | wc -c"
}

if [ $# -ne 2 ]; then
    echo 'Require filename  loop_number (e.g. testfile.txt 20000)'
    exit
fi

TESTFILE=$1
NORMAL=$2
SLOW=$[ $NORMAL / 10 ]

for fname in all_words_once*; do
    if [ $fname == 'all_words_once.sh' -o $fname == 'all_words_once.m' ]; then
        echo -n "--- SLOW ---"
        runtimetest ./$fname $TESTFILE $SLOW          # slow running program
    else
        runtimetest ./$fname $TESTFILE $NORMAL
    fi
done
