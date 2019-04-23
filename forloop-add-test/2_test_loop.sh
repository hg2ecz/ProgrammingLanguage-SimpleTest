#!/bin/bash

function runtimetest() {
    echo
    echo -n "$1 ($2 * $2) "
    bash -c "time ./$1 $2"
}

if [ $# -ne 1 ]; then
    echo 'Require loop number (e.g. 20000)'
    exit
fi

for fname in *forloop_add_test*; do
    if [ $fname != 'forloop_add_test.sh' ]; then
        runtimetest $fname $1
    else
        runtimetest $fname $[ $1/10 ]
    fi
done
