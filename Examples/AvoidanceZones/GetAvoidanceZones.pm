package GetAvoidanceZones;
use strict;
use warnings FATAL => 'all';
use QueryTypes::AvoidanceZoneQuery;
sub GetAvoidanceZones {
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $avoidanceZoneQuery = AvoidanceZoneQuery->new();

    my $errorString;

    my @avoidanceZones = $route4Me->getAvoidanceZones($avoidanceZoneQuery, $errorString);

    print "\n";

    if (@avoidanceZones)
    {
        printf "GetAvoidanceZones executed successfully, %s zones returned\n", scalar @avoidanceZones;
    }
    else
    {
        printf "GetAvoidanceZones error: %s\n", $errorString;
    }


}

1;