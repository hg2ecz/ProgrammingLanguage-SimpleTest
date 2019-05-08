#!/bin/bash

FNAME=all_words_once

#gcc   -Wall -O2                                     -s src/$FNAME.c -o $FNAME-gcc-O2
#gcc   -Wall -Ofast -march=native -funroll-all-loops -s src/$FNAME.c -o $FNAME-gcc-Ofast

#clang -Wall -O2                                     -s src/$FNAME.c -o $FNAME-clang-O2
#clang -Wall -Ofast -march=native -funroll-all-loops -s src/$FNAME.c -o $FNAME-clang-Ofast

#gdc   -Wall -O2                  -s src/$FNAME.d -o $FNAME-d-O2
#gdc   -Wall -Ofast -march=native -s src/$FNAME.d -o $FNAME-d-Ofast

#gccgo -Wall -O2                  -s src/$FNAME.go -o $FNAME-go-O2
#gccgo -Wall -Ofast -march=native -s src/$FNAME.go -o $FNAME-go-Ofast

rustc -O -C link-arg=-s src/$FNAME\1.rs -o $FNAME-rs1
rustc -O -C link-arg=-s src/$FNAME\2.rs -o $FNAME-rs2

mcs src/$FNAME.cs -out:$FNAME.exe
#fpc -O4 -Op3 src/$FNAME.pas -o./$FNAME-pas; rm -f $FNAME.o

##javac forloop_add_test.java
