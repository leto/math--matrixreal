use Test::More tests => 4;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
use File::Temp 'tempfile';

do 'funcs.pl';

my $matrix = Math::MatrixReal->new_from_string(<<"MATRIX");

    [  1    5    9  ]
    [  2    6   10  ]
    [  3    7   11  ]
    [  4    8   12  ]

MATRIX

my ($fh, $filename) = tempfile();

$matrix->save_to_file($filename);

close $fh;

ok -f $filename, "save_to_file: created output file";

my $other = Math::MatrixReal->new_from_file($filename);

isa_ok $other, 'Math::MatrixReal', "new_from_file: created a Math::MatrixReal object";

ok_matrix($matrix, $other, "new_from_file: loaded matrix is the same!");


assert_dies(sub { Math::MatrixReal->new_from_file(File::Temp::mktemp("tmpfileXXXXX")) },
            "new_from_file: dies on non-existent file");
