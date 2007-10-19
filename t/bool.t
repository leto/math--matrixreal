BEGIN { $| = 1; print "1..13\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 2 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 1 ]
MATRIX
ok(2, !$matrix->is_positive );
ok(3, !$matrix->is_negative );
ok(4, $matrix );

########################
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 1 0 ]
[ 1 1 1 1 1 ]
MATRIX
$matrix = $matrix->each( sub { (shift)+1; } );
ok(5, $matrix->is_positive );
ok(6, !$matrix->is_negative );
ok(7, $matrix );
$matrix = $matrix->each( sub { (shift)-11; } );
ok(8, !$matrix->is_positive );
ok(9, $matrix->is_negative );
ok(10, $matrix );
$matrix->zero;
ok(11, !$matrix->is_positive );
ok(12, !$matrix->is_negative );
ok(13, !$matrix );


