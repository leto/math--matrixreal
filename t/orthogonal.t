use Test::More tests => 5;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';
my $eps ||= 1e-8;

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 2 2 ]
[ 2 1 -2 ]
[ -2 2 -1 ]
MATRIX

$matrix = $matrix->each( sub { (shift)/3; } );

ok( $matrix->is_orthogonal );
ok( ($matrix**2)->is_orthogonal );
ok( (~$matrix)->is_orthogonal );
ok( $matrix->inverse->is_orthogonal );
# det is +-1
ok( abs(abs($matrix->det) - 1) < $eps );
