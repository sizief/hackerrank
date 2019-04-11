use strict;
use warnings;
use feature qw/say/;
use Data::Dump qw/pp/;
use Data::Compare;

sub identical_hash{
    my ($first, $second) = @_;
    return 0 if (scalar(%$first) != scalar(%$second));
    foreach(keys %$first){
        return 0 if(!defined($second->{$_}) || !defined($first->{$_}) || $first->{$_} != $second->{$_});
    }
    foreach(keys %$second){
        return 0 if(!defined($second->{$_}) || !defined($first->{$_}) || $first->{$_} != $second->{$_});
    }
    return 1
}

sub identical_hash_cmp{
    my ($first, $second) = @_;
    return Compare($first,$second);
}
                    
#pp identical_hash({b=>2, a=>1},{a=>1, b=> 2});
pp identical_hash_cmp({b=>2, a=>11},{a=>1, b=> 2});
