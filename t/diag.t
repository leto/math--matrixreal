BEGIN { $| = 1; print "1..9\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";

do 'funcs.pl';

##########################
## test to see if is_diagonal works
my $matrix = Math::MatrixReal->new_from_string(<<'MATRIX');
[  1  0  0  0  0  0  0  ]
[  0  5  0  0  0  0  0  ]
[  0  0  1  0  0  0  0  ]
[  0  0  0  1  0  0  0  ]
[  0  0  0  0  5  0  0  ]
[  0  0  0  0  0  1  0  ]
[  0  0  0  0  0  0 -5  ]
MATRIX
ok(2, $matrix->is_diagonal() );
###############################
## make sure it recognizes a matrix that is not diagonal
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
      [  3  0  1  ]
      [  0  3  0  ]
      [  0  0  3  ]
MATRIX
ok(3, ! $matrix->is_diagonal() );
###############################
## see if knows that if it ain't square, it ain't diagonal
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1  0 ]
[ 0  0 ]
[ 0  1 ]
MATRIX
ok(4, ! $matrix->is_diagonal() );
##############################
## 1x1 matrix is diagonal by definition
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 ]
MATRIX
ok(5, $matrix->is_diagonal() );
##############################
### see if is_tridiagonal works
$matrix = Math::MatrixReal->new_from_string(<<'MATRIX');
[  4  7  0  0  0  0  0  ]
[  1  5  2  0  0  0  0  ]
[  0  9  1  3  0  0  0  ]
[  0  0  5  1  8  0  0  ]
[  0  0  0  6  5  3  0  ]
[  0  0  0  0  7  1  4  ]
[  0  0  0  0  0  4 -5  ]
MATRIX
ok(6,$matrix->is_tridiagonal() );
##############################
### this isn't tridiag
$matrix = Math::MatrixReal->new_from_string(<<'MATRIX');
[  2  4  0  0  0  0  9  ]
[  1  5  2  0  0  0  0  ]
[  0  3  1  3  0  0  0  ]
[  0  0  5  1  8  0  0  ]
[  0  0  0  6  5  3  0  ]
[  0  0  0  0  7  1  4  ]
[  0  0  0  0  0  4  2  ]
MATRIX
#print "6: " . $matrix->is_tridiagonal() . "\n";
ok(7, ! $matrix->is_tridiagonal() );
##############################
### 2x2 is always tridiag
$matrix = Math::MatrixReal->new_from_string(<<'MATRIX');
[ 1 1 ]
[ 1 1 ]
MATRIX
ok(8, $matrix->is_tridiagonal() );
###############################
### not quadratic => not tridiag
$matrix = Math::MatrixReal->new_from_string(<<'MATRIX');
[  2  4  0  0  0  0 ]
[  1  5  2  0  0  0 ]
[  0  3  1  3  0  0 ]
[  0  0  5  1  8  0 ]
[  0  0  0  6  5  3 ]
[  0  0  0  0  7  1 ]
[  0  0  0  0  0  4 ]
MATRIX
ok(9, ! $matrix->is_tridiagonal() );


