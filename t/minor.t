BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
$minor11 = Math::MatrixReal->new_from_rows ( [ [2,0],[0,3] ] );
$minor22 = Math::MatrixReal->new_from_rows ( [ [1,0],[0,3] ] );
$minor13 = Math::MatrixReal->new_from_rows ( [ [0,2],[0,0] ] );

ok_matrix(2,$matrix->minor(1,1),$minor11);
ok_matrix(3,$matrix->minor(2,2),$minor22);
ok_matrix(4,$matrix->minor(1,3),$minor13);

