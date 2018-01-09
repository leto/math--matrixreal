use Test::More tests => 2;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;

my $a = Math::MatrixReal->new_from_rows([ [1, 2], [-2, 1] ] );
my $b = Math::MatrixReal->new_from_rows([ [1, 2], [3, 1] ] );

ok( $a->is_normal  , 'is_normal');
ok( !$b->is_normal , 'is_normal');
