use Test::More tests => 2;
use Math::MatrixReal;

use lib 't/lib';
use Test::Matrices qw{similar};
no lib 't/lib';

my $vec = Math::MatrixReal->new_from_rows([ [ 1, 2, 3 ] ]);
my $len = (~$vec)->length;
ok( similar($len, sqrt(14)), 'length works for row vector, len=' . $len );

$vec = Math::MatrixReal->new_from_cols([ [ 1, 2, 3 ] ]);
$len = ($vec)->length;
ok( similar($len, sqrt(14)), 'length works for col vector, len=' . $len );
