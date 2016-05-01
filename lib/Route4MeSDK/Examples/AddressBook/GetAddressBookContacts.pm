package GetAddressBookContacts;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::DataTypes::AddressBookParameters;

sub GetAddressBookContacts {
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addressBookParameters = AddressBookParameters->new (
        limit  => 10,
        offset => 0
    );
    my $errorString;
    my $total;
    my @contacts = $route4Me->getAddressBookContacts( $addressBookParameters, \$total, \$errorString );

    print "\n";

    if (@contacts)
    {
        printf "GetAddressBookContacts executed successfully, %s contacts returned, total = %s\n", scalar @contacts, $total;
        print "\n";

    }
    else
    {
        printf "GetAddressBookContacts error: {0}", $errorString;
    }
}

1;
