BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 2 2 ]
[ 2 1 -2 ]
[ -2 2 -1 ]
MATRIX

#print $matrix->as_yacas;

$matrix = $matrix->each( sub { (shift)/3; } );

ok(2, $matrix->is_orthogonal );
ok(3, ($matrix**2)->is_orthogonal );
ok(4, (~$matrix)->is_orthogonal );
ok(5, $matrix->inverse->is_orthogonal );
# det is +-1
ok(6, abs(abs($matrix->det) - 1) < 1e-12 );
