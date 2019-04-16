use warnings;
use strict;
use Data::Dump qw/pp/;
use feature qw/say/;

my @arr;
#my $array_length = $ARGV[0];
#foreach(0..$array_length){
#    push @arr, int(rand($array_length));
#}
my @aa = (2,3,4,5,6,7,2,3,4,5,55,2);
merge_sort(\@aa);
pp @aa;
#pp divide($temp->[0]);

sub merge_sort{
    my $arr = shift;
    return if (scalar(@$arr) == 1);
    my $middle = int(scalar(@$arr)/2);
    my @left = @$arr[0..$middle-1];
    my @right = @$arr[$middle..(scalar(@$arr)-1)];
    
    merge_sort(\@left);
    merge_sort(\@right);

    merge(\@left, \@right, $arr);
}

sub merge {

    my ($a_ref, $b_ref, $arr) = @_;

    my ($i, $j, $r) = (0, 0, 0);

    while ( $i < @$a_ref and $j < @$b_ref ) {

        if ( $a_ref->[$i] < $b_ref->[$j] ) {
            $arr->[$r++] = $a_ref->[$i++];
        }
        else {
            $arr->[$r++] = $b_ref->[$j++];
        }
    }

    $arr->[$r++] = $a_ref->[$i++] while $i < @$a_ref;
    $arr->[$r++] = $b_ref->[$j++] while $j < @$b_ref;
}
