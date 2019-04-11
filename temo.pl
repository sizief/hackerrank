use warnings;
use strict;
use feature qw/say/;

my @arr =("ali", "mat");
pretty_print(\@arr);

sub pretty_print{
    my $input = shift;
    foreach my $aa (@$input){
            #say $aa;
        foreach my $bb (@$input){
                print $bb; # = "test";
                gt
        }
    }
        print "@$input";
}
