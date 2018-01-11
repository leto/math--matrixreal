use Test::More tests => 8;
use Math::MatrixReal qw/:all/;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';

my $a = Math::MatrixReal->new_diag( [ 1, 2, -3 ] );
ok( ! $a->is_positive_definite, 'positive_definite' );

$a = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
ok( $a->is_positive_definite, 'positive_definite' );

$a = Math::MatrixReal->new_diag( [ 1, 2, 0 ] );
ok( ! $a->is_positive_definite, 'positive_definite' );

$a = Math::MatrixReal->new_from_rows( [ [1, 100], [1, 1] ] );
ok( ! $a->is_positive_definite, 'nonsymmetric matrix cannot be positive_definite' );

###

$a = Math::MatrixReal->new_diag( [ 1, 2, -3 ] );
ok( ! $a->is_positive_semidefinite, 'positive_semidefinite' );

$a = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
ok( $a->is_positive_semidefinite, 'positive_semidefinite' );

$a = Math::MatrixReal->new_diag( [ 1, 2, 0 ] );
ok(  $a->is_positive_semidefinite, 'positive_semidefinite' );

$a = Math::MatrixReal->new_from_rows( [ [1, 100], [1, 1] ] );
ok( ! $a->is_positive_semidefinite, 'nonsymmetric matrix cannot be positive_semidefinite' );
