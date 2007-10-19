BEGIN { $| = 1; print "1..9\n"; }
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
[ 0 0 0 0 5 ]
MATRIX
ok(2, $matrix->is_upper_triangular() );
########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 5 0 ]
[ 1 1 1 1 1 ]
MATRIX
ok(3, $matrix->is_lower_triangular() );
#############################
$matrix = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 2 ]
MATRIX
ok(4, ! $matrix->is_upper_triangular() );
ok(5, ! $matrix->is_lower_triangular() );
###############################

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 5 0 ]
[ 1 1 1 1 1 ]
MATRIX
ok(6, ! $matrix->is_lower_triangular() );
ok(7, ! $matrix->is_upper_triangular() );
################################
## diag matrices are both!
$matrix = Math::MatrixReal->new_diag( [ qw(1 2 4 5 5 45 45 5 4) ] );
ok(8, $matrix->is_lower_triangular() );
ok(9, $matrix->is_upper_triangular() );


