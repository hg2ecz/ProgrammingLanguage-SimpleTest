#!/usr/bin/env -S sudo /bin/bash

# on Ubuntu-19.04 or newer

apt update
apt install gcc clang g++ gdc gccgo fp-compiler cargo mono-mcs
apt install php-cli python3-numba pypy3 luajit node ruby perl
apt install octave julia r-base
apt install gawk bc dc apcalc gforth

snap install --classic kotlin
