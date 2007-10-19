BEGIN { $| = 1; print "1..2\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
do 'funcs.pl';

my ($a,$b);
$a = Math::MatrixReal->new_from_cols([[ 1.41E-05, 6.82E-06, 3.18E-06 ],[1,3,4]]);
ok(1, $a->as_matlab );
$a = Math::MatrixReal->new_from_cols([[ 1.234, 5.678, 9.1011],[1,2,3]] );
$s1 = $a->as_matlab;
$s2 = $a->as_matlab( ( format => "%5.8s", name => "A" ) );
ok(2, $s1 ne $s2 );
print "$s1\n$s2\n";
