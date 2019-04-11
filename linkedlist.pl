use warnings;
use strict;
use Data::Dump qw/pp/;
use feature qw/say/; 

sub random_memory_address{
    return int(rand(1000));
}

sub head{
    my $list = shift;
    return $list->{0};
}

sub tail{
    my $list = shift;
    my $current = head($list);
    while($current->{next}){
        $current = $list->{$current->{next}};
    }
    return $current
}

sub create_list{
    my %list;
    $list{0} = {pointer=>0,value=>shift};
    return \%list
}

sub print_list{
    my $list = shift;
    my $current = head($list);
    while ($current->{next}){
        print $current->{value}."->";
        $current = $list->{$current->{next}};
    }
    print $current->{value}."\n";
}

sub list_push{
    my ($list, $value) = @_;
    my $last = tail($list);
    my $new_pointer = random_memory_address(); #anywhere in the memory
    $list->{$new_pointer} = {pointer=>$new_pointer, value => $value};
    $last->{next} = $new_pointer;
}

sub list_pop{
    my $list = shift;
    my $last = tail($list);
    my $current = head($list);
    my $node_before_last;
    
    while($current->{next}){
        $node_before_last = $current if($current->{next} == $last->{pointer});
        $current = $list->{$current->{next}};
    }
    delete $list->{$node_before_last->{next}};
    $node_before_last->{next} = 0;
}

sub list_shift{
    my ($list, $value) = @_;
    

}

sub reverse_list{
    my $list = shift;
    my $new_list = create_list(tail($list)->{value});
    list_pop($list);

    while(head($list)->{next}){
        list_push($new_list, tail($list)->{value});
        list_pop($list);
    }
    list_push($new_list, head($list)->{value});
    return $new_list
}



my $list = create_list(100);
for (101..105){
    list_push($list, $_);
}
print_list($list);
pp $list;
say "pop list"; list_pop($list);
say "pop list"; list_pop($list);
say "pop list"; list_pop($list);
pp $list;
print_list($list);
say "reverse list"; 
print_list reverse_list($list);
