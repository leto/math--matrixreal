BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$vec1 = Math::MatrixReal->new_from_string(<<MAT);
[ 1 ]
[ 2 ]
[ 3 ]
MAT

$vec2 = Math::MatrixReal->new_from_string(<<MAT);
[ 4 ]
[ 5 ]
[ 6 ]
MAT

#orthogonal to both
$vec = $vec1->vector_product($vec2);
ok(2, $vec->scalar_product($vec1) < 1e-6 );
ok(3, $vec->scalar_product($vec2) < 1e-6 );


