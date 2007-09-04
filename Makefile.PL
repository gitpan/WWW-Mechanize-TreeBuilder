use inc::Module::Install '0.67';

name            'WWW-Mechanize-TreeBuilder';
all_from        'lib/WWW/Mechanize/TreeBuilder.pm';
license         'perl';

requires        'perl'                           => '5.8.1';
requires        'Moose';
recommends      'HTML::TreeBuilder';

build_requires  'Test::More';
requires        'Test::WWW::Mechanize';

no_index        directory => 't/lib';

WriteAll;
