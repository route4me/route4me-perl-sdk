package DeleteRoutes;
use strict;
use warnings FATAL => 'all';

sub DeleteRoutes {
    my ($self, @routeIds) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $errorString = "";

    my @deletedRouteIds = $route4Me->deleteRoutes( @routeIds, \$errorString );

    print "\n";

    if (@deletedRouteIds) {
        printf "DeleteRoutes executed successfully, routes deleted: %s\n", scalar @deletedRouteIds;
    } else {
        printf "DeleteRoutes error: %s\n", $errorString;
    }
}

1;