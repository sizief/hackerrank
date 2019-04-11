use warnings;
use strict;
use Data::Dump qw/pp/;


sub type_of_polygon{
    my $input = shift;
    my %res;

    map {$res{$_}=1} @$input;
    return scalar(%res);
}

sub how_many{
    my $input = shift;
    my $res = [0,0,0];
    print "type: ".type_of_polygon($input)."\n";
    if (type_of_polygon($input) eq 1){
        $res->[0]++; 
    }elsif(type_of_polygon($input) eq 2){
        $res->[1]++;
    }else{
        $res->[2]++;
   }
   return $res;
}

chomp(my @arr = split / /,<>);
pp how_many(\@arr);
