use Test::More tests => 2;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal qw/:all/;

do 'funcs.pl';

my ($x,$y) = (7,42);

ok( min($x ,$x + $y ** 2) == $x, 'min works');
ok( max($y,$x * $y) == $x*$y, 'max works');
