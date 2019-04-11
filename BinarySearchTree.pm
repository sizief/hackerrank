package BinarySearchTree;
use Moose;
 
has 'left' =>(is => 'rw');
has 'right' => (is => 'rw');
has 'value' => (is => 'rw');

sub insert{
    my $self = shift;
    my $value = shift;

    if($value <= $self->value){ 
        if ($self->left){
            $self->left->insert($value);
        }else{
            $self->left(BinarySearchTree->new({value=>$value}));
        }
    }else{
        if ($self->right){
           $self->right->insert($value);
        }else{
            $self->right(BinarySearchTree->new({value=>$value}));
        }
    }
}

sub find_node{
    my $self = shift;
    my $value = shift;

    return 't' if $self->value == $value;
    if ($value < $self->value){
        if ($self->left){
            return $self->left->find_node($value);
        }else{
            return 'f';
        }
    }else{
        if ($self->right){
            return $self->right->find_node($value);
        }else{
            return 'f';
        }
    }    
}

sub get_node{
    my $self = shift;
    my $value = shift;

    return $self if $self->value == $value;
    if ($value < $self->value){
        if ($self->left){
            return $self->left->get_node($value);
        }else{
            return 'f';
        }
    }else{
        if ($self->right){
            return $self->right->get_node($value);
        }else{
            return 'f';
        }
    }    
}


sub remove_node{
    my ($self, $value, $parent) = @_;
    
    if($value < $self->value &&  $self->left){
        return $self->left->remove_node($value, $self);
    }elsif($value < $self->value){
        return 'f';
    }elsif($value > $self->value && $self->right){
        return $self->right->remove_node($value,$self);
    }elsif($value > $self->value){
        return 'f';
    }else{

        if (!defined($self->left) && !(defined($self->right))){
            $parent->left(undef) if ($parent->left && $parent->left->value eq $self->value);
            $parent->right(undef) if ($parent->right && $parent->right->value eq $self->value);
        }
        if (defined($self->left) && !(defined($self->right))){
            $parent->left($self->left) if ($parent->left && $parent->left->value eq $self->value);
            $parent->right($self->left) if ($parent->right && $parent->right->value eq $self->value);
        }
        if (!defined($self->left) && (defined($self->right))){
            $parent->left($self->right) if ($parent->left && $parent->left->value eq $self->value);
            $parent->right($self->right) if ($parent->right && $parent->right->value eq $self->value);
        }
        if (defined($self->left) && (defined($self->right))){
            $parent->value($self->right->find_minimum());
            $self->right->remove_node($self->value, $self);
        }
    return 't'
    }
}


sub find_minimum{
    my $self = shift;
    if (defined($self->left)){
        $self->left->find_minimum();
    }else{
        return $self->value;
    }
}


sub pp{
    my $self = shift;
    return "L: ".(defined($self->left)? $self->left->value : "undef").
    " V: ".$self->value.
    " R: ".(defined($self->right)? $self->right->value : "undef");
}

sub size{
    my $self = shift;
    my $size = 1;
    $size += $self->left->size() if (defined($self->left));
    $size += $self->right->size() if (defined($self->right));
    return $size
}


1;
