use Test::More tests => 4;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{ok_matrix};
no lib 't/lib';

my $matrix = Math::MatrixReal->new_random(20);
my $matrix2 = $matrix->shadow();
$matrix2->one();
my $matrix3 = $matrix;

ok_matrix( $matrix * 2 , $matrix + $matrix, ' twice a = a + a ' );

$matrix3 -= $matrix2;
ok_matrix( $matrix3 + $matrix2, $matrix, ' subtraction undoes addition' );

$matrix3 = $matrix;
$matrix3 += $matrix2;
ok_matrix($matrix3 - $matrix2, $matrix, ' addition undoes subtraction' );

$matrix3 = $matrix;
$matrix3 *= 5;
ok_matrix( $matrix3, $matrix * 5, 'overloaded *= works' );
