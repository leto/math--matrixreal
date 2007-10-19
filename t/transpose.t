BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
$matrix2 = random_matrix(10);

ok_matrix(2, ~$matrix, $matrix);
ok_matrix(3, ~(~$matrix2), $matrix2 );
ok_matrix(4, ($matrix2 + ~$matrix2), ~($matrix2 + ~$matrix2) );


