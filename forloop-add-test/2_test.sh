#!/bin/sh

FNAME=forloop-add-test
NUM=20000
bash -c "time ./$FNAME.php $NUM"
bash -c "time ./$FNAME.py  $NUM"
bash -c "time ./$FNAME-c   $NUM"
bash -c "time ./$FNAME-rs  $NUM"
