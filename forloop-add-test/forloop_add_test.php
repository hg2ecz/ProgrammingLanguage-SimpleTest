#!/usr/bin/env php
<?php
function main($toval) {
    $sumval = 0;
    for ($i=0; $i < $toval; $i++) {
        for ($j=0; $j < $toval; $j++) {
            $sumval += $i+($j^1);
        }
    }
    echo 'PHP: ', $sumval;
}

main( intval($argv[1]) )
?>
