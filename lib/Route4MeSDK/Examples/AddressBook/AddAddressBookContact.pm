package AddAddressBookContact;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::DataTypes::AddressBookContact;

sub AddAddressBookContact {

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $contact = AddressBookContact->new(
        first_name => "Test FirstName " . int(rand(100000)),
        address_1 => "Test Address1 " . int(rand(100000)),
        cached_lat => 38.024654,
        cached_lng => -77.338814
    );

    my $errorString = "";

    my $resultContact = $route4Me->addAddressBookContact($contact, $errorString);

    print "\n";

    if ($resultContact) {
        print "AddAddressBookContact executed successfully\n";

        printf "AddressId: %s\n\n", $resultContact->address_id;

    } else {
        printf "AddAddressBookContact error: %s\n", $errorString;
    }

    return $resultContact;
}

1;
