BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix1 = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 2 3 ]
[ 4 5 6 ]
[ 7 8 9 ]
MATRIX
$matrix2 = Math::MatrixReal->new_from_rows( [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8 ,9 ] ] );
ok_matrix(2, $matrix1,$matrix2);
##################################
$matrix3 =  Math::MatrixReal->new_from_cols( [ [ 1, 4, 7], [ 2, 5, 8], [3, 6, 9] ] );
ok_matrix(3, $matrix1,$matrix3);

