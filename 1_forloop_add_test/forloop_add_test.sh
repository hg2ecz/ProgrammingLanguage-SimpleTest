#!/usr/bin/env bash

function main() {
    toval=$1
    sumval=0

    for ((i=0; i<$toval; i++)); do
        for ((j=0; j<$toval; j++)); do
            (( sumval += i+(j^1) ))
        done
    done
    echo 'Bash: ' $sumval;
}

main $1
