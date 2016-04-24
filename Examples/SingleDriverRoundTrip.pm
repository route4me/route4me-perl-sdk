package SingleDriverRoundTrip;
use strict;
use warnings FATAL => 'all';
use Data::Dumper;
use DataTypes::TravelMode;

sub SingleDriverRoundTrip {
    my $route4Me = Route4MeManager->new(ExamplesInfrastructure->ApiKey);

    my $addresses = [
        Address->new(address => "754 5th Ave New York, NY 10019", is_depot => 1, alias => "Bergdorf Goodman",
            lat => 40.7636197, lng => -73.9744388, time => 0),
        Address->new(address => "717 5th Ave New York, NY 10022", alias => "Giorgio Armani",
            lat => 40.7669692, lng => -73.9693864, time => 0),
        Address->new(address => "888 Madison Ave New York, NY 10014", alias => "Ralph Lauren Women's and Home",
            lat => 40.7715154, lng => -73.9669241, time => 0),
        Address->new(address => "1011 Madison Ave New York, NY 10075", alias => "Yigal Azrou'l",
            lat => 40.7772129, lng => -73.9669, time => 0),
        Address->new(address => "440 Columbus Ave New York, NY 10024", alias => "Frank Stella Clothier",
            lat => 40.7808364, lng => -73.9732729, time => 0),
        Address->new(address => "324 Columbus Ave #1 New York, NY 10023", alias => "Liana",
            lat => 40.7803123, lng => -73.9793079, time => 0),
        Address->new(address => "110 W End Ave New York, NY 10023", alias => "Toga Bike Shop",
            lat => 40.7753077, lng => -73.9861529, time => 0),
        Address->new(address => "555 W 57th St New York, NY 10019", alias => "BMW of Manhattan",
            lat => 40.7718005, lng => -73.9897716, time => 0),
        Address->new(address => "57 W 57th St New York, NY 10019", alias => "Verizon Wireless",
            lat => 40.7558695, lng => -73.9862019, time => 0)
    ];

    my $parameters = RouteParameters->new(

        algorithm_type => AlgorithmType->TSP,
        store_route => 0,
        route_name => "Single Driver Round Trip",

        route_date    => time + 3600, # check! R4MeUtils.ConvertToUnixTimestamp(DateTime.UtcNow.Date.AddDays(1)),
        route_time    => 60 * 60 * 7,
        route_max_duration => 86400,
        vehicle_capacity => "1",
        vehicle_max_distance_mi => "10000",

        optimize     => Optimize->Distance,
        distance_unit => DistanceUnit->MI,
        device_type   => DeviceType->Web,
        travel_mode => TravelMode->Driving
    );


    my $optimizationParameters = OptimizationParameters->new(
        addresses => $addresses,
        parameters => $parameters
    );

    my $errorString = "";

    my $dataObject = $route4Me->runOptimization($optimizationParameters, \$errorString);

    ExamplesInfrastructure->PrintExampleOptimizationResult("SingleDriverRoundTrip", $dataObject, $errorString);

    return $dataObject;
}
1;