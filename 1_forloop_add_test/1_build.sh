#!/bin/bash

FNAME=forloop_add_test

gcc   -Wall -O2                                     -s src/$FNAME.c -o $FNAME-gcc-O2
gcc   -Wall -Ofast -march=native -funroll-all-loops -s src/$FNAME.c -o $FNAME-gcc-Ofast

clang -Wall -O2                                     -s src/$FNAME.c -o $FNAME-clang-O2
clang -Wall -Ofast -march=native -funroll-all-loops -s src/$FNAME.c -o $FNAME-clang-Ofast

gdc   -Wall -O2                  -s src/$FNAME.d -o $FNAME-d-O2
gdc   -Wall -Ofast -march=native -s src/$FNAME.d -o $FNAME-d-Ofast

gccgo -Wall -O2                  -s src/$FNAME.go -o $FNAME-go-O2
gccgo -Wall -Ofast -march=native -s src/$FNAME.go -o $FNAME-go-Ofast

rustc -O -C link-arg=-s src/$FNAME.rs -o $FNAME-rs

mcs src/$FNAME.cs -out:$FNAME.exe
fpc -O4 -Op3 src/$FNAME.pas -o./$FNAME-pas; rm -f $FNAME.o

pushd .; cd src
  javac $FNAME.java
  jar -cvmf MANIFEST.MF ../$FNAME-java.jar $FNAME.class
popd

kotlinc src/$FNAME.kt -include-runtime -d $FNAME-kotlin.jar
