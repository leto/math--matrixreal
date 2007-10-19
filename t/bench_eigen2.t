BEGIN { $| = 1; print "1..4\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";

do 'funcs.pl';

my $DEBUG2 = 0;
# Set this one if you want the REAL benchmarking to be done!
my $REALBENCH = 0;
my $bigsize = 40; # Size of big matrix REAL tests (be careful: n^3!)

use Benchmark;

if ($REALBENCH)
{
# test on random bigger matrix
    print "Matrix ".$bigsize."x$bigsize for eigenvalues & eigenvectors computation:\n" if $DEBUG;
# Creates a random matrix
    my $big = random_matrix($bigsize);

#
# Benchmark eigenvalues & eigenvectors computation
#
    $big = $big + ~$big;

    print "Householder reduction...\n" if $DEBUG;
    my ($Tbig, $Qbig);
    my $t = timeit(1, sub { ($Tbig, $Qbig) = $big->householder(); });
    print "Timing of ".$bigsize."x".$bigsize." Householder transformation:\n  ".timestr($t)."\n";
    print "Is Qbig orthogonal?\n" if $DEBUG;
    print "Diagonalization of tridiagonal...\n" if $DEBUG;
    my ($Lbig, $Vbig);
    my $t2 = timeit(1, sub { ($Lbig, $Vbig) = $Tbig->tri_diagonalize($Qbig); });
    print "Timing of ".$bigsize."x".$bigsize." QL-implicit diagonalization:\n  ".timestr($t2)."\n";

# We check the results anyway (just in case...:-)
    ok_eigenvectors(2, $big, $Lbig, $Vbig);

#
# Now test the eigenvalues only computations...
#
    print "Recomputing: Eigenvalues only.\n ".$bigsize."x".$bigsize."\n" if $DEBUG;
    my $altTbig;
    my $t3 = timeit(1, sub { $altTbig = $big->householder_tridiagonal(); });
    print "Timing of ".$bigsize."x".$bigsize." Householder transformation (tridiag. only):\n  ".timestr($t3)."\n";
    my $altLbig;
    my $t4 = timeit(1, sub { $altLbig = $altTbig->tri_eigenvalues(); });
    print "Timing of ".$bigsize."x".$bigsize." QL-implicit eigenvalues computation:\n  ".timestr($t4)."\n";

# We check the results anyway (just in case...:-)
    ok_matrix(3, $altTbig, $Tbig);
    ok_matrix(4, $altLbig, $Lbig);
}
else
{
    # We don't really do the benchmarks on those
    # in fact, this tests does nothing unless told to...
    ok(2, 1 == 1);
    ok(3, 1 == 1);
    ok(4, 1 == 1);
}


