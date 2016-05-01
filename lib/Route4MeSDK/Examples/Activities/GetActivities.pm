package GetActivities;
use strict;
use warnings FATAL => 'all';
sub GetActivities {

    my ($self, $routeId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $activityParameters = ActivityParameters->new( {
            route_id => $routeId,
            limit => 10,
            offset => 0
        } );

    my $errorString = "";

    my $dataObject = $route4Me->getActivities( $activityParameters, \$errorString );

    print "\n";

    if ($dataObject) {
        printf "GetActivities executed successfully, %s activities returned\n\n", scalar @{$dataObject->results};

        foreach my $activity (@{$dataObject->results}) {
            printf "Activity ID: %s\n", $activity->activity_id;
        }

    } else {
        printf "GetActivities error: %s\n", $errorString;
    }
}
1;