package AddAvoidanceZone;
use strict;
use warnings FATAL => 'all';
use Route4MeSDK::QueryTypes::AvoidanceZoneParameters;
use Route4MeSDK::DataTypes::Territory;
use Route4MeSDK::DataTypes::TerritoryType;
sub AddAvoidanceZone {
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $avoidanceZoneParameters = AvoidanceZoneParameters->new(
        territory_name => "Test Territory",
        territory_color => "ff0000",
        territory => Territory->new(
            type => TerritoryType->Circle,
            data => ['37.569752822786455,-77.47833251953125', '5000']
        )
    );

    my $errorString = "";

    my $avoidanceZone = $route4Me->addAvoidanceZone($avoidanceZoneParameters, \$errorString);

    print "\n";

    if ($avoidanceZone) {
        print "AddAvoidanceZone executed successfully\n";

        printf "Territory ID: %s\n", $avoidanceZone->territory_id;

        return $avoidanceZone->territory_id;
    } else {
        printf "AddAvoidanceZone error: %s\n", $errorString;

        return undef;
    }

}

1;
