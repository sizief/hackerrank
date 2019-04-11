use warnings;
use strict;
use Data::Dump qw/pp/;

sub array_value{
    my $data = shift;
    my @arr = ();
    for(0..26){ push @arr,0;};
    foreach(split(//,lc($data))){
        $arr[ord($_)-ord("a")]++;
    }
    return \@arr
}

sub get_delta{
    my ($first, $last) = @_;
    my $counter;
    my $atleast_one_in_common = 0;

    for(0..(scalar(@$first)-1)){
        $counter += abs($first->[$_]-$last->[$_]);
        $atleast_one_in_common = 1 if ($first->[$_]==$last->[$_] && $first->[$_]>0);
    }
    $counter = "Impossible to Anagram" unless ($atleast_one_in_common);
    return $counter
}


#pp array_value($ARGV[0]);
print get_delta(array_value($ARGV[0]), array_value($ARGV[1]));
