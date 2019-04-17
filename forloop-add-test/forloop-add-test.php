#!/usr/bin/env php
<?php

$toval = intval($argv[1]);
$sumval = 0;

for ($i=0; $i < $toval; $i++) {
    for ($j=0; $j < $toval; $j++) {
        $sumval += $i+($j^1);
    }
}

echo 'PHP: ', $sumval;
?>

