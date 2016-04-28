package ReoptimizeRoute;
use strict;
use warnings FATAL => 'all';

sub ReoptimizeRoute {
    my ($self, $routeId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $routeParameters = RouteParametersQuery->new({
            route_id => $routeId,
            reoptimize => 1
        });

    my $errorString = "";

    my $dataObject = $route4Me->updateRoute( $routeParameters, \$errorString );

    print "\n";

    if ($dataObject) {
        print "ReoptimizeRoute executed successfully\n";
        printf "Route ID: %s\n", $dataObject->route_id;
        printf "State: %s\n", OptimizationState->get_optimization_state($dataObject->state);
    } else {
        printf "ReoptimizeRoute error: %s\n", $errorString;
    }
}

1;