BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 2 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 1 ]
MATRIX
ok(2, $matrix->decompose_LR->rank_LR == 5 );
########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 1 0 ]
[ 1 1 1 1 0 ]
MATRIX
ok(3, $matrix->decompose_LR->rank_LR == 4 );
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 ]
MATRIX
ok(4, $matrix->decompose_LR->rank_LR == 1 );
$matrix->zero;
ok(5, $matrix->decompose_LR->rank_LR == 0 );
