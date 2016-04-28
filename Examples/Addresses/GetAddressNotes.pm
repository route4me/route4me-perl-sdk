package GetAddressNotes;
use strict;
use warnings FATAL => 'all';

sub GetAddressNotes {
    my ($self, $routeId, $addressId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $noteParameters = NoteParameters->new(
        route_id => $routeId,
        address_id => $addressId
    );

    my $errorString = "";
    my @notes = $route4Me->getAddressNotes($noteParameters, $errorString);

    print "\n";

    if (@notes) {
        printf "GetAddressNotes executed successfully, %s notes returned\n\n", scalar @notes;
    } else {
        printf "GetAddressNotes error: %s \n\n", $errorString;
    }

}

1;