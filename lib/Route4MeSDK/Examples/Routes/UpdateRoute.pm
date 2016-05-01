package UpdateRoute;
use strict;
use warnings FATAL => 'all';

sub UpdateRoute {
    my ($self, $routeId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $parametersNew = RouteParameters->new ({
        route_name => "New name of the route"
        });

    my $routeParameters = RouteParametersQuery->new({
            route_id => $routeId,
            parameters => $parametersNew
        });

    my $errorString = "";

    my $dataObject = $route4Me->updateRoute( $routeParameters, \$errorString );

    print "\n";

    if ($dataObject) {
        print "UpdateRoute executed successfully\n";
        printf "Route ID: %s\n", $dataObject->route_id;
        printf "State: %s\n", OptimizationState->get_optimization_state($dataObject->state);
    } else {
        printf "UpdateRoute error: %s\n", $errorString;
    }
}
1;