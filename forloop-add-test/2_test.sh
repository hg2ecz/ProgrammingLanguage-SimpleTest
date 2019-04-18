#!/bin/bash

function test() {
    echo
    echo -n $1" "
    bash -c "time ./forloop_add_test$1 20000"
}

test .php
test .js
test .py
test .lua
test -go-O2
test -d-O2
test -c-O2

test -go-Ofast
test -d-Ofast
test -c-Ofast
test -rs
