package DuplicateRoute;
use strict;
use warnings FATAL => 'all';

sub DuplicateRoute {
    my ($self, $routeId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $routeParameters = RouteParametersQuery->new({
            route_id => $routeId
        });

    my $errorString = "";

    my $duplicatedRouteId = $route4Me->duplicateRoute( $routeParameters, \$errorString );

    print "\n";

    if ($duplicatedRouteId) {
        printf "DuplicateRoute executed successfully, duplicated route ID: %s\n", $duplicatedRouteId;
    } else {
        printf "DuplicateRoute error: %s\n", $errorString;
    }

    return $duplicatedRouteId;
}



1;