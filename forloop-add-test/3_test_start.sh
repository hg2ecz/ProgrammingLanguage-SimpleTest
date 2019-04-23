#!/bin/bash

function starttimetest() {
    echo
    echo -n "$1 ($2x start) "
    bash -c "time (for i in {0..$2}; do $1 0; done > /dev/null)"
}

if [ $# -ne 1 ]; then
    echo 'Require loop number (e.g. 20000)'
    exit
fi

for fname in *forloop_add_test*; do
    if [ $fname == 'forloop_add_test-forth.sh' ]; then
        ./forloop_add_test-forth.sh 1
        starttimetest /tmp/forth.fs $1   # real test
    else
        starttimetest ./$fname $1
    fi
done
