use Test::Simple tests => 5;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;

$matrix = Math::MatrixReal->new_from_string(<<MATRIX);
[  1 0 -1 0  3 ]
[ -1 0  1 1 -3 ]
[  2 0 -2 2  0 ]
MATRIX
$matrix2 = Math::MatrixReal->new_from_string(<<MATRIX);
[  1 0 -1 0  3 ]
[ -1 0  1 1 -3 ]
[  1 1  1 1  1 ]
MATRIX

my $row = $matrix->new(1,5);
$row = $row->each(sub{(shift)+1});
my $result = $matrix->assign_row(3,$row);
ok( ref $result eq 'Math::MatrixReal', 'assign_row returns a the correct object');
ok( abs($matrix-$matrix2) < 1e-8, 'assign_row seems to work' );

my $a = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 3 ]
MATRIX

eval { $result = $matrix->assign_row(3, $a); };
if ($@) {
	ok( 1, 'assign_row fails when number of cols don\'t match');
} else {
	ok( 0, 'assign_row fails when number of cols don\'t match');
}
eval { $result = $matrix->assign_row($a); };
if ($@) {
	ok( 1, 'assign_row fails when not enough args');
} else {
	ok( 0, 'assign_row fails when not enough args');
}
eval { $result = $matrix->assign_row($a,3); };
if ($@) {
	ok( 1, 'assign_row fails when args in wrong order');
} else {
	ok( 0, 'assign_row fails when args in wrong order');
}
