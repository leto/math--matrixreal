use Test::More tests => 4;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
use strict;
do 'funcs.pl';

my $b = Math::MatrixReal->new_from_string(<<XXX);
[ 1 1 0 0 ]
[ 1 2 2 0 ]
[ 0 2 3 3 ]
[ 0 0 3 4 ]
XXX

my $a = Math::MatrixReal->new_tridiag( [1, 2, 3], [1, 2, 3, 4], [1, 2, 3] );
unless ($@){
	ok(1, 'new_tridiag exists');
} else {
	ok(0, 'new_tridiag fails');
}
ok( ref $a eq 'Math::MatrixReal', 'new_tridiag returns correct object' );
ok_matrix( $a, $b, 'new_tridiag seems to work' );
my ($r,$c) = $a->dim;
ok( $r == 4 && $c == 4, 'new_tridiag returns a matrix of the correct size' );
