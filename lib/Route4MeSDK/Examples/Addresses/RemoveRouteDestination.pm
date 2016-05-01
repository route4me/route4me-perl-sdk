package RemoveRouteDestination;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;


sub RemoveRouteDestination {
    my ( $self, $routeId, $destinationId, $errors ) = @_;

    my $route4Me = Route4MeManager->new(ExamplesInfrastructure->ApiKey);

    my $errorString = "";

    my $deleted = $route4Me->removeRouteDestination($routeId, $destinationId, $errorString);

    if ($deleted) {
        print "RemoveRouteDestination executed successfully";
        print "\n";
        printf "Destination ID: %s", $destinationId;
        print "\n";
    } else {
        printf "RemoveRouteDestination error: %s", $errorString;
        print "\n";
    }
    print "\n";
}

1;