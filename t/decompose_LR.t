use Test::More tests => 2;
use Math::Complex;
use Math::MatrixReal;
use Data::Dumper;

use lib 't/lib';
use Test::Matrices qw{ok_matrix};
no lib 't/lib';

{
    my $a = Math::MatrixReal->new_from_rows([ [ 2 ] ] );

    ok_matrix( $a->decompose_LR->invert_LR, $a->inverse, q{decompose_LR->invert_LR = inverse for 1x1 matrices} );
    ok_matrix( $a->new_from_rows( [[ 1/2 ]]) , $a->inverse, q{decompose_LR works for 1x1 matrices} );

}
