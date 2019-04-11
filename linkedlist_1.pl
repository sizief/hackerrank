use warnings;
use strict;
use Data::Dump qw/pp/;
use feature qw/say/; 

sub tail{
    my $list = shift;
    while($list->{next}){
        $list = $list->{next};
    }
    return $list
}

sub create_list{
    return {next=>0,value=>shift};
}

sub print_list{
    my $list = shift;
    while ($list->{next}){
        print $list->{value}."->";
        $list = $list->{next};
    }
    print $list->{value}."\n";
}

sub list_push{
    my ($list, $value) = @_;
    my $last = tail($list);
    $last->{next} = {next=>0, value => $value};
}

sub list_pop{
    my $list = shift;
    my $last = tail($list);
    my $node_before_last;
    
    while($list->{next}){
        $node_before_last = $list if($list->{next} == $last);
        $list = $list->{next};
    }
    $node_before_last->{next} = 0;
}

sub list_shift{
    my ($list, $value) = @_;
    return {next=>$list,value=>$value}
}

sub reverse_list{
    my $list = shift;
    my $new_list = create_list(tail($list)->{value});
    list_pop($list);

    while($list->{next}){
        list_push($new_list, tail($list)->{value});
        list_pop($list);
    }
    list_push($new_list, $list->{value});
    return $new_list;
}



my $list = create_list(100);
for (101..115){
    list_push($list, $_);
}
print_list($list);

say "pop list"; list_pop($list);
say "pop list"; list_pop($list);
print_list($list);

say "reverse list"; 
$list = reverse_list($list);
print_list($list);

say "shift list";
$list = list_shift($list, 200);
print_list($list);
