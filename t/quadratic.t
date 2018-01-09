use Test::More tests => 3;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 1 0 0 0 5 ]
MATRIX
ok( $matrix->is_quadratic(), 'matrix is quadratic (square)' );
########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 2 0 0 1 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 1 0 0 0 5 ]
MATRIX
ok(! $matrix->is_quadratic(), 'matrix is rectangular' );
#############################
$matrix = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 ]
MATRIX
ok( $matrix->is_square(), '1x1 matrix is square' );
