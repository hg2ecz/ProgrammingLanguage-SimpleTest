#!/bin/bash

function realtest() {
    echo
    echo -n "$1 ($2 * $2) "
    bash -c "time ./forloop_add_test$1 $2"
}

function test() {
    realtest $1 20000
}

function testslow() {
    realtest $1 2000
}

test -rs
echo "---- binary ... -Ofast ---"
test -c-Ofast
test -d-Ofast
test -go-Ofast

echo "---- binary ... -O2 ---"
test -c-O2
test -d-O2
test -go-O2

echo "---- byte code ---"
test .exe

echo "---- script ... -O2 ---"
test .lua
test .py
test .py2
test .js
test .php
test .pl
test .awk

echo "---- slow script ----"
testslow .sh
