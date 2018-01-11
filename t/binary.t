use Test::More tests => 4;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 2 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
ok( ! $matrix->is_binary, 'matrix is not binary' );
$matrix->one();
ok($matrix->is_binary, 'identity matrix is binary' );
$matrix->zero();
ok($matrix->is_binary, 'zero matrix is binary' );
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
MATRIX
ok($matrix->is_binary, 'vector is binary');
