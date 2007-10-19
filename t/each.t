BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

###############################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
my $matrix_squared = $matrix->each_diag( sub { (shift)**2 } );;
ok_matrix(2, $matrix * $matrix, $matrix_squared );
################################
$all_ones = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 1 1 1 1 ]
[ 1 1 1 1 1 ]
[ 1 1 1 1 1 ]
[ 1 1 1 1 1 ]
[ 1 1 1 1 1 ]
MATRIX

$matrix->zero();
$matrix = $matrix->each ( sub { (shift) + 1 } );
ok_matrix(3, $matrix, $all_ones );



