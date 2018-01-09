use Test::More tests => 3;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{ok_matrix};

my $matrix  = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
my $minor11 = Math::MatrixReal->new_from_rows ( [ [2,0],[0,3] ] );
my $minor22 = Math::MatrixReal->new_from_rows ( [ [1,0],[0,3] ] );
my $minor13 = Math::MatrixReal->new_from_rows ( [ [0,2],[0,0] ] );

ok_matrix($matrix->minor(1,1),$minor11, 'minor 1,1');
ok_matrix($matrix->minor(2,2),$minor22, 'minor 2,2');
ok_matrix($matrix->minor(1,3),$minor13, 'minor 1,3');
