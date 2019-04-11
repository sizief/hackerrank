use warnings;
use strict;
use Data::Dump qw/pp/;

my @arr;
my $array_length = $ARGV[0];
foreach(0..$array_length){
    push @arr, int(rand($array_length));
}
#my @sorted_arr = sort @arr;
bubble_sort(\@arr);

sub bubble_sort{
    my $arr = shift;
    my $subtitue = 1;
   
    while($subtitue != 0){
        $subtitue = 0;    
        for my $current (0..(scalar(@$arr)-1)){
            next if ($arr->[-1] == $arr->[$current]);
            if ($arr->[$current] > $arr->[$current+1]){
                my $temp = $arr->[$current];
                $arr->[$current] = $arr->[$current+1];
                $arr->[$current+1] = $temp;
                $subtitue++;
            }
        }
    }
    return $arr
}
