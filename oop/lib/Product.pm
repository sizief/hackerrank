package Product;
 
use strict;
use warnings;
 
sub new{
    my ($class, $name) = @_;
    my $self = bless{name=>$name}, $class;
}

sub my_name{
    my $self = shift;
    return $self->{name};
}
 
1;
