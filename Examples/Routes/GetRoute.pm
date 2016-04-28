package GetRoute;
use strict;
use warnings FATAL => 'all';

sub GetRoute {
    my ($self, $routeId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $routeParameters = RouteParametersQuery->new( {
            route_id => $routeId
        } );

    my $errorString = "";

    my $dataObject = $route4Me->getRoute( $routeParameters, \$errorString );

    print "\n";

    if ($dataObject) {
        print "GetRoute executed successfully\n";
        printf "Route ID: %s\n", $dataObject->route_id;
        printf "State: %s\n", OptimizationState->get_optimization_state( $dataObject->state );
    } else {
        printf "GetRoute error: %s\n", $errorString;
    }
}
1;