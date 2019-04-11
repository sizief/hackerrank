use warnings;
use strict;
use Data::Dump qw/pp/;

sub make_hash{
    my $data = shift;
    my $ref = {};
    map {$ref->{$_}++} split(//,$data);
    return $ref;
}

my ($first, $last) = (make_hash($ARGV[0]), make_hash($ARGV[1]));
my $counter = 0;

foreach(keys %$first){
    $counter += $first->{$_} if(!defined($last->{$_}) || $last->{$_} != $first->{$_});
}

foreach(keys %$last){
    $counter += $last->{$_} if(!defined($first->{$_}) || $last->{$_} != $first->{$_});
}
print "\n counter: ". $counter;
