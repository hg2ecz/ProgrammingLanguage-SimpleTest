#!/bin/bash

function runtimetest() {
    echo
    echo -n "$1 ($2 * $2) "
    bash -c "time $1 $2"
}

if [ $# -ne 1 ]; then
    echo 'Require loop number (e.g. 20000)'
    exit
fi

NORMAL=$1
SLOW=$[ $NORMAL / 10 ]

for fname in *forloop_add_test*; do
    if [ $fname == 'forloop_add_test.sh' -o $fname == 'forloop_add_test.m' -o ${fname:0:9} == "calconly_" ]; then
        echo "--- SLOW ----"
        runtimetest ./$fname $SLOW          # slow running program
    elif [ $fname == 'forloop_add_test-forth.sh' ]; then
        ./forloop_add_test-forth.sh $NORMAL
        runtimetest /tmp/forth.fs $NORMAL   # real test
    else
        runtimetest ./$fname $NORMAL
    fi
done
