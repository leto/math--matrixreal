BEGIN { $| = 1; print "1..9\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;

do 'funcs.pl';

my $matrix = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 2 3 ]
[ 2 3 4 ]
[ 4 5 6 ]
MATRIX

my $LR = $matrix->decompose_LR;
ok(1, $LR->is_LR);
my $a = $LR;
my $b = $LR;
$a+=$matrix;
ok(2, ! $a->is_LR);
ok(3, ! ($LR**2)->is_LR );
ok(4, ! (~$LR)->is_LR );
ok(5, ! $LR->inverse->is_LR );
ok(6, ! $LR->cofactor->is_LR );
ok(7, ! $LR->adjoint->is_LR );
ok(8, ! $LR->minor(1,1)->is_LR );
ok(9, $b->is_LR );
