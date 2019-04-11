use warnings;
use strict;
use feature qw/say/;

sub recursive{
    my $value = shift;
    my $memo = shift;

    return 1 if($value <= 2);
    $memo->[$value] = recursive($value-2, $memo)+recursive($value-1, $memo) unless ($memo->[$value]);
    return $memo->[$value];
}

sub loop{
    my $value = shift;
    my $first = 0;
    my $second = 1;
    my $third = 0;
    
    while($value){
        $first = $second;
        $second = $third;
        $third = $first + $second;
        $value--;
    }
    return $third
}


#chomp(my $input = <>);
my $input = $ARGV[0];
say recursive($input) if ($ARGV[1] eq 'recursive');
say loop($input) if ($ARGV[1] eq 'loop');
