
# Autogenerated by DBIx::SearchBuilder factory (by <jesse@bestpractical.com>)
# WARNING: THIS FILE IS AUTOGENERATED. ALL CHANGES TO THIS FILE WILL BE LOST.  
# 
# !! DO NOT EDIT THIS FILE !!
#


=head1 NAME

  RT::FM::CustomFieldCollection -- Class Description
 
=head1 SYNOPSIS

  use RT::FM::CustomFieldCollection

=head1 DESCRIPTION


=head1 METHODS

=cut

package RT::FM::CustomFieldCollection;

use RT::FM::SearchBuilder;
use RT::FM::CustomField;

use base qw(RT::FM::SearchBuilder);


sub _Init {
    my $self = shift;
    $self->{'table'} = 'fm_CustomFields';
    $self->{'primary_key'} = 'id';



  # By default, order by name
  $self->OrderBy( ALIAS => 'main',
                  FIELD => 'SortOrder',
                  ORDER => 'ASC');

    return ( $self->SUPER::_Init(@_) );
}


=item NewItem

Returns an empty new RT::FM::CustomField item

=cut

sub NewItem {
    my $self = shift;
    return(RT::FM::CustomField->new($self->CurrentUser));
}

        eval "require RT::FM::CustomFieldCollection_Overlay";
        if ($@ && $@ !~ /^Can't locate/) {
            die $@;
        };

        eval "require RT::FM::CustomFieldCollection_Local";
        if ($@ && $@ !~ /^Can't locate/) {
            die $@;
        };




=head1 SEE ALSO

This class allows "overlay" methods to be placed
into the following files _Overlay is for a System overlay by the original author,
while _Local is for site-local customizations.  

These overlay files can contain new subs or subs to replace existing subs in this module.

If you'll be working with perl 5.6.0 or greater, each of these files should begin with the line 

   no warnings qw(redefine);

so that perl does not kick and scream when you redefine a subroutine or variable in your overlay.

RT::FM::CustomFieldCollection_Overlay, RT::FM::CustomFieldCollection_Local

=cut


1;
