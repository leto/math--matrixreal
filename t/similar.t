use Test::More tests => 6;
use Math::MatrixReal qw/:all/;
use lib 't/lib';
use Test::Matrices qw{similar};
no lib 't/lib';

my ($x,$y,$z) = (42, 42.0001,42.0000001);

ok ( similar($x,$y, 1e-2 ), 'similar' );
ok (! similar($x,$y, 1e-6 ), 'similar' );
ok (! similar($x,$y), 'similar' );

ok ( similar($y,$z, 1e-3 ), 'similar' );
ok (! similar($y,$z, 1e-8 ), 'similar' );
ok (! similar($y,$z), 'similar' );
