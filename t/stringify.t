use Test::More tests => 2;
use File::Spec;
use lib File::Spec->catfile("..","lib");
use Math::MatrixReal;
do 'funcs.pl';

my $correct=<<ERE;
[  1.000000000000E+00  0.000000000000E+00  0.000000000000E+00 ]
[  0.000000000000E+00  2.000000000000E+00  0.000000000000E+00 ]
[  0.000000000000E+00  0.000000000000E+00  3.000000000000E+00 ]
ERE

my $matrix = Math::MatrixReal->new_diag( [ 1, 2, 3] );
my $str = "$matrix";
ok( $str eq $correct, 'stringification');

my $correct2=<<ERE;
[  1.000000000000E+00  0.000000000000E+00  0.000000000000E+00 ]
[  0.000000000000E+00  2.000000000000E+00  0.000000000000E+00 ]
[  0.000000000000E+00  0.000000000000E+00  3.000000000000E+00 ]

Blah blah blah
ERE
my $stuff = $matrix . "\nBlah blah blah\n";
ok( $stuff eq $correct2, 'implied stringification with concat');
