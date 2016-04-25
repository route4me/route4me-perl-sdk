package MultipleDepotMultipleDriver;
use strict;
use warnings FATAL => 'all';

sub MultipleDepotMultipleDriver {

    #Create the manager with the api key
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addresses = [
        Address->new( address => "3634 W Market St, Fairlawn, OH 44333",

            #all possible originating locations are depots, should be marked as true
            #stylistically we recommend all depots should be at the top of the destinations list
            is_depot          => 1,
            lat               => 41.135762259364,
            lng               => -81.629313826561,

            #the number of seconds at destination
            time              => 300,

            #together these two specify the time window of a destination
            #seconds offset relative to the route start time for the open availability of a destination
            time_window_start => 28800,

            #seconds offset relative to the route end time for the open availability of a destination
            time_window_end   => 29465
        ),
        Address->new( address => "1218 Ruth Ave, Cuyahoga Falls, OH 44221",
            lat               => 41.135762259364,
            lng               => -81.629313826561,
            time              => 300,
            time_window_start => 29465,
            time_window_end   => 30529 ),

        Address->new( address => "512 Florida Pl, Barberton, OH 44203",
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 30529,
            time_window_end   => 33779 ),

        Address->new( address => "512 Florida Pl, Barberton, OH 44203",
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 100,
            time_window_start => 33779,
            time_window_end   => 33944 ),

        Address->new( address => "3495 Purdue St, Cuyahoga Falls, OH 44221",
            lat               => 41.162971496582,
            lng               => -81.479049682617,
            time              => 300,
            time_window_start => 33944,
            time_window_end   => 34801 ),

        Address->new( address => "1659 Hibbard Dr, Stow, OH 44224",
            lat               => 41.194505989552,
            lng               => -81.443351581693,
            time              => 300,
            time_window_start => 34801,
            time_window_end   => 36366 ),

        Address->new( address => "2705 N River Rd, Stow, OH 44224",
            lat               => 41.145240783691,
            lng               => -81.410247802734,
            time              => 300,
            time_window_start => 36366,
            time_window_end   => 39173 ),

        Address->new( address => "10159 Bissell Dr, Twinsburg, OH 44087",
            lat               => 41.340042114258,
            lng               => -81.421226501465,
            time              => 300,
            time_window_start => 39173,
            time_window_end   => 41617 ),

        Address->new( address => "367 Cathy Dr, Munroe Falls, OH 44262",
            lat               => 41.148578643799,
            lng               => -81.429229736328,
            time              => 300,
            time_window_start => 41617,
            time_window_end   => 43660 ),

        Address->new( address => "367 Cathy Dr, Munroe Falls, OH 44262",
            lat               => 41.148578643799,
            lng               => -81.429229736328,
            time              => 300,
            time_window_start => 43660,
            time_window_end   => 46392 ),

        Address->new( address => "512 Florida Pl, Barberton, OH 44203",
            lat               => 41.003671512008,
            lng               => -81.598461046815,
            time              => 300,
            time_window_start => 46392,
            time_window_end   => 48389 ),

        Address->new( address => "559 W Aurora Rd, Northfield, OH 44067",
            lat               => 41.315116882324,
            lng               => -81.558746337891,
            time              => 50,
            time_window_start => 48389,
            time_window_end   => 48449 ),

        Address->new( address => "3933 Klein Ave, Stow, OH 44224",
            lat               => 41.169467926025,
            lng               => -81.429420471191,
            time              => 300,
            time_window_start => 48449,
            time_window_end   => 50152 ),

        Address->new( address => "2148 8th St, Cuyahoga Falls, OH 44221",
            lat               => 41.136692047119,
            lng               => -81.493492126465,
            time              => 300,
            time_window_start => 50152,
            time_window_end   => 51982 ),

        Address->new( address => "3731 Osage St, Stow, OH 44224",
            lat               => 41.161357879639,
            lng               => -81.42293548584,
            time              => 100,
            time_window_start => 51982,
            time_window_end   => 52180 ),

        Address->new( address => "3731 Osage St, Stow, OH 44224",
            lat               => 41.161357879639,
            lng               => -81.42293548584,
            time              => 300,
            time_window_start => 52180,
            time_window_end   => 54379 )
    ];

    my $parameters = RouteParameters->new(
        #specify capacitated vehicle routing with time windows and multiple depots, with multiple drivers
        algorithm_type          => AlgorithmType->CVRP_TW_MD,

        #set an arbitrary route name
        #this value shows up in the website, and all the connected mobile device
        route_name              => "Multiple Depot, Multiple Driver",

        #the route start date in UTC, unix timestamp seconds (Tomorrow)
        route_date              => time + 3600,

        #the time in UTC when a route is starting (7AM)
        route_time              => 60 * 60 * 7,

        #the maximum duration of a route
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

    ExamplesInfrastructure->PrintExampleOptimizationResult( "MultipleDepotMultipleDriver", $dataObject, $errorString );

    return $dataObject;
}

1;