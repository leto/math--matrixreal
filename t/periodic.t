BEGIN { $| = 1; print "1..8\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

my $matrix = new Math::MatrixReal (10,10);
$matrix->one;
ok(2, $matrix->is_idempotent );
ok(3, $matrix->is_periodic(1) );
$matrix = new Math::MatrixReal (10,5);
ok(4, !$matrix->is_idempotent );
ok(5, !$matrix->is_periodic(1) ); 
$matrix = new Math::MatrixReal (10,10);
$matrix->one;
ok(6, $matrix->is_periodic(20) );
$matrix->zero;
ok(7, $matrix->is_periodic(20) );
ok(8, $matrix->is_idempotent );
