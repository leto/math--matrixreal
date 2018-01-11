use strict;
use warnings;
use Test::More tests => 1;

BEGIN { use_ok('Math::MatrixReal') }

diag( 'Testing Math::MatrixReal '. $Math::MatrixReal::VERSION . " on $^O, Perl ($^X) $]" );
