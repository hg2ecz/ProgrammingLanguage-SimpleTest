#!/bin/bash

function runtimetest() {
    echo
    echo -n "$1 ($2 $3x) "
    if [ ${1: -4:4} == '.jar' ]; then
        bash -c "time java -jar $1 $2 $3 | wc -c"
    else
        bash -c "time $1 $2 $3 | wc -c"
    fi
}

if [ $# -ne 2 ]; then
    echo 'Require filename  loop_number (e.g. testfile.txt 20000)'
    exit
fi

TESTFILE=$1
NORMAL=$2
SLOW=$[ $NORMAL / 10 ]
FILENAME=all_words_once

for fname in all_words_once*; do
    if [ $fname == $FILENAME.sh -o $fname == $FILENAME.m ]; then
        echo -n "--- SLOW ---"
        runtimetest ./$fname $TESTFILE $SLOW          # slow running program
    else
        runtimetest ./$fname $TESTFILE $NORMAL
    fi
done
