BEGIN { $| = 1; print "1..11\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";

do  'funcs.pl';

my $DEBUG2 = 0;

#
# Trying some matrixes creation extracted from the pod...
#
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

#
# Tests eigenvalues & eigenvectors computation
#

#
# Redo things with the 7x7 matrix
#
my $symm2 = $matrix77_b + ~$matrix77_b;
print "Matrix 7x7 for eigenvalues & eigenvectors computation:\n" if $DEBUG;
print "$symm2" if $DEBUG2;
print "Householder reduction...\n" if $DEBUG;
my ($T2, $Q2) = $symm2->householder();
print "T2=\n$T2 Q2=\n$Q2" if $DEBUG2;
print "Is Q2 orthogonal?\n" if $DEBUG;
ok_matrix_orthogonal(2, $Q2);
ok_matrix(3, $symm2, $Q2 * $T2 * ~$Q2);
print "Diagonalization of tridiagonal...\n" if $DEBUG;
my ($L, $V) = $T2->tri_diagonalize($Q2);
print "eigenvalues L:\n$L eigenvectors:\n$V" if $DEBUG2;
ok_eigenvectors(4, $symm2, $L, $V);
print "Direct diagonalization...\n" if $DEBUG;
my ($L_2, $V_2) = $symm2->sym_diagonalize();
print "eigenvalues L:\n$L_2 eigenvectors:\n$V_2" if $DEBUG2;
ok_eigenvectors(5,$symm2, $L_2, $V_2);
ok_matrix_orthogonal(6, $V_2);
# Double check the equality
ok_matrix(7, $L_2, $L);
ok_matrix(8, $V_2, $V);

#
# Now test the eigenvalues only computations...
#
print "Recomputing: Eigenvalues only.\n 7x7\n" if $DEBUG;
my $altT2 = $symm2->householder_tridiagonal();
ok_matrix(9, $altT2, $T2);
my $altL = $altT2->tri_eigenvalues();
ok_matrix(10, $altL, $L);
my $altL_2 = $symm2->sym_eigenvalues();
ok_matrix(11, $altL_2, $L_2);

