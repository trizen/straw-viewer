package WWW::StrawViewer::VideoCategories;

use utf8;
use 5.014;
use warnings;

=head1 NAME

WWW::StrawViewer::VideoCategories - videoCategory resource handler.

=head1 SYNOPSIS

    use WWW::StrawViewer;
    my $obj = WWW::StrawViewer->new(%opts);
    my $cats = $obj->video_categories();

=head1 SUBROUTINES/METHODS

=cut

sub _make_videoCategories_url {
    my ($self, %opts) = @_;

    $self->_make_feed_url(
                          'videoCategories',
                          hl => $self->get_hl,
                          %opts,
                         );
}

=head2 video_categories()

Return video categories for a specific region ID.

=cut

sub video_categories {
    my ($self) = @_;

    require File::Spec;

    my $region = $self->get_region() // 'US';
    my $url    = $self->_make_videoCategories_url(region => $region);
    my $file   = File::Spec->catfile($self->get_config_dir, "categories-$region-" . $self->get_hl() . ".json");

    my $json;
    if (open(my $fh, '<:utf8', $file)) {
        local $/;
        $json = <$fh>;
        close $fh;
    }
    else {
        $json = $self->lwp_get($url, simple => 1);
        open my $fh, '>:utf8', $file;
        print {$fh} $json;
        close $fh;
    }

    return $self->parse_json_string($json);
}

=head2 video_category_id_info($cagegory_id)

Return info for the comma-separated specified category ID(s).

=cut

sub video_category_id_info {
    my ($self, $id) = @_;
    return $self->_get_results($self->_make_videoCategories_url(id => $id));
}

=head1 AUTHOR

Trizen, C<< <echo dHJpemVuQHByb3Rvbm1haWwuY29tCg== | base64 -d> >>


=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::StrawViewer::VideoCategories


=head1 LICENSE AND COPYRIGHT

Copyright 2013-2015 Trizen.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See L<http://dev.perl.org/licenses/> for more information.

=cut

1;    # End of WWW::StrawViewer::VideoCategories
