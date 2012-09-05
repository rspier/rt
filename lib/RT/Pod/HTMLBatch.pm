use strict;
use warnings;

package RT::Pod::HTMLBatch;
use base 'Pod::Simple::HTMLBatch';

use RT::Pod::Search;
use RT::Pod::HTML;

sub new {
    my $self = shift->SUPER::new(@_);
    $self->verbose(0);

    # Per-page output options
    $self->css_flurry(0);          # No CSS
    $self->javascript_flurry(0);   # No JS
    $self->no_contents_links(1);   # No header/footer "Back to contents" links

    # TOC options
    $self->index(1);                    # Write a per-page TOC
    $self->contents_file("index.html"); # Write a global TOC

    $self->html_render_class('RT::Pod::HTML');
    $self->search_class('RT::Pod::Search');

    return $self;
}

sub write_contents_file {
    my ($self, $to) = @_;
    return unless $self->contents_file;

    my $file = join "/", $to, $self->contents_file;
    open my $index, ">", $file
        or warn "Unable to open index file '$file': $!\n", return;

    my $pages = $self->_contents;
    return unless @$pages;

    # Classify
    my %toc;
    for my $page (@$pages) {
        my ($name, $infile, $outfile, $pieces) = @$page;
        my $section = $infile =~ m{/plugins/([^/]+)}    ? "05 Extension: $1"           :
                      $infile =~ m{/local/}             ? '04 Local Documenation'      :
                      $infile =~ m{/(docs|etc)/}        ? '01 User Documentation'      :
                      $infile =~ m{/bin/}               ? '02 Utilities (bin)'         :
                      $infile =~ m{/sbin/}              ? '03 Utilities (sbin)'        :
                      $name   =~ /^RT::Action/          ? '08 Actions'                 :
                      $name   =~ /^RT::Condition/       ? '09 Conditions'              :
                      $name   =~ /^RT(::|$)/            ? '07 Developer Documentation' :
                                                          '06 Miscellaneous'           ;

        if ($section =~ /User/) {
            $name =~ s/_/ /g;
            $name = join "/", map { ucfirst } split /::/, $name;
        }

        (my $path = $outfile) =~ s{^\Q$to\E/?}{};

        push @{ $toc{$section} }, {
            name => $name,
            path => $path,
        };
    }

    # Write out index
    print $index "<dl class='superindex'>\n";

    for my $key (sort keys %toc) {
        next unless @{ $toc{$key} };

        (my $section = $key) =~ s/^\d+ //;
        print $index "<dt>", esc($section), "</dt>\n";
        print $index "<dd>\n";

        for my $page (sort { $a->{name} cmp $b->{name} } @{ $toc{$key} }) {
            print $index "  <a href='", esc($page->{path}), "'>",
                                esc($page->{name}),
                           "</a><br>\n";
        }
        print $index "</dd>\n";
    }
    print $index '</dl>';

    close $index;
}

sub esc {
    Pod::Simple::HTMLBatch::esc(@_);
}

1;
