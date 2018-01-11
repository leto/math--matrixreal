use Test::More tests => 3;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{similar};
no lib 't/lib';

my ($a, $b);
eval { $a = Math::MatrixReal->new_from_cols([[ 1.41e-05, 6.82E-06, 3.18e-06 ]]) };
if ($@){
	ok(0, 'new_from_cols scientific notation fails');
} else {
	ok(1, 'new_from_cols scientific notation works');
}
eval { $b = Math::MatrixReal->new_from_rows([[ 1.41e-05, 6.82E-06, 3.18e-06 ]]) };
if ($@){
	ok(0, 'new_from_rows scientific notation fails');
} else {
	ok(1, 'new_from_rows scientific notation works');
}
ok(similar( $a, ~$b) );
