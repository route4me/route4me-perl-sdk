package SetGPSPosition;
use strict;
use warnings FATAL => 'all';
use DataTypes::Format;
use QueryTypes::GPSParameters;
use Data::Dumper;

sub SetGPSPosition{
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

    print Dumper($response);

    if (!$response->{'status'}) {
        print "SetGps not available for this account\n";
    } elsif (!$errorString) {
        printf "SetGps response: %s\n", $response;
    } else {
        printf "SetGps error: %s\n", $errorString;
    }
}
1;