use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'QVD::VMA::SlaveClient',
    license             => 'gpl',
    dist_author         => q{QVD Team <qvd@qindel.com>},
    dist_version        => '3.3',
    dist_abstract    	=> 'QVD::VMA::SlaveClient',
    configure_requires => { 'Module::Build' => 0.38  },
    build_requires => {
        'Test::More'       => 0,
    },
    add_to_cleanup      => [ 'QVD-VMA-SlaveClient-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
