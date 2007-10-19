BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = new Math::MatrixReal (10,10);
$matrix->one();
ok(2, $matrix->condition($matrix->inverse) - 1 < 1e-6 );

