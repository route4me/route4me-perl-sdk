package UpdateAddressBookContact;
use strict;
use warnings FATAL => 'all';

sub UpdateAddressBookContact {
    my ($self, $contact) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $errorString;
    my $updatedContact = $route4Me->updateAddressBookContact($contact, $errorString);

    print "\n";

    if ($updatedContact)
    {
        print "UpdateAddressBookContact executed successfully\n";
    }
    else
    {
        printf "UpdateAddressBookContact error: %s\n", $errorString;
    }


}

1;