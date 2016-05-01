package MoveDestinationToRoute;
use strict;
use warnings FATAL => 'all';
sub MoveDestinationToRoute {
    my ( $self, $toRouteId, $routeDestinationId, $afterDestinationId ) = @_;

    my $route4Me = Route4MeManager->new(ExamplesInfrastructure->ApiKey);

    my $errorString = "";

    my $success = $route4Me->moveDestinationToRoute($toRouteId, $routeDestinationId, $afterDestinationId, $errorString);

    if ($success) {
        print "MoveDestinationToRoute executed successfully";
        print "\n";
        printf "Destination %s moved to Route %s after Destination %s", , $routeDestinationId, $toRouteId, $afterDestinationId;
        print "\n";
    } else {
        printf "MoveDestinationToRoute error: %s", $errorString;
        print "\n";
    }
    print "\n";
}
1;