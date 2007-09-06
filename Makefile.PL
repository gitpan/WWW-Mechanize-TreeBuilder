use inc::Module::Install;

name            'WWW-Mechanize-TreeBuilder';
all_from        'lib/WWW/Mechanize/TreeBuilder.pm';
license         'perl';

requires        'perl'                           => 5.006000;
requires        'Moose';
requires        'HTML::TreeBuilder';

build_requires  'Test::More';
requires        'Test::WWW::Mechanize';

no_index        directory => 't/lib';

WriteAll;
