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

for fname in *forloop_add_test*; do
    if [ $fname == 'forloop_add_test.sh' -o $fname == 'forloop_add_test.m' -o ${fname:0:9} == "calconly_" ]; then
        runtimetest ./$fname $[ $1/10 ]
    elif [ $fname == 'forloop_add_test-forth.sh' ]; then
        ./forloop_add_test-forth.sh $1
        runtimetest /tmp/forth.fs $1   # real test
    else
        runtimetest ./$fname $1
    fi
done
