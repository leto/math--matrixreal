BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

###############################
## 2x2 inverse
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[  3.0  7.0  ]
[  2.0  5.0  ]
MATRIX
$inverse = Math::MatrixReal->new_from_string(<<"MATRIX");
[  5.0 -7.0 ]
[ -2.0  3.0 ]
MATRIX

# will == 8 work everywhere?
ok(2, abs( $matrix->trace() - 8) < 10e-6 );
ok(3, abs($inverse->trace() - 8) < 10e-6 );
