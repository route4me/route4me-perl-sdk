package DeleteAvoidanceZone;
use strict;
use warnings FATAL => 'all';
use QueryTypes::AvoidanceZoneQuery;

sub DeleteAvoidanceZone {
    my ($self, $territoryId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $avoidanceZoneQuery = AvoidanceZoneQuery->new(
        territory_id => $territoryId
    );

    my $errorString = "";
    $route4Me->deleteAvoidanceZone($avoidanceZoneQuery, $errorString);

    print "\n";

    if ($errorString eq "")
    {
        print "DeleteAvoidanceZone executed successfully.\n";
        printf "Territory ID: %s\n", $territoryId;
    }
    else
    {
        printf "DeleteAvoidanceZone error: %s\n", $errorString;
    }
}

1;