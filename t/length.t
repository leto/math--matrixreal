use Test::More tests => 1;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;

do 'funcs.pl';

my $vec = Math::MatrixReal->new_from_rows([ [ 1, 2, 3 ] ])->row(1);
my $len = (~$vec)->length;
ok( similar($len, sqrt(13)), 'length works' );
