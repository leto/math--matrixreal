use Test::More tests => 6;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{ok_matrix};
no lib 't/lib';

###############################
## compute A^2 , compare to A*A
my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
my $matrix_squared = $matrix ** 2;
ok_matrix( $matrix * $matrix, $matrix_squared, 'squared' );
#################################
$matrix_squared = $matrix->exponent(2);
ok_matrix( $matrix * $matrix, $matrix_squared, 'exponent' );
#################################
### A^-2 = (A^-1)^2
ok_matrix( ($matrix ** -1) ** 2, $matrix ** -2, 'negative exponent' );
#################################
my $one = $matrix->clone();
$one->one();
ok_matrix( $one , $matrix ** 0, 'one');
#################################
ok_matrix( $one ** 100 , $one, ' identity to any power is still identity');

$matrix **= 2;
ok( $matrix == $matrix_squared, '**= works' );
