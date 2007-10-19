BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = random_matrix(20);
$matrix2 = $matrix->shadow();
$matrix2->one();
$matrix3 = $matrix;

ok_matrix(2, $matrix * 2 , $matrix + $matrix );

$matrix3 -= $matrix2;
ok_matrix(3, $matrix3 + $matrix2, $matrix );

$matrix3 = $matrix;
$matrix3 += $matrix2;
ok_matrix(4, $matrix3 - $matrix2, $matrix );

$matrix3 = $matrix;
$matrix3 *= 5;
ok_matrix(5, $matrix3, $matrix * 5);

