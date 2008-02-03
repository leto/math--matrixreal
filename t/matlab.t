use Test::More tests => 2;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
do 'funcs.pl';

my ($a,$b);
$a = Math::MatrixReal->new_from_cols([[ 1.41E-05, 6.82E-06, 3.18E-06 ],[1,3,4]]);
ok( $a->as_matlab eq 
'[ 1.41e-05 1;
 6.82e-06 3;
 3.18e-06 4]'
);
$b = Math::MatrixReal->new_from_cols([[ 1.234, 5.678, 9.1011],[1,2,3]] );
my $s = $b->as_matlab( ( format => "%5.8s", name => "A" ) );

SKIP :  {
	skip "whitespace", 1;

	ok( $s eq 
	'A = [ 1.234 1;
	 5.678 2;
	 9.1011 3]'
	);

}

