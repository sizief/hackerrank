use warnings;
use strict;
use Data::Dump qw/pp/;

sub create_stack{
    my $value = shift;
    my @arr;
    push @arr, $value;
    return {data=>\@arr,top=>$value}
}

sub stack_append{
    my ($stack, $value) = @_;
    push @{$stack->{data}}, $value;
    $stack->{top} = $value;
}


sub stack_delete{
    my $stack = shift;
    pop @{$stack->{data}};
    $stack->{top} = @{$stack->{data}}[-1];
}

my $stack = create_stack(3);
pp $stack;
 
stack_append($stack, 4);
stack_append($stack, 7);
stack_append($stack, 6);
pp $stack;

stack_delete($stack);
pp $stack;

