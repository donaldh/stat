use v6;

unit module Filter;

use CSV;

our sub choose($line, $wanted) {
    my $parsed = CSV::Parser.parse($line);
    my @cols = $parsed.made;
    my @wanted = $wanted.split(',');
    @cols[@wanted]
}
