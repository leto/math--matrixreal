BEGIN { $| = 1; print "1..8\n"; }
END {print "not ok 1\n" unless $loaded;}
use Math::MatrixReal;
$loaded = 1;
print "ok 1\n";
my $DEBUG = 0;

do 'funcs.pl';

$matrix1 = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 1 0 0 0 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 0 0 0 4 ]
MATRIX

$matrix2 = Math::MatrixReal->new_from_string(<<"MATRIX");
[ 0 0 0 4 ]
[ 0 2 0 0 ]
[ 0 0 3 0 ]
[ 1 0 0 0 ]
MATRIX

$rowvec = $matrix1->row(1);
$colvec = $matrix2->column(2);
$s = $rowvec->column(1);

ok(2, ! $matrix1->is_row_vector );
ok(3, ! $matrix1->is_col_vector );
ok(4, ! $matrix2->is_row_vector );
ok(5, ! $matrix2->is_col_vector );
ok(6,  $rowvec->is_row_vector );
ok(7,  $colvec->is_col_vector );
ok(8, $s->is_row_vector && $s->is_col_vector );


