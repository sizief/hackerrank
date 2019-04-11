use warnings;
use strict;
use feature qw/say/;
use Data::Dump qw/pp/;

chomp(my $shift = <>);
chomp(my @arr = split / /, <>);

my @arr_new = @arr;
# a,b,c,d,e
# 0,1,2,3,4
# c,d,e,a,b
# size = 5
# $_ shift index condition final_index
# 0   6     6       F       1
# 1   6     7       F       2
# 2   6     8       F       3
# 3   6     9       F       4
# 4   6     10      F       5

#           Go left
#                         old->new
# 0   2                     2->0
# 1   2                     3->1
# 2   2                     4->2
# 3   2                     5->3  5-size->3
# 4   2                     6->4  6-size->4
#
#           Go Right
#                         old->new
# 0   2                    -2->0
# 1   2                    -1->1
# 2   2                     0->2
# 3   2                     1->3  5-size->3
# 4   2                     2->4  6-size->4
#
sub using_indexes_right{
    my @new_arr;
    $shift = $shift % scalar(@arr); 
    for(0..$#arr){
        my $margin = $_-$shift;
        #$margin -= scalar(@arr) if ($margin >= scalar(@arr));
        $new_arr[$_] = $arr[$margin];
    }
    @arr = @new_arr;
}

sub using_indexes_left{
    my @new_arr;
    $shift = $shift % scalar(@arr); 
    for(0..$#arr){
        my $margin = $shift+$_;
        $margin -= scalar(@arr) if ($margin >= scalar(@arr));
        $new_arr[$_] = $arr[$margin];
    }
    @arr = @new_arr;
}


sub using_pop_shift{
    if ($shift > 0){
        for(0..$shift-1){
            my $tmp = pop @arr;
            unshift(@arr, $tmp);
       }
    }else{
        for(0..(-1*($shift)-1)){
            my $tmp = shift @arr;
            push(@arr, $tmp);
       }
    }
}

using_indexes_right();
#using_indexes_left();
#using_pop_shift();
pp "@arr";

