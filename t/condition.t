use Test::More tests => 1;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';

my $matrix = new Math::MatrixReal (10,10);
$matrix->one();
ok( $matrix->condition($matrix->inverse) - 1 < 1e-6, 'identity has condition number = 1' );
