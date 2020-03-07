#!perl -T

use 5.014;
use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::StrawViewer' ) || print "Bail out!\n";
}

diag( "Testing WWW::StrawViewer $WWW::StrawViewer::VERSION, Perl $], $^X" );
