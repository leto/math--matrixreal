use Test::More tests => 5;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 2 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 1 ]
MATRIX
ok( $matrix->decompose_LR->rank_LR == 5, 'matrix has rank 5' );
########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 1 0 ]
[ 1 1 1 1 0 ]
MATRIX
ok( $matrix->decompose_LR->rank_LR == 4, 'matrix has rank 4' );
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 ]
MATRIX
ok($matrix->decompose_LR->rank_LR == 1, 'matrix has rank 1' );
$matrix->zero;
ok($matrix->decompose_LR->rank_LR == 0, 'zero matrix has rank 0' );
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0e-3  ]
[ 0 0 0 0 0.0   ]
[ 0 0 0 0 0.0   ]
[ 0 0 0 0 0.0   ]
[ 0 0 0 0 0.0   ]
MATRIX
ok($matrix->decompose_LR->rank_LR == 1, 'matrix has rank 1' );
