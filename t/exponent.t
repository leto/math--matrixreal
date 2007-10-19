BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

###############################
## compute A^2 , compare to A*A
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 0 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
my $matrix_squared = $matrix ** 2;
ok_matrix(2, $matrix * $matrix, $matrix_squared );
#################################
$matrix_squared = $matrix->exponent(2);
ok_matrix(3, $matrix * $matrix, $matrix_squared );
#################################
### A^-2 = (A^-1)^2
ok_matrix(4, ($matrix ** -1) ** 2, $matrix ** -2 );
#################################
my $one = $matrix->clone();
$one->one();
ok_matrix(5, $one , $matrix ** 0);
#################################
### identity to any power is still identity
ok_matrix(6, $one ** 100 , $one );


