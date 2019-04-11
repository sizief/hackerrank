use warnings;
use strict;
use feature qw/say/;
use BinaryTree;

my $a = BinaryTree->new({value=>"a"});
$a->insert_left("b");
$a->insert_right("c");
say $a->pp;

my $b = $a->left;
$b->insert_right("e");
$b->insert_left("d");
say $b->pp;

my $c = $a->right;
$c->insert_right("g");
$c->insert_left("f");
say $c->pp;

say "size is ".$a->size;

say "DFS preOrder is: ".$a->dfs_preorder();
say "DFS inOrder is: ".$a->dfs_inorder();
say "DFS PostOrder is: ".$a->dfs_postorder();
say "BFS is: ".$a->bfs();


#say "value: ".$tree->value;
#say "left: ".(defined($tree->left)? $tree->left : "undef");
#say "right: ".(defined($tree->right)? $tree->right : "undef");

