BEGIN { $| = 1; print "1..8\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";

do 'funcs.pl';

my $BENCH = 0; # Some basic benchmarks on operations
my $DEBUG2 = 0;
my $DEBUG = 0;
my $bsize = 100; # For somebenches

#
# Trying some matrixes creation extracted from the pod...
#
my $string = "[ 1 2 3 ]\n[ 2 2 -1 ]\n[ 1 1 1 ]\n";
my $matrix33 = Math::MatrixReal->new_from_string($string);
print "$matrix33" if $DEBUG;
ok(2, (1 == 1));

my $matrix77_b = Math::MatrixReal->new_from_string(<<'MATRIX');
[  1  7  -12  6  -9  0  1  ]
[  0  5  0  0  0  0  0  ]
[  0  0  1  4  0  0  0  ]
[  0  0  0  1  0  0  0  ]
[  12  0  0  0  5  0  4  ]
[  0  3  0  8  0  1  0  ]
[  1  0  0  0  0  0 -5  ]
MATRIX
print "$matrix77_b" if $DEBUG2;
ok(3, (1 == 1));

my $c1 =   2  /  3;
my $c2 =  -2  /  5;
my $c3 =  26  /  9;

my $matrix33_v = Math::MatrixReal->new_from_string(<<"MATRIX");

      [   3    2    0   ]
      [   0    3    2   ]
      [  $c1  $c2  $c3  ]

MATRIX
print "$matrix33_v" if $DEBUG2;
ok(4, (1 == 1));

#
# Now some computations
# TODO: We should indeed check the results...
#
my $product33 = $matrix33->multiply($matrix33_v);
print "product 3x3:\n$product33" if $DEBUG2;
ok(5, (1 == 1));

my $LR_m33 = $product33->decompose_LR();
print "LR 3x3:\n$LR_m33" if $DEBUG2;
ok(6, (1 == 1));


#
# test the LR decomposition
#

my $b = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 ]
[ 1 ]
[ 29 ]
MATRIX
my ($dim,$x,$B, $test);
if (($dim, $x, $B) = $LR_m33->solve_LR($b))
  {
    $test = $product33 * $x;
    if ($DEBUG2) {
      print "x =\n$x";
      print "product33 * x =\n$test";
    }
  }
ok_matrix(7, $test, $b);

my $matrix1 = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 0 0 ]
[ 0 2 0 ]
[ 0 0 3 ]
MATRIX
my $matrix2 = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
ok_matrix(8, $matrix1,$matrix2);



if ($BENCH)
{
    use Benchmark;

    my $tnew = timeit(20, sub { my $M = Math::MatrixReal->new($bsize,$bsize); });
    print "Time to create 20 times an empty ".$bsize."x".$bsize." matrix:\n".timestr($tnew)."\n";

    # Some matrixes for use...
    my $random = random_matrix($bsize);
    my $spare = Math::MatrixReal->new($bsize,$bsize);

    my $Mcopy = $random;
    my $Mcopy2 = $Mcopy->shadow();
    my $tcopy = timeit(20, sub { $Mcopy2->copy($Mcopy); });
    print "Time to copy 20 times a ".$bsize."x".$bsize." matrix:\n".timestr($tcopy)."\n";

    my $Mzero = $spare;
    my $tzero = timeit(20, sub { $Mzero->zero(); });
    print "Time to zero 20 times a ".$bsize."x".$bsize." matrix:\n".timestr($tzero)."\n";

    my $Mone = $spare;
    my $tone = timeit(20, sub { $Mone->one(); });
    print "Time to set 20 times to I a ".$bsize."x".$bsize." matrix:\n".timestr($tone)."\n";

    my $Mnorm1 = $random;
    my $norm1;
    my $tnorm1 = timeit(10, sub { $norm1 = $Mnorm1->norm_one(); });
    print "Time to compute norm_one 10 times for a ".$bsize."x".$bsize." matrix:\n".timestr($tnorm1)."\n";

    my $Mnormmax = $random;
    my $normax;
    my $tnormmax = timeit(10, sub { $normax = $Mnormmax->norm_max(); });
    print "Time to compute norm_max 10 times for a ".$bsize."x".$bsize." matrix:\n".timestr($tnormmax)."\n";

    my $Mneg = $random->clone();
    my $tneg = timeit(10, sub { $Mneg->negate($Mneg); });
    print "Time to negate 10 times a ".$bsize."x".$bsize." matrix:\n".timestr($tneg)."\n";

    my $Mtransp = $random->clone();
    my $ttransp = timeit(10, sub { $Mtransp->transpose($Mtransp); });
    print "Time to transpose 10 times a ".$bsize."x".$bsize." matrix:\n".timestr($ttransp)."\n";

    my $Mmul1 = $random->clone();
    my $Mmul2 = $random->clone();
    my $tmul = timeit(1, sub { $Mmul1->multiply($Mmul2); });
    print "Time to multiply 1 times two ".$bsize."x".$bsize." matrixes:\n".timestr($tmul)."\n";
}
