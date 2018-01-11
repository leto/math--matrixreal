use Test::More tests => 2;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{ok_matrix};
no lib 't/lib';

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 0 0 0 4 ]
MATRIX

my $matrix14 = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 4 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 1 0 0 0 ]
MATRIX

my $matrix14_col = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 1 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 4 0 0 0 ]
MATRIX

$matrix->swap_row(1,4);
ok_matrix($matrix,$matrix14, 'swap_row works');
# back to orig
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 0 0 0 4 ]
MATRIX
$matrix->swap_col(1,4);
ok_matrix($matrix,$matrix14_col, 'swap col works');
