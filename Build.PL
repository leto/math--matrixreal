use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Math::MatrixReal',
    license             => 'perl',
    dist_author         => 'Jonathan Leto <jonathan@leto.net>',
    dist_version_from   => 'lib/Math/MatrixReal.pm',
    dist_abstract	=> 'Manipulate NxN matrices of real numbers',
    build_requires => {
        'Test::More' => 0,
    },
    add_to_cleanup      => [ 'Math::MatrixReal-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
