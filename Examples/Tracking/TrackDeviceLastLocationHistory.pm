package TrackDeviceLastLocationHistory;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use DataTypes::OptimizationState;

sub TrackDeviceLastLocationHistory {
    my ($self, $routeId) = @_;

    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $gpsParameters = GPSParameters->new(
        format => Format->Csv,
        route_id => $routeId,
        lat => 33.14384,
        lng => -83.22466,
        course => 1,
        speed => 120,
        device_type => DeviceType->IPhone,
        member_id => 1,
        device_guid => "TEST_GPS",
        device_timestamp => "2014-06-14 17:43:35"
    );

    my $errorString="";
    my $response = $route4Me->setGPS($gpsParameters, $errorString);

    print "\n";

    if (!$response->{'status'}) {
        print "SetGps not available for this account\n";
        return;
    } elsif (!$errorString) {
        printf "SetGps response: %s\n\n", $response;
    } else {
        printf "SetGps error: %s\n\n", $errorString;
        return;
    }

    my $dataObject = $route4Me->getLastLocation({route_id => $routeId, device_tracking_history => 1}, $errorString);

    print "\n";

    if ($dataObject)
    {
        printf "TrackDeviceLastLocationHistory executed successfully";
        print "\n";

        printf "Optimization Problem ID: %s\n", $dataObject->optimization_problem_id;
        printf "State: %s\n", OptimizationState->get_optimization_state($dataObject->state);
        print "\n";

        foreach my $th (@{$dataObject->tracking_history}) {
          printf "Speed: %s\n",      $th->s;
          printf "Longitude: %s\n",  $th->lg;
          printf "Latitude: %s\n",   $th->lt;
          printf "Time Stamp: %s\n", $th->ts_friendly;
          print "\n";
        };
    }
    else
    {
        printf "TrackDeviceLastLocationHistory error: %s\n", $errorString;
    }
}
1;