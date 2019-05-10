#!/bin/bash

function runtimetest() {
    echo
    echo -n "$1 ($2 * $2) "
    if [ ${1: -4:4} == '.jar' ]; then
        bash -c "time java -jar $1 $2"
    else
        bash -c "time $1 $2"
    fi
}

if [ $# -ne 1 ]; then
    echo 'Require loop number (e.g. 20000)'
    exit
fi

NORMAL=$1
SLOW=$[ $NORMAL / 10 ]
FILENAME=forloop_add_test

for fname in *forloop_add_test*; do
    if [ $fname == $FILENAME.sh -o $fname == $FILENAME.m -o ${fname: 0:9} == "calconly_" ]; then
        echo -n "--- SLOW ---"
        runtimetest ./$fname $SLOW          # slow running program
    elif [ $fname == $FILENAME\-forth.sh ]; then
        ./forloop_add_test-forth.sh $NORMAL
        runtimetest /tmp/forth.fs $NORMAL   # real test
    else
        runtimetest ./$fname $NORMAL
    fi
done
