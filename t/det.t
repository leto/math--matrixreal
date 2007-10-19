BEGIN { $| = 1; print "1..7\n"; }
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
ok(2, abs( $matrix->det() - 24) < 10e-6 );
########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 1 0 ]
[ 1 1 1 1 1 ]
MATRIX
ok(3, abs( $matrix->det() - 12) < 10e-6 );
###############################

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 1 0 0 0 ]
[ 0 0 4 0 0 ]
[ 0 0 0 5 0 ]
[ 0 0 0 0 1 ]
MATRIX
ok(4, abs( $matrix->det - 20) < 10e-6 );

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 0 0 ]
[ 0 1 0 0 0 ]
[ 0 0 4 0 0 ]
[ 0 0 0 5 0 ]
[ 0 0 0 0 1 ]
MATRIX
ok(5, $matrix->det() == 0);
##################
## det(A) = det(~A)
$matrix = random_matrix(20);
ok( 6, ((~$matrix)->det - $matrix->det)  < 1e-6 );

############
## det(A^-1) = 1/det(A)
$matrix = random_matrix(20) while ( $matrix->det == 0 );
$inverse = $matrix->inverse();
$det = $matrix->det();
ok( 7, (1/$det - $inverse->det()) < 1e-6 );


############
## det(A) = product of eigenvalues
$matrix = random_matrix(20);
$matrix += ~$matrix;
$det1 = $matrix->det();
my $ev = $matrix->sym_eigenvalues;
my $det2=1;
$ev->each( sub { $det2*=(shift); } );
print "det1: $det1\n";
print "det2: $det2\n";

