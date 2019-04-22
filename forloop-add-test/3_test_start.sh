#!/bin/bash

function test() {
    echo
    echo -n "$1 (1000x start) "
    bash -c "time (for i in {0..1000}; do ./forloop_add_test$1 0; done > /dev/null)"
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
