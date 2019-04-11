#!/usr/bin/perl

use strict;
use warnings;

# Complete the isBalanced function below.
sub trim{
  my $string = shift;
  $string =~ s/^\s+//;
  $string =~ s/\s+$//;
  return $string;
}

sub isBalanced {
    my @list = split(//,shift);
    my $isBalanced = "YES";
    my @stack;
    my $match;
    foreach(@list){
        if ($_ =~ /{|\[|\(/){
            push @stack, $_;
            next
        }else{
            if (scalar(@stack) == 0){
                $isBalanced = "NO";
                last;
            }
            $match = pop @stack;
            $isBalanced = "NO" if(($_ eq ")") and ($match ne "("));
            $isBalanced = "NO" if(($_ eq "]") and ($match ne "["));
            $isBalanced = "NO" if(($_ eq "}") and ($match ne "{"));
        }
    }
    $isBalanced = "NO" if(scalar(@stack) != 0);
    return $isBalanced
}

open(my $fh, '<', 'brackets_data_1');
while(readline($fh)){
    print isBalanced(trim($_))."\n";
}

