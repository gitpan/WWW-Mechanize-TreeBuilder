use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../t/lib";

use Test::More tests => 9;

BEGIN { 
  use_ok 'WWW::Mechanize::TreeBuilder';
  use_ok 'MockMechanize';
};

my $mech = MockMechanize->new;

WWW::Mechanize::TreeBuilder->meta->apply($mech);

$mech->get_ok('/', 'Request ok');

ok($mech->has_tree, 'We have a HTML tree');

isa_ok($mech->tree, 'HTML::Element');

is($mech->look_down(_tag => 'p')->as_trimmed_text, 'A para', "Got the right <p> out");

isa_ok($mech->find('h1'), 'HTML::Element', 'Can find an H1 tag');
like($mech->find('title')->as_trimmed_text, qr/\x{2603}/, 'Copes properly with utf8 encoded data'); # Snowman utf8 test

$mech->get_ok('/plain', "Request plain text resource");

ok( !$mech->has_tree, "Plain text content-type has no tree");

