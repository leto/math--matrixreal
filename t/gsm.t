use Test::More tests => 1;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices;
no lib 't/lib';

my $eps = 1e-6;
my $A = Math::MatrixReal->new_from_string(<<"MATRIX");
[  1   2   3  ]
[  5   7  11  ]
[ 23  19  13  ]
MATRIX

my $b  = Math::MatrixReal->new_from_cols([[0, 1, 29 ]] );
my $x0 = Math::MatrixReal->new_from_cols([[1, 1, -1.1 ]] );
my $sol = Math::MatrixReal->new_from_cols([[1, 1, -1 ]] );

SKIP : {
    skip  'solve_GSM ? ', 1;

if ( my $xn = $A->solve_GSM($x0,$b,$eps) ) {
    print $xn;
    ok( ($xn - $sol) < $eps, 'solve_GSM seems to work');
} else {
    ok( 0, 'solve_GSM' );
}

}
