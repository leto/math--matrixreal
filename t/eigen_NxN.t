BEGIN { $| = 1; print "1..16\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";

do 'funcs.pl';

my $DEBUG2 = 0;
my $bigsize = 30; # Size of big matrix tests (be careful: n^3!)

# test on random bigger matrix
print "Matrix ".$bigsize."x$bigsize for eigenvalues & eigenvectors computation:\n" if $DEBUG;
# Creates a random matrix
my $big = random_matrix($bigsize);

#
# Tests eigenvalues & eigenvectors computation
#
$big = $big + ~$big; # Symmetric matrix

print "Householder reduction...\n" if $DEBUG;
my ($Tbig, $Qbig) = $big->householder();
print "Is Qbig orthogonal?\n" if $DEBUG;
ok_matrix_orthogonal(2, $Qbig);
ok_matrix(3, $big, $Qbig * $Tbig * ~$Qbig);
print "Diagonalization of tridiagonal...\n" if $DEBUG;
my ($Lbig, $Vbig) = $Tbig->tri_diagonalize($Qbig);
ok_eigenvectors(4, $big, $Lbig, $Vbig);
ok_matrix_orthogonal(5, $Vbig);

print "Direct diagonalization...\n" if $DEBUG;
my ($Lbig_2, $Vbig_2) = $big->sym_diagonalize();
print "eigenvalues L:\n$Lbig_2 eigenvectors:\n$Vbig_2" if $DEBUG2;
ok_eigenvectors(6,$big, $Lbig_2, $Vbig_2);
ok_matrix_orthogonal(7, $Vbig_2);
# Double check the equality
ok_matrix(8, $Lbig_2, $Lbig);
ok_matrix(9, $Vbig_2, $Vbig);

#
# Now test the eigenvalues only computations...
#
print "Recomputing: Eigenvalues only.\n ".$bigsize."x".$bigsize."\n" if $DEBUG;
my $altTbig = $big->householder_tridiagonal();
ok_matrix(10, $altTbig, $Tbig);
my $altLbig = $altTbig->tri_eigenvalues();
ok_matrix(11, $altLbig, $Lbig);
my $altLbig_2 = $big->sym_eigenvalues();
ok_matrix(12, $altLbig_2, $Lbig_2);

##############
#### lower tri
my $eigen = Math::MatrixReal->new_from_string(<<MAT);
[  0.000000000000E+00 ]
[  3.000000000000E+00 ]
[  4.000000000000E+00 ]
[  5.000000000000E+00 ]
[  1.000000000000E+00 ]
MAT
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 0 0 ]
[ 0 3 0 0 0 ]
[ 0 0 4 0 0 ]
[ 1 0 0 5 0 ]
[ 1 1 1 1 1 ]
MATRIX
ok_matrix(13, $eigen, $matrix->eigenvalues );

$matrix = $eigen->new_from_rows ( [[1,0,0],[0,2,0],[0,0,3]] );
$eigen = $eigen->new_from_string(<<MAT);
[ 1 ]
[ 2 ]
[ 3 ]
MAT
ok_matrix(14, $eigen, $matrix->eigenvalues );

####################
## upper tri
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 2 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 0 0 0 0 5 ]
MATRIX
$eigen = Math::MatrixReal->new_from_string(<<MAT);
[ 1 ]
[ 2 ]
[ 3 ]
[ 4 ]
[ 5 ]
MAT

ok_matrix(15, $eigen, $matrix->eigenvalues );

######################
#### diag
$matrix = $matrix->new_diag ( [ 10, 20, 30 ] );
$eigen =  $matrix->new_from_cols ( [ [ 10, 20, 30 ] ] );
ok_matrix(16, $eigen, $matrix->eigenvalues );


