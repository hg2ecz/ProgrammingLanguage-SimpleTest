#!/bin/sh

FNAME=forloop-add-test
gcc -Wall -Ofast -funroll-all-loops -s $FNAME.c -o $FNAME-c
rustc -O -C link-arg=-s $FNAME.rs -o $FNAME-rs
