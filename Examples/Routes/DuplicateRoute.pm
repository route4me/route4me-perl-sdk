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

    my $duplicateRecordId = $route4Me->duplicateRoute( $routeParameters, \$errorString );

    print "\n";

    if ($duplicateRecordId) {
        print "DuplicateRoute executed successfully, duplicated route ID: %s\n", $duplicateRecordId;
    } else {
        printf "DuplicateRoute error: %s\n", $errorString;
    }
}

1;