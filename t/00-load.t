use Test::More tests => 1;
use File::Spec::Functions;

BEGIN { use_ok('Math::MatrixReal') }

diag( 'Testing Math::MatrixReal '. $Math::MatrixReal::VERSION . " on $^O, Perl ($^X) $]" );
