#!/usr/bin/env perl

use strict;

my $toval = int($ARGV[0]);
my $sumval = 0;

for (my $i=0; $i < $toval; $i++) {
    for (my $j=0; $j < $toval; $j++) {
        $sumval += $i+($j^1);
    }
}

print 'Perl: ', $sumval, "\n";
