#!/usr/bin/env bash

toval=2000
sumval=0

for ((i=0; i<$toval; i++)); do
    for ((j=0; j<$toval; j++)); do
        sumval=$(( $sumval+$i+$(( $j^1 )) ))
    done
done

echo 'Bash: ' $sumval;
