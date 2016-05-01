package SingleDriverRoute10Stops;
use strict;
use warnings FATAL => 'all';
use JSON;

use Data::Dumper;

sub SingleDriverRoute10Stops {
    my $route4Me = Route4MeManager->new(ExamplesInfrastructure->ApiKey);

    my $addresses = [
        Address->new(address => "151 Arbor Way Milledgeville GA 31061", is_depot => 1, lat => 33.132675170898,
                        lng => -83.244743347168, time => 0, custom_fields => {'color' => 'red', 'size' => 'huge'}),
        Address->new(address => "230 Arbor Way Milledgeville GA 31061", lat => 33.129695892334, lng => -83.24577331543, time => 0),
        Address->new(address => "148 Bass Rd NE Milledgeville GA 31061", lat => 33.143497, lng => -83.224487, time => 0),
        Address->new(address => "117 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.141784667969, lng => -83.237518310547, time => 0),
        Address->new(address => "119 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.141086578369, lng => -83.238258361816, time => 0),
        Address->new(address => "131 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.142036437988, lng => -83.238845825195, time => 0),
        Address->new(address => "138 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.14307, lng => -83.239334, time => 0),
        Address->new(address => "139 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.142734527588, lng => -83.237442016602, time => 0),
        Address->new(address => "145 Bill Johnson Rd NE Milledgeville GA 31061", lat => 33.143871307373, lng => -83.237342834473, time => 0),
        Address->new(address => "221 Blake Cir Milledgeville GA 31061", lat => 33.081462860107, lng => -83.208511352539, time => 0)
    ];


    my $parameters = RouteParameters->new(

        algorithm_type => AlgorithmType->TSP,
        store_route => 0,
        route_name => "Single Driver Route 10 Stops",

        route_date    => time, # check! R4MeUtils.ConvertToUnixTimestamp(DateTime.UtcNow.Date.AddDays(1)),
        route_time    => 60 * 60 * 7,
        optimize     => Optimize->Distance,
        distance_unit => DistanceUnit->MI,
        device_type   => DeviceType->Web
    );


    my $optimizationParameters = OptimizationParameters->new(
        addresses => $addresses,
        parameters => $parameters
    );

    my $errorString = "";
    my $dataObject = $route4Me->runOptimization($optimizationParameters, \$errorString);

    ExamplesInfrastructure->PrintExampleOptimizationResult("SingleDriverRoute10Stops", $dataObject, $errorString);

    return $dataObject;
}


1;