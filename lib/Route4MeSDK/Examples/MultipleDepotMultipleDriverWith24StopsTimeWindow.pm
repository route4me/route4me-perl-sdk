package MultipleDepotMultipleDriverWith24StopsTimeWindow;
use strict;
use warnings FATAL => 'all';
sub MultipleDepotMultipleDriverWith24StopsTimeWindow {
    #Create the manager with the api key
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addresses = [
        Address->new( address => '3634 W Market St, Fairlawn, OH 44333',
            is_depot          => 1,
            lat               => 41.135762259364,
            lng               => -81.629313826561,
            time              => 300,
            time_window_start => 28800,
            time_window_end   => 29465 ),

        Address->new( address => '1218 Ruth Ave, Cuyahoga Falls, OH 44221',
            lat               => 41.143505096435,
            lng               => -81.46549987793,
            time              => 300,
            time_window_start => 29465,
            time_window_end   => 30529 ),

        Address->new( address => '512 Florida Pl, Barberton, OH 44203',
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 30529,
            time_window_end   => 33479 ),

        Address->new( address => '512 Florida Pl, Barberton, OH 44203',
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 33479,
            time_window_end   => 33944 ),

        Address->new( address => '3495 Purdue St, Cuyahoga Falls, OH 44221',
            lat               => 41.162971496582,
            lng               => -81.479049682617,
            time              => 300,
            time_window_start => 33944,
            time_window_end   => 34801 ),

        Address->new( address => '1659 Hibbard Dr, Stow, OH 44224',
            lat               => 41.194505989552,
            lng               => -81.443351581693,
            time              => 300,
            time_window_start => 34801,
            time_window_end   => 36366 ),

        Address->new( address => '2705 N River Rd, Stow, OH 44224',
            lat               => 41.145240783691,
            lng               => -81.410247802734,
            time              => 300,
            time_window_start => 36366,
            time_window_end   => 39173 ),

        Address->new( address => '10159 Bissell Dr, Twinsburg, OH 44087',
            lat               => 41.340042114258,
            lng               => -81.421226501465,
            time              => 300,
            time_window_start => 39173,
            time_window_end   => 41617 ),

        Address->new( address => '367 Cathy Dr, Munroe Falls, OH 44262',
            lat               => 41.148578643799,
            lng               => -81.429229736328,
            time              => 300,
            time_window_start => 41617,
            time_window_end   => 43660 ),

        Address->new( address => '367 Cathy Dr, Munroe Falls, OH 44262',
            lat               => 41.148579,
            lng               => -81.42923,
            time              => 300,
            time_window_start => 43660,
            time_window_end   => 46392 ),

        Address->new( address => '512 Florida Pl, Barberton, OH 44203',
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 46392,
            time_window_end   => 48089 ),

        Address->new( address => '559 W Aurora Rd, Northfield, OH 44067',
            lat               => 41.315116882324,
            lng               => -81.558746337891,
            time              => 300,
            time_window_start => 48089,
            time_window_end   => 48449 ),

        Address->new( address => '3933 Klein Ave, Stow, OH 44224',
            lat               => 41.169467926025,
            lng               => -81.429420471191,
            time              => 300,
            time_window_start => 48449,
            time_window_end   => 50152 ),

        Address->new( address => '2148 8th St, Cuyahoga Falls, OH 44221',
            lat               => 41.136692047119,
            lng               => -81.493492126465,
            time              => 300,
            time_window_start => 50152,
            time_window_end   => 51682 ),

        Address->new( address => '3731 Osage St, Stow, OH 44224',
            lat               => 41.161357879639,
            lng               => -81.42293548584,
            time              => 300,
            time_window_start => 51682,
            time_window_end   => 54379 ),

        Address->new( address => '3862 Klein Ave, Stow, OH 44224',
            lat               => 41.167895123363,
            lng               => -81.429973393679,
            time              => 300,
            time_window_start => 54379,
            time_window_end   => 54879 ),

        Address->new( address => '138 Northwood Ln, Tallmadge, OH 44278',
            lat               => 41.085464134812,
            lng               => -81.447411775589,
            time              => 300,
            time_window_start => 54879,
            time_window_end   => 56613 ),

        Address->new( address => '3401 Saratoga Blvd, Stow, OH 44224',
            lat               => 41.148849487305,
            lng               => -81.407363891602,
            time              => 300,
            time_window_start => 56613,
            time_window_end   => 57052 ),

        Address->new( address => '5169 Brockton Dr, Stow, OH 44224',
            lat               => 41.195003509521,
            lng               => -81.392700195312,
            time              => 300,
            time_window_start => 57052,
            time_window_end   => 59004 ),

        Address->new( address => '5169 Brockton Dr, Stow, OH 44224',
            lat               => 41.195003509521,
            lng               => -81.392700195312,
            time              => 300,
            time_window_start => 59004,
            time_window_end   => 60027 ),

        Address->new( address => '458 Aintree Dr, Munroe Falls, OH 44262',
            lat               => 41.1266746521,
            lng               => -81.445808410645,
            time              => 300,
            time_window_start => 60027,
            time_window_end   => 60375 ),

        Address->new( address => '512 Florida Pl, Barberton, OH 44203',
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 60375,
            time_window_end   => 63891 ),

        Address->new( address => '2299 Tyre Dr, Hudson, OH 44236',
            lat               => 41.250511169434,
            lng               => -81.420433044434,
            time              => 300,
            time_window_start => 63891,
            time_window_end   => 65277 ),

        Address->new( address => '2148 8th St, Cuyahoga Falls, OH 44221',
            lat               => 41.136692047119,
            lng               => -81.493492126465,
            time              => 300,
            time_window_start => 65277,
            time_window_end   => 68545 )

    ];

    my $parameters = RouteParameters->new(
        algorithm_type          => AlgorithmType->CVRP_TW_MD,
        route_name              => "Multiple Depot, Multiple Driver with 24 Stops, Time Window",
        store_route             => 0,
        route_date              => time + 3600,
        route_time              => 60 * 60 * 7,

        route_max_duration      => 86400,
        vehicle_capacity        => "1",
        vehicle_max_distance_mi => "10000",

        optimize                => Optimize->Distance,
        distance_unit           => DistanceUnit->MI,
        device_type             => DeviceType->Web,
        travel_mode             => TravelMode->Driving,
        metric                  => Metric->Geodesic
    );

    my $optimizationParameters = OptimizationParameters->new(
        addresses  => $addresses,
        parameters => $parameters
    );

    my $errorString = "";

    my $dataObject = $route4Me->runOptimization( $optimizationParameters, \$errorString );

    ExamplesInfrastructure->PrintExampleOptimizationResult( "MultipleDepotMultipleDriverWith24StopsTimeWindow", $dataObject,
        $errorString );

    return $dataObject;
}
1;