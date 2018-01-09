use Test::More tests => 2;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
my $eps = 1e-8;

my $vec1 = Math::MatrixReal->new_from_string(<<MAT);
[ 1 ]
[ 2 ]
[ 3 ]
MAT

my $vec2 = Math::MatrixReal->new_from_string(<<MAT);
[ 4 ]
[ 5 ]
[ 6 ]
MAT

#orthogonal to both
my $vec = $vec1->vector_product($vec2);
ok( $vec->scalar_product($vec1) < $eps, 'vector product is orthogonal' );
ok( $vec->scalar_product($vec2) < $eps ,'vector product is orthogonal');
