#!/bin/bash

function test() {
    echo
    echo -n "$1 (1000x start) "
    if [ $1 == 'java' ]; then
        bash -c "time (for i in {0..1000}; do java forloop_add_test 0; done > /dev/null)"
    else
        bash -c "time (for i in {0..1000}; do ./forloop_add_test$1 0; done > /dev/null)"
    fi
}

test -rs
test -rs
echo "---- binary ... -Ofast ---"
test -c-Ofast
test -d-Ofast
test -go-Ofast

echo "---- binary ... -O2 ---"
test -c-O2
test -d-O2
test -go-O2

echo "---- bytecode ---"
test .exe
#test java

echo "---- script ... -O2 ---"
test .lua
test .py
test .js
test .php
test .pl
test .awk

test .sh
