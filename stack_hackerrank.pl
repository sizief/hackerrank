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

my $inputs = <>;
my @first_input = split / /, <>;
my $stack = create_stack($first_input[1]);

for(1..$inputs-1){
    my ($command, $value) = split / /,<>;
    if ($command == 1){
        stack_append($stack, $value);
    }elsif($command == 2){
        stack_delete($stack);
    }else{
        print $stack->{top};
    }
}
