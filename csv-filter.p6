#!/usr/bin/env perl6

use v6;

use lib 'lib';
use CSV::Filter;

sub MAIN(Str $source, $wanted) {
    my $raw = open $source;
    for $raw.lines -> $line {
        $line.match(/^Year|^19|^20/) && Filter::choose($line, $wanted).join(',').say;
    }
}
