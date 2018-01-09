use Test::More tests => 6;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
ok( $matrix->is_gramian() );
########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 2 0 0 1 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 1 0 0 0 5 ]
MATRIX
ok( ! $matrix->is_gramian() );
#############################
$matrix = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 ]
MATRIX
ok( $matrix->is_gramian() );
################
$matrix = $matrix->new_diag( [ 1, 2, 3, -4 ] );
ok( !$matrix->is_gramian );
###########
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ -1 0 0 0 5 ]
MATRIX
ok( !$matrix->is_gramian );
##########
$matrix->zero;
ok( $matrix->is_gramian );
