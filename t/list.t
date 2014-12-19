use Test::More tests => 2;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;

do 'funcs.pl';

my $matrix = Math::MatrixReal->new_from_rows([ [1, 2], [3, 4] ]);
my @list = $matrix->as_list;

is scalar(@list), 4, "list contains 4 elements";
is_deeply \@list, [1, 2, 3, 4],
    "list contains all elements from initial rows";


