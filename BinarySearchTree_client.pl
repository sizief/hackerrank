use warnings;
use strict;
use feature qw/say/;
use BinarySearchTree;

my $a = BinarySearchTree->new({value=>50});
$a->insert(76);
$a->insert(21);
$a->insert(4);
$a->insert(32);
$a->insert(100);
$a->insert(64);
$a->insert(52);

say $a->pp;
say $a->left->pp;
say $a->right->pp;
say $a->right->left->pp;

say "size is ".$a->size;
say "x"x50;

say "76: ".$a->find_node(76);
say "21: ".$a->find_node(21);
say "52: ".$a->find_node(52);
say "66: ".$a->find_node(66);

say "x"x50;
my $node52 = $a->get_node(52);
say "give me 52 node value: ".$node52->value;

say "x"x50;
say "remove non existant 66: ".$a->remove_node(66);
say "before romove 76: ";
say $a->right->pp;
say "after remove: ".$a->remove_node(76); 
say $a->right->pp;



