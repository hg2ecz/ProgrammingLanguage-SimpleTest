#!/bin/bash

function test() {
    echo
    echo -n $1" "
    bash -c "time ./forloop-add-test$1 20000"
}

test .php
test .py
test .lua
test -c-O2
test -c-Ofast
test -rs
