use Test::More tests => 2;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{ok_matrix};
no lib 't/lib';

my $matrix = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
my $cofactor = Math::MatrixReal->new_from_string(<<MATRIX);
[  6.000000000000E+00 -0.000000000000E+00  0.000000000000E+00 ]
[ -0.000000000000E+00  3.000000000000E+00 -0.000000000000E+00 ]
[  0.000000000000E+00 -0.000000000000E+00  2.000000000000E+00 ]
MATRIX
ok_matrix($matrix->cofactor(), $cofactor, 'cofactor works');

# inverse = adjoint(A)/det(A)
$matrix = Math::MatrixReal->new_random(5);
my $inverse1 = $matrix->inverse;
my $inverse2 = ~($matrix->cofactor)->each( sub { (shift)/$matrix->det() } );
ok_matrix($inverse1,$inverse2, 'inverse is same as the adjoint divided by the determinant');
