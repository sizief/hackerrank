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

sub anagram_hash{
    my $word = shift;
    $word =~ s/\s+//g;
    my $res = {};
    foreach(split(//, $word)){
        $res->{$_}++;
    }
    return $res;
}

sub brute_force{
    my ($list, $word) = @_;
    my @res = ($word);

    foreach my $candidate (@$list){
        next if $word eq $candidate;
        if(identical_hash(anagram_hash($word), anagram_hash($candidate))){
            push @res, $candidate;
        }
    }
    return if (scalar(@res)==1);
    return \@res
}


sub find{
    my $list = shift;
    my @res;
    my @founded_words;
    foreach my $word (@$list){
            next if(grep {/$word/} @founded_words);
            my $temp = brute_force($list, $word);
            next unless (defined($temp));
            push @res, $temp;
            push @founded_words, @$temp;
    }
    return \@res
}

open(my $fh, "<", "anagram.txt");
my @arr;
while(my $text = readline($fh)){
    chomp $text;
    push @arr, $text;
}
#pp brute_force(\@arr, "pear");

pp find(\@arr);
#pp identical_hash({l=>1, i=>1,s=>1,t=>1,e=>1,n=>1},{h=>1, a=> 1,m=>1,l=>1,e=>1,t=>1});
#pp identical_hash({t=>1, h=>1},{h=>1,t=>1});
#pp identical_hash_cmp({b=>2, a=>11},{a=>1, b=> 2});
