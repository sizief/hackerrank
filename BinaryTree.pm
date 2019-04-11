package BinaryTree;
use Moose;
 
has 'left' =>(is => 'rw');
has 'right' => (is => 'rw');
has 'value' => (is => 'rw');

sub insert_left{
    my ($self, $value) = @_;
    unless ($self->left){ #it does not have left node
        $self->left(BinaryTree->new({value=> $value}));
    }else{ #it does left, push current one one depth below
        my $node = BinaryTree->new({value=> $value});
        $node->left($self->left);
        $self->left($node);
    }
}

sub insert_right{
    my ($self, $value) = @_;
    unless($self->right){
        $self->right(BinaryTree->new({value => $value}));
    }else{
        my $node = BinaryTree->new({value => $value});
        $node->right($self->right);
        $self->right($node);
    }
}

sub dfs_preorder{ #top/left/right
    my $self = shift;
    my @res;
    push @res, $self->value;
    push @res, $self->left->dfs_preorder() if (defined($self->left));
    push @res, $self->right->dfs_preorder() if (defined($self->right));
    return join("",@res)
}

sub dfs_inorder{#left/top/right
    my $self = shift;
    my @res;
    push @res, $self->left->dfs_inorder() if (defined($self->left));
    push @res, $self->value;
    push @res, $self->right->dfs_inorder() if (defined($self->right));
    return join("",@res)
}

sub dfs_postorder{#left/right/top
    my $self = shift;
    my @res;
    push @res, $self->left->dfs_postorder() if (defined($self->left));
    push @res, $self->right->dfs_postorder() if (defined($self->right));
    push @res, $self->value;
    return join("",@res)
}

sub bfs{
    my $self = shift;
    my @arr;
    push @arr, $self->value unless(shift);
    push @arr, $self->left->value if (defined($self->left));
    push @arr, $self->right->value if (defined($self->right));
    push @arr, $self->left->bfs("s") if (defined($self->left));
    push @arr, $self->right->bfs("s") if (defined($self->left));
    return join("",@arr)
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
