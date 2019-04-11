#!/usr/bin/perl

use warnings;
use strict;
use feature qw/say/;

chomp(my ($n, $d) = split(/ /, <STDIN>));
chomp(my @a = split / /, <>);

my @new_arr = @a;
for my $i(0..$#a){
    $new_arr[$i-$d]= $a[$i];
}
print "@new_arr";

