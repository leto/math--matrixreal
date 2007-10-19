BEGIN { $| = 1; print "1..5\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

###############################
## compute a 2x2 inverse
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[  3.0  7.0  ]
[  2.0  5.0  ]
MATRIX
$inverse = Math::MatrixReal->new_from_string(<<"MATRIX");
[  5.0 -7.0 ]
[ -2.0  3.0 ]
MATRIX
ok_matrix(2, $matrix ** -1 , $inverse );
################################
## A*A^-1 should = indentity
$matrix = random_matrix(20);
$one = $matrix->clone();
$one->one();
ok_matrix(3, $matrix * $matrix ** -1, $one );
#################################
## inverse of identity is identity
ok_matrix(4, $one, $one ** -1 );
#############
ok_matrix(5, $matrix->inverse->inverse, $matrix );

### numerically instable
#my $a = random_matrix(10);
#my $b = random_matrix(10);
#ok_matrix(6, ($a*$b)->inverse, ($b->inverse * $a->inverse) );

