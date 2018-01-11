use Test::More tests => 4;
use Math::MatrixReal;
use lib 't/lib';
use Test::Matrices qw{ok_matrix};
no lib 't/lib';

my $matrix = Math::MatrixReal->new_diag( [ 1, 2, 3 ] );
my $matrix2 = Math::MatrixReal->new_random(10);

ok_matrix(~$matrix, $matrix, 'transpose of a diagonal matrix is itself');
ok_matrix(~(~$matrix2), $matrix2, 'transpose twice = original' );
ok_matrix( ($matrix2 + ~$matrix2), ~($matrix2 + ~$matrix2), 'transpose commutes with addition' );
ok_matrix( ($matrix2 - ~$matrix2), -~($matrix2 - ~$matrix2), 'transpose commutes with subtraction' );
