use Test::More tests => 7;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';

my $matrix = new Math::MatrixReal (10,10);
$matrix->one;
ok( $matrix->is_idempotent );
ok( $matrix->is_periodic(1) );
$matrix = new Math::MatrixReal (10,5);
ok( !$matrix->is_idempotent );
ok( !$matrix->is_periodic(1) );
$matrix = new Math::MatrixReal (10,10);
$matrix->one;
ok( $matrix->is_periodic(20) );
$matrix->zero;
ok( $matrix->is_periodic(20) );
ok( $matrix->is_idempotent );
