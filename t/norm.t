use Test::More tests => 3;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{similar};

my $eps ||= 1e-8;

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 1 ]
[ 0 2 0 0 0 ]
[ 0 0 3 0 0 ]
[ 0 0 0 4 0 ]
[ 1 0 0 0 5 ]
MATRIX
ok( similar($matrix->norm_one ,$matrix->norm_max), 'norm_one works' );

ok( similar($matrix->norm_sum,17), 'norm_sum works' );

$matrix = $matrix->new_from_rows([[1,2],[3,4]]);
ok( similar($matrix->norm_frobenius , sqrt(30)), 'norm_frobenius works' ) ;
