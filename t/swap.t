BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 0 0 0 4 ]
MATRIX

$matrix14 = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 4 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 1 0 0 0 ]
MATRIX

$matrix14_col = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 1 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 4 0 0 0 ]
MATRIX

$matrix->swap_row(1,4);
ok_matrix(2,$matrix,$matrix14);
# back to orig
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 0 0 0 4 ]
MATRIX
$matrix->swap_col(1,4);
ok_matrix(3,$matrix,$matrix14_col);
