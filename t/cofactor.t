BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
$cofactor = Math::MatrixReal->new_from_string(<<MATRIX);
[  6.000000000000E+00 -0.000000000000E+00  0.000000000000E+00 ]
[ -0.000000000000E+00  3.000000000000E+00 -0.000000000000E+00 ]
[  0.000000000000E+00 -0.000000000000E+00  2.000000000000E+00 ]
MATRIX
ok_matrix(2,$matrix->cofactor(), $cofactor);

# inverse = adjoint(A)/det(A)
$matrix = random_matrix(5);
my $inverse1 = $matrix->inverse;
my $inverse2 = ~($matrix->cofactor)->each( sub { (shift)/$matrix->det() } );
ok_matrix(3,$inverse1,$inverse2);

