# BEGIN LICENSE BLOCK
# 
# Copyright (c) 1996-2003 Jesse Vincent <jesse@bestpractical.com>
# 
# (Except where explictly superceded by other copyright notices)
# 
# This work is made available to you under the terms of Version 2 of
# the GNU General Public License. A copy of that license should have
# been provided with this software, but in any event can be snarfed
# from www.gnu.org.
# 
# This work is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
# 
# Unless otherwise specified, all modifications, corrections or
# extensions to this work which alter its source code become the
# property of Best Practical Solutions, LLC when submitted for
# inclusion in the work.
# 
# 
# END LICENSE BLOCK

# Autogenerated by DBIx::SearchBuilder factory (by <jesse@bestpractical.com>)
# WARNING: THIS FILE IS AUTOGENERATED. ALL CHANGES TO THIS FILE WILL BE LOST.  
# 
# !! DO NOT EDIT THIS FILE !!
#

use strict;


=head1 NAME

RT::Attribute


=head1 SYNOPSIS

=head1 DESCRIPTION

=head1 METHODS

=cut

package RT::Attribute;
use RT::Record; 


use vars qw( @ISA );
@ISA= qw( RT::Record );

sub _Init {
  my $self = shift; 

  $self->Table('Attributes');
  $self->SUPER::_Init(@_);
}





=head2 Create PARAMHASH

Create takes a hash of values and creates a row in the database:

  varchar(255) 'Name'.
  varchar(255) 'Description'.
  text 'Content'.
  varchar(16) 'ContentType'.
  varchar(64) 'ObjectType'.
  int(11) 'ObjectId'.

=cut




sub Create {
    my $self = shift;
    my %args = ( 
                Name => '',
                Description => '',
                Content => '',
                ContentType => '',
                ObjectType => '',
                ObjectId => '',

		  @_);
    $self->SUPER::Create(
                         Name => $args{'Name'},
                         Description => $args{'Description'},
                         Content => $args{'Content'},
                         ContentType => $args{'ContentType'},
                         ObjectType => $args{'ObjectType'},
                         ObjectId => $args{'ObjectId'},
);

}



=head2 id

Returns the current value of id. 
(In the database, id is stored as int(11).)


=cut


=head2 Name

Returns the current value of Name. 
(In the database, Name is stored as varchar(255).)



=head2 SetName VALUE


Set Name to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Name will be stored as a varchar(255).)


=cut


=head2 Description

Returns the current value of Description. 
(In the database, Description is stored as varchar(255).)



=head2 SetDescription VALUE


Set Description to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Description will be stored as a varchar(255).)


=cut


=head2 Content

Returns the current value of Content. 
(In the database, Content is stored as text.)



=head2 SetContent VALUE


Set Content to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, Content will be stored as a text.)


=cut


=head2 ContentType

Returns the current value of ContentType. 
(In the database, ContentType is stored as varchar(16).)



=head2 SetContentType VALUE


Set ContentType to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ContentType will be stored as a varchar(16).)


=cut


=head2 ObjectType

Returns the current value of ObjectType. 
(In the database, ObjectType is stored as varchar(64).)



=head2 SetObjectType VALUE


Set ObjectType to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ObjectType will be stored as a varchar(64).)


=cut


=head2 ObjectId

Returns the current value of ObjectId. 
(In the database, ObjectId is stored as int(11).)



=head2 SetObjectId VALUE


Set ObjectId to VALUE. 
Returns (1, 'Status message') on success and (0, 'Error Message') on failure.
(In the database, ObjectId will be stored as a int(11).)


=cut


=head2 Creator

Returns the current value of Creator. 
(In the database, Creator is stored as int(11).)


=cut


=head2 Created

Returns the current value of Created. 
(In the database, Created is stored as datetime.)


=cut


=head2 LastUpdatedBy

Returns the current value of LastUpdatedBy. 
(In the database, LastUpdatedBy is stored as int(11).)


=cut


=head2 LastUpdated

Returns the current value of LastUpdated. 
(In the database, LastUpdated is stored as datetime.)


=cut



sub _CoreAccessible {
    {
     
        id =>
		{read => 1, type => 'int(11)', default => ''},
        Name => 
		{read => 1, write => 1, type => 'varchar(255)', default => ''},
        Description => 
		{read => 1, write => 1, type => 'varchar(255)', default => ''},
        Content => 
		{read => 1, write => 1, type => 'text', default => ''},
        ContentType => 
		{read => 1, write => 1, type => 'varchar(16)', default => ''},
        ObjectType => 
		{read => 1, write => 1, type => 'varchar(64)', default => ''},
        ObjectId => 
		{read => 1, write => 1, type => 'int(11)', default => ''},
        Creator => 
		{read => 1, auto => 1, type => 'int(11)', default => '0'},
        Created => 
		{read => 1, auto => 1, type => 'datetime', default => ''},
        LastUpdatedBy => 
		{read => 1, auto => 1, type => 'int(11)', default => '0'},
        LastUpdated => 
		{read => 1, auto => 1, type => 'datetime', default => ''},

 }
};


        eval "require RT::Attribute_Overlay";
        if ($@ && $@ !~ qr{^Can't locate RT/Attribute_Overlay.pm}) {
            die $@;
        };

        eval "require RT::Attribute_Vendor";
        if ($@ && $@ !~ qr{^Can't locate RT/Attribute_Vendor.pm}) {
            die $@;
        };

        eval "require RT::Attribute_Local";
        if ($@ && $@ !~ qr{^Can't locate RT/Attribute_Local.pm}) {
            die $@;
        };




=head1 SEE ALSO

This class allows "overlay" methods to be placed
into the following files _Overlay is for a System overlay by the original author,
_Vendor is for 3rd-party vendor add-ons, while _Local is for site-local customizations.  

These overlay files can contain new subs or subs to replace existing subs in this module.

If you'll be working with perl 5.6.0 or greater, each of these files should begin with the line 

   no warnings qw(redefine);

so that perl does not kick and scream when you redefine a subroutine or variable in your overlay.

RT::Attribute_Overlay, RT::Attribute_Vendor, RT::Attribute_Local

=cut


1;
