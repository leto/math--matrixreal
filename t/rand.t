use Test::More tests => 16;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
my ($e,$res) = (0,0);
my $eps = 1e-8;

$matrix = Math::MatrixReal->new_random( 10,10, { integer => 1 } );
ok ( ref $matrix eq 'Math::MatrixReal' , 'new_random returns the correct object' );
my ($rows,$cols) = $matrix->dim;
ok( $rows == 10 && $cols == 10, 'new_random returns the correct size' );
for my $r ( 1 .. $rows ){
   for my $c ( 1 .. $cols ) {
	$e = $matrix->element($r,$c);
	$res += abs( $e-int($e) );
   }
}
ok( $res < $eps, 'new_random option type integer works' );

$matrix = Math::MatrixReal->new_random( 5 );
($rows,$cols) = $matrix->dim;
ok( $rows == 5 && $cols == 5, 'new_random is square if called with one argument' );

($rows,$cols) = (1+int(rand(10)), 1+int(rand(10)) );
$matrix = Math::MatrixReal->new_random( $rows,$cols, { bounded_by => [-$rows, $rows] } );
my $min = $matrix->element(1,1); 
my $max = $min;
for my $r ( 1 .. $rows ){
   for my $c ( 2 .. $cols ) {
	$e = $matrix->element($r,$c);
	$e < $min ? $min = $e :  $e > $max ? $max = $e : 0  ;
   }
}
ok( $min >= -$rows && $max <= $rows, 'new_random option bounded_by works' );


eval { $matrix = Math::MatrixReal->new_random };
if ($@){
	ok(1, 'new_random fails with no args');
} else {
	ok(0, 'new_random fails with no args');
}

eval { $matrix = Math::MatrixReal->new_random(0,17.5) };
if ($@){
	ok(1, 'new_random fails with invalid args');
} else {
	ok(0, 'new_random fails with invalid args');
}

eval { $matrix = Math::MatrixReal->new_random(10,20, { bounded_by => [] } ) };
if ($@){
	ok(1, 'new_random fails with invalid bounded_by');
} else {
	ok(0, 'new_random fails with invalid bounded_by');
}

eval { $matrix = Math::MatrixReal->new_random(10,20, { bounded_by => [1,-1] } ) };
if ($@){
	ok(1, 'new_random fails with invalid bounded_by range');
} else {
	ok(0, 'new_random fails with invalid bounded_by range');
}

eval { $matrix = Math::MatrixReal->new_random(10,20, { symmetric => 1 } ) };
if ($@){
	ok(1, 'new_random fails with rectangular + symmetric');
} else {
	ok(0, 'new_random fails with rectangular + symmetric');
}
eval { $matrix = Math::MatrixReal->new_random(10, { symmetric => 1 } ) };
if ($matrix->is_symmetric ){
	ok(1, 'new_random can do symmetric');
} else {
	ok(0, 'new_random fails with symmetric');
}
eval { $a = Math::MatrixReal->new_random(5, { tridiag => 1, integer => 1 } ) };
if ($a->is_tridiagonal ){
	ok(1, 'new_random with tridiag works');
} else {
	ok(0, 'new_random with tridiag  fails');
}
eval { $a = Math::MatrixReal->new_random(5, { tridiag => 1, symmetric => 1 } ) };
if ($a->is_tridiagonal && $a->is_symmetric ){
	ok(1, 'new_random with tridiag+symmetric works');
} else {
	ok(0, 'new_random with tridiag+symmetric  fails');
}
eval { $matrix = Math::MatrixReal->new_random(10,20, { tridiag => 1 } ) };
if ($@){
	ok(1, 'new_random fails with nonsquare tridiag');
} else {
	ok(0, 'new_random fails with nonsquare tridiag');
}
eval { $matrix = Math::MatrixReal->new_random(10,20, { diag => 1 } ) };
if ($@){
	ok(1, 'new_random fails with nonsquare diag');
} else {
	ok(0, 'new_random fails with nonsquare diag');
}
eval { $a = Math::MatrixReal->new_random(5, { diag => 1, integer => 1 } ) };
if ($a->is_diagonal ){
	ok(1, 'new_random with diag works');
} else {
	ok(0, 'new_random with diag  fails');
}
