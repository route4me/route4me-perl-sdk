package RemoveAddressBookContacts;
use strict;
use warnings FATAL => 'all';

sub RemoveAddressBookContacts {
    my ($self, $addressIds) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $errorString;
    my $removed = $route4Me->removeAddressBookContacts($addressIds, $errorString);

    print "\n";

    if ($removed)
    {
        printf "RemoveAddressBookContacts executed successfully, %s contacts deleted\n", scalar @$addressIds;
    }
    else
    {
        printf "RemoveAddressBookContacts error: %s\n", $errorString;
    }

}

1;