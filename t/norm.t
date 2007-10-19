BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';
my $eps = 1e-6;

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 1 0 0 0 5 ]
MATRIX
ok(2, abs($matrix->norm_one - $matrix->norm_max) < $eps );

ok(3, abs($matrix->norm_sum - 17) < $eps );

$matrix = $matrix->new_from_rows([[1,2],[3,4]]);
ok(4, abs($matrix->norm_frobenius - sqrt(30)) < $eps ) ;
