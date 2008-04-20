use Test::More tests => 1;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::Complex;
use Math::MatrixReal;
use Data::Dumper;

do 'funcs.pl';

{
    my $a = Math::MatrixReal->new_from_rows([ [ 2 ] ] );

    ok_matrix( $a->decompose_LR->invert_LR, $a->inverse, q{decompose_LR works for 1x1 matrices} );
}



