BEGIN { $| = 1; print "1..6\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
do 'funcs.pl';

my ($a,$b);
my $eps = 1e-6;
$a = Math::MatrixReal->new_from_cols([[1,2,3]]);

@n = map { $a->norm_p($_) } qw(1 2 3 4 Inf);
ok(1,1);
ok(2, ($n[0] - 6) < $eps );
ok(3, ($n[1] - sqrt(14) ) < $eps );
ok(4, ($n[2] - 6**(2/3) ) < $eps );
ok(5, ($n[3] - 2**(1/4)*sqrt(7)) < $eps );
ok(6, ($n[4] - 3 ) < $eps );

