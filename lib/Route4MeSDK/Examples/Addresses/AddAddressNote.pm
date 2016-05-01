package AddAddressNote;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::QueryTypes::NoteParameters;
use Route4MeSDK::DataTypes::StatusUpdateType;

sub AddAddressNote {
    my ($self, $routeId, $addressId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $noteParameters = NoteParameters->new(
        route_id => $routeId,
        address_id => $addressId,
        dev_lat => 33.132675170898,
        dev_lng => -83.244743347168,
        device_type => DeviceType->Web,
        strUpdateType => StatusUpdateType->DropOff
    );

    my $errorString = "";

    my $contents = "Test Note Contents " . localtime();

    my $note = $route4Me->addAddressNote($noteParameters, $contents, $errorString);

    if ($note) {
        print "AddAddressNote executed successfully\n";

        printf "Note ID: %s\n\n", $note->{'note_id'};

    } else {
        printf "AddAddressNote error: %s\n", $errorString;
    }
}

1;
