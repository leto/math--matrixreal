use Test::More tests => 2;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
do 'funcs.pl';

my $latex1='
$
\left( \begin{array}{cc}
1.234&1 \\
5.678&2 \\
9.1011&3
\end{array} \right)
$';
my $latex2='
$A = $ $
\left( \begin{array}{ll}
1.23&1.00 \\
5.68&2.00 \\
9.10&3.00
\end{array} \right)
$';

SKIP : {
	skip "whitespace", 2;
	my ($a,$b);
	$a = Math::MatrixReal->new_from_cols([[ 1.41E-05, 6.82E-06, 3.18E-06 ],[1,3,4]]);
	ok( $a->as_latex eq $latex1, 'as_latex seems to work');
	$b = Math::MatrixReal->new_from_cols([[ 1.234, 5.678, 9.1011],[1,2,3]] );
	$s = $b->as_latex( ( format => "%.2f", align => "l",name => "A" ) );
	ok( $s eq $latex2, 'as_latex format options seem to work');
}

