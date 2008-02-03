use Test::More tests => 5;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
do 'funcs.pl';


###############################
## compute a 2x2 inverse
$matrix = Math::MatrixReal->new_from_string(<<"MATRIX");
[  3.0  7.0  ]
[  2.0  5.0  ]
MATRIX
$inverse = Math::MatrixReal->new_from_string(<<"MATRIX");
[  5.0 -7.0 ]
[ -2.0  3.0 ]
MATRIX
ok_matrix( $matrix ** -1 , $inverse, '** -1 = inverse ' );
################################
## A*A^-1 should = indentity
$matrix = Math::MatrixReal->new_random(20);
$one = $matrix->clone();
$one->one();
ok_matrix($matrix * $matrix ** -1, $one );
#################################
## inverse of identity is identity
ok_matrix( $one, $one ** -1 );
#############
ok_matrix( $matrix->inverse->inverse, $matrix );

my $a = Math::MatrixReal->new_random(5);
my $b = Math::MatrixReal->new_random(5);
ok_matrix( ($a*$b)->inverse, ($b->inverse * $a->inverse) );

