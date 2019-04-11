package ProductMoose;
 
use strict;
use warnings;
use Moose;

has 'name' =>(
    is => 'ro',
    default => 'default',
    required => 1
);

has 'family' => (
    is => 'rw'
);

sub my_name{
    my $self = shift;
    return $self->{name};
}
 
1;
