BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 2 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
ok(1, $matrix->spectral_radius == 5 );
$matrix->zero();
ok(2, $matrix->spectral_radius == 0 );
$matrix->one();
ok(3, $matrix->spectral_radius == 1 );
$matrix = $matrix->new_from_rows( [ [3,-1],[-1,3] ] );
ok(4, similar($matrix->spectral_radius,4) );
$matrix = $matrix->new_from_rows( [ [1.5,0.5],[.5,1.5] ] );
ok(5, similar($matrix->spectral_radius,2) );



