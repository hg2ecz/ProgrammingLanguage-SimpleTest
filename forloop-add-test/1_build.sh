#!/bin/bash

FNAME=forloop-add-test
gcc -Wall -O2 -s $FNAME.c -o $FNAME-c-O2
gcc -Wall -Ofast -march=native -funroll-all-loops -s $FNAME.c -o $FNAME-c-Ofast
rustc -O -C link-arg=-s $FNAME.rs -o $FNAME-rs
