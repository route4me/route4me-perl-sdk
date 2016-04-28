package GetRoutes;
use strict;
use warnings FATAL => 'all';
sub GetRoutes {

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $routeParameters = RouteParametersQuery->new( {
            limit => 10,
            offset => 5
        } );

    my $errorString = "";

    my @dataObject = $route4Me->getRoutes( $routeParameters, \$errorString );

    print "\n";

    if (@dataObject) {
        printf "GetRoutes executed successfully, %s routes returned\n\n", scalar @dataObject;

        foreach my $route (@dataObject) {
            printf "Route ID: %s\n", $route->route_id;
        }

    } else {
        printf "GetRoutes error: %s\n", $errorString;
    }
}
1;