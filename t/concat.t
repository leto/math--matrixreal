use Test::Simple tests =>6;
use Math::MatrixReal;

my $eye = Math::MatrixReal->new_diag([ 1,1,1] );
my $full = Math::MatrixReal->new_from_string(<<MATRIX);
[ 3 4 1 ]
[ 4 3 5 ]
[ 1 2 3 ]
MATRIX
my $eyefull = Math::MatrixReal->new_from_string(<<MATRIX);
[ 3 4 1 1 0 0 ]
[ 4 3 5 0 1 0 ]
[ 1 2 3 0 0 1 ]
MATRIX
my $fulleye = Math::MatrixReal->new_from_string(<<MATRIX);
[ 1 0 0 3 4 1 ]
[ 0 1 0 4 3 5 ]
[ 0 0 1 1 2 3 ]
MATRIX


my $eps = 10^(-6);
my $concat = $eye . $full;
my $concat2= $full. $eye;

# what's the deal with this?
#ok( ref $concat eq "Math::MatrixReal" , 'Concatenation returns the correct object');

my ($r,$c) = ($concat->[1],$concat->[2]);
ok( $r == 3, 'Concatenation preserves number of rows');
ok( $c == 6, 'Concatenation does the right thing for cols');

my $res = $concat - $eyefull;
my $res2= $concat2- $fulleye;

ok(abs($res) < $eps ,'Left Concatenation of matrices with the same number of rows works' );
ok(abs($res2) < $eps,'Right Concatenation of matrices with the same number of rows works' );

my $a = Math::MatrixReal->new_diag([1, 2]);
my $b = Math::MatrixReal->new_diag([1, 2, 3]);

eval { $a . $b };
if ($@){
	ok(1, 'Concatenation of square matrices only');
} else {
	ok(0, 'Concatenation of square matrices only');
}
eval { $a . 1 };
if ($@){
	ok(1, 'Concatenation with scalar fails');
} else {
	ok(0, 'Concatenation with scalar fails');
}

