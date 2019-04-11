#!/usr/bin/perl
use strict;
use warnings;
#use lib './Product'; #add this or run code with -I{Library folder}  
use ProductMoose;
use Scalar::Util qw/blessed/;

my $iphone = ProductMoose->new({name=>"ali", family=>"deishidi"});
#print $iphone->name;
#print $iphone->my_name;
$iphone->name("new_name");
print $iphone->name;
print $iphone->family;
$iphone->family("new family");
print $iphone->family;



#my $iphone_1 = ProductMoose->new();
#print $iphone_1->name;
#print $iphone_1->my_name;
#print (blessed($iphone)? "yes" : "no");
#print "blessed: ".blessed($iphone);
#print "blessed: ".ref($iphone);
