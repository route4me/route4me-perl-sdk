package GetAddress;
use strict;
use warnings FATAL => 'all';

use QueryTypes::AddressParameters;

sub GetAddress {
    my ($self, $routeId, $routeDestinationId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addressParameters = AddressParameters->new(
        route_id => $routeId,
        route_destination_id => $routeDestinationId,
        notes => 1
    );

    my $errorString;

    my $dataObject = $route4Me->getAddress($addressParameters, $errorString);

    if ($dataObject) {
        print "GetAddress executed successfully\n";

        printf "RouteId: %s; RouteDestinationId: %s\n\n", $dataObject->route_id, $dataObject->route_destination_id;

    } else {
        printf "GetAddress error: %s\n", $errorString;
    }
}

1;