use warnings;
use strict;
use Data::Dump qw/pp/;
use File::Slurp;
use feature qw/say/;

my $sentence = "is kafka ali";
my $book = read_file('book.txt');
print check_validity($book, anagram_hash($sentence));

sub check_validity{
    my ($book, $anagram_hash) = @_;
    my $total;
    
    foreach(values %$anagram_hash){$total +=  $_;}
    foreach (split(/ /, $book)){
        chomp($_);
        my $word = lc($_);
        if (defined($anagram_hash->{$word}) && $anagram_hash->{$word}>0){
            $anagram_hash->{$word}--;
            $total--;
        }
        return 1 if ($total==0);
    }
    return 0
}

sub anagram_hash{
    my $sentence = shift;
    my $hash = {};

    foreach(split(/ /, $sentence)){
        $hash->{lc($_)}++;
    }
    return $hash
}


