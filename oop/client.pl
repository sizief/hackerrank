#!/usr/bin/perl
use strict;
use warnings;
#use lib './Product'; #add this or run code with -I{Library folder}  
use Product;
use Scalar::Util qw/blessed/;

my $iphone = Product->new("Galaxy");
print $iphone->my_name;
#print (blessed($iphone)? "yes" : "no");
#print "blessed: ".blessed($iphone);
#print "blessed: ".ref($iphone);
