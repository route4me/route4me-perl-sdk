package UpdateAvoidanceZone;
use strict;
use warnings FATAL => 'all';
use DataTypes::TerritoryType;

sub UpdateAvoidanceZone {
    my ($self, $territoryId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $avoidanceZoneParameters = new AvoidanceZoneParameters(
        territory_id => $territoryId,
        territory_name => "Test Territory Updated",
        territory_color => "ff00ff",
        territory => Territory->new(
          type => TerritoryType->Circle,
          data => ['38.41322259056806,-78.501953234', '3000']
        )
    );

    my $errorString;
    my $avoidanceZone = $route4Me->updateAvoidanceZone($avoidanceZoneParameters, $errorString);

    print "\n";

    if ($avoidanceZone)
    {
        print "UpdateAvoidanceZone executed successfully\n";
        printf "Territory ID: %s\n", $avoidanceZone->territory_id;
    }
    else
    {
        printf "UpdateAvoidanceZone error: %s\n", $errorString;
    }
}

1;