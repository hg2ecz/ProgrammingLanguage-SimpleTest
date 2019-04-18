#!/bin/bash

FNAME=forloop_add_test
gcc -Wall -O2 -s $FNAME.c -o $FNAME-c-O2
gcc -Wall -Ofast -march=native -funroll-all-loops -s $FNAME.c -o $FNAME-c-Ofast
rustc -O -C link-arg=-s $FNAME.rs -o $FNAME-rs

gdc -Wall -O2 $FNAME.d -o $FNAME-d-O2
gdc -Wall -Ofast -march=native $FNAME.d -o $FNAME-d-Ofast
