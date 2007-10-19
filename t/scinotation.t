BEGIN { $| = 1; print "1..3\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
do 'funcs.pl';

my ($a,$b);
ok(1, $a = Math::MatrixReal->new_from_cols([[ 1.41e-05, 6.82E-06, 3.18e-06 ]]) );
ok(2, $b = Math::MatrixReal->new_from_rows([[ 1.41e-05, 6.82E-06, 3.18e-06 ]]) );
ok(3, ($a -~$b)< 1e-8 );
