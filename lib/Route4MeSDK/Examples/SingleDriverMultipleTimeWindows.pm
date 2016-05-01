package SingleDriverMultipleTimeWindows;
use strict;
use warnings FATAL => 'all';
sub SingleDriverMultipleTimeWindows {
    #Create the manager with the api key
    my $route4Me = Route4MeManager->new( ExamplesInfrastructure->ApiKey );

    my $addresses = [
        Address->new( address  => '3634 W Market St, Fairlawn, OH 44333',
            #all possible originating locations are depots, should be marked as true
            #stylistically we recommend all depots should be at the top of the destinations list
            is_depot           => 1,
            lat                => 41.135762259364,
            lng                => -81.629313826561,

            time_window_start  => undef,
            time_window_end    => undef,
            time_window_start2 => undef,
            time_window_end2   => undef,
            time               => undef
        ),

        Address->new( address  => '1218 Ruth Ave, Cuyahoga Falls, OH 44221',
            lat                => 41.135762259364,
            lng                => -81.629313826561,

            #together these two specify the time window of a destination
            #seconds offset relative to the route start time for the open availability of a destination
            time_window_start  => 6 * 3600 + 00 * 60,
            #seconds offset relative to the route end time for the open availability of a destination
            time_window_end    => 6 * 3600 + 30 * 60,

            # Second 'time_window_start'
            time_window_start2 => 7 * 3600 + 00 * 60,
            # Second 'time_window_end'
            time_window_end2   => 7 * 3600 + 20 * 60,

            #the number of seconds at destination
            time               => 300
        ),

        Address->new( address  => '512 Florida Pl, Barberton, OH 44203',
            lat                => 41.003671512008,
            lng                => -81.598461046815,
            time_window_start  => 7 * 3600 + 30 * 60,
            time_window_end    => 7 * 3600 + 40 * 60,
            time_window_start2 => 8 * 3600 + 00 * 60,
            time_window_end2   => 8 * 3600 + 10 * 60,
            time               => 300
        ),

        Address->new( address  => '512 Florida Pl, Barberton, OH 44203',
            lat                => 41.003671512008,
            lng                => -81.598461046815,
            time_window_start  => 8 * 3600 + 30 * 60,
            time_window_end    => 8 * 3600 + 40 * 60,
            time_window_start2 => 8 * 3600 + 50 * 60,
            time_window_end2   => 9 * 3600 + 00 * 60,
            time               => 100
        ),

        Address->new( address  => '3495 Purdue St, Cuyahoga Falls, OH 44221',
            lat                => 41.162971496582,
            lng                => -81.479049682617,
            time_window_start  => 9 * 3600 + 00 * 60,
            time_window_end    => 9 * 3600 + 15 * 60,
            time_window_start2 => 9 * 3600 + 30 * 60,
            time_window_end2   => 9 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '1659 Hibbard Dr, Stow, OH 44224',
            lat                => 41.194505989552,
            lng                => -81.443351581693,
            time_window_start  => 10 * 3600 + 00 * 60,
            time_window_end    => 10 * 3600 + 15 * 60,
            time_window_start2 => 10 * 3600 + 30 * 60,
            time_window_end2   => 10 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '2705 N River Rd, Stow, OH 44224',
            lat                => 41.145240783691,
            lng                => -81.410247802734,
            time_window_start  => 11 * 3600 + 00 * 60,
            time_window_end    => 11 * 3600 + 15 * 60,
            time_window_start2 => 11 * 3600 + 30 * 60,
            time_window_end2   => 11 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '10159 Bissell Dr, Twinsburg, OH 44087',
            lat                => 41.340042114258,
            lng                => -81.421226501465,
            time_window_start  => 12 * 3600 + 00 * 60,
            time_window_end    => 12 * 3600 + 15 * 60,
            time_window_start2 => 12 * 3600 + 30 * 60,
            time_window_end2   => 12 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '367 Cathy Dr, Munroe Falls, OH 44262',
            lat                => 41.148578643799,
            lng                => -81.429229736328,
            time_window_start  => 13 * 3600 + 00 * 60,
            time_window_end    => 13 * 3600 + 15 * 60,
            time_window_start2 => 13 * 3600 + 30 * 60,
            time_window_end2   => 13 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '367 Cathy Dr, Munroe Falls, OH 44262',
            lat                => 41.148578643799,
            lng                => -81.429229736328,
            time_window_start  => 14 * 3600 + 00 * 60,
            time_window_end    => 14 * 3600 + 15 * 60,
            time_window_start2 => 14 * 3600 + 30 * 60,
            time_window_end2   => 14 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '512 Florida Pl, Barberton, OH 44203',
            lat                => 41.003671512008,
            lng                => -81.598461046815,
            time_window_start  => 15 * 3600 + 00 * 60,
            time_window_end    => 15 * 3600 + 15 * 60,
            time_window_start2 => 15 * 3600 + 30 * 60,
            time_window_end2   => 15 * 3600 + 45 * 60,
            time               => 300
        ),

        Address->new( address  => '559 W Aurora Rd, Northfield, OH 44067',
            lat                => 41.315116882324,
            lng                => -81.558746337891,
            time_window_start  => 16 * 3600 + 00 * 60,
            time_window_end    => 16 * 3600 + 15 * 60,
            time_window_start2 => 16 * 3600 + 30 * 60,
            time_window_end2   => 17 * 3600 + 00 * 60,
            time               => 50
        )
    ];

    my $parameters = RouteParameters->new(
        algorithm_type => AlgorithmType->TSP,
        route_name     => "Single Driver Multiple TimeWindows 12 Stops",
        store_route    => 0,
        route_date     => time + 3600,
        route_time     => 5 * 3600 + 30 * 60,


        optimize       => Optimize->Distance,
        distance_unit  => DistanceUnit->MI,
        device_type    => DeviceType->Web,

    );

    my $optimizationParameters = OptimizationParameters->new(
        addresses  => $addresses,
        parameters => $parameters
    );

    my $errorString = "";

    my $dataObject = $route4Me->runOptimization( $optimizationParameters, \$errorString );

    ExamplesInfrastructure->PrintExampleOptimizationResult( "SingleDriverMultipleTimeWindows", $dataObject,
        $errorString );

    return $dataObject;
}
1;