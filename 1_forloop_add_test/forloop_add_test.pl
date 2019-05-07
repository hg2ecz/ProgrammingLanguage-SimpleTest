#!/usr/bin/env perl

use strict;

sub main {
    my ($toval) = @_;
    my $sumval = 0;
    for (my $i=0; $i < $toval; $i++) {
        for (my $j=0; $j < $toval; $j++) {
            $sumval += $i+($j^1);
        }
    }
    print 'Perl: ', $sumval, "\n";
}

main ( int($ARGV[0]) );
