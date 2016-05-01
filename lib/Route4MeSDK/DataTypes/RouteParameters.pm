package RouteParameters;

use Moose;
use Moose::Util::TypeConstraints;
use Math::BigInt;
use Route4MeSDK::DataTypes::AlgorithmType;

has is_upload => (is => 'rw', isa => 'Str');
has rt => (is => 'rw', isa => 'Bool');
has disable_optimization => (is => 'rw', isa => 'Bool');
has route_name => (is => 'rw', isa => 'Str');
has route_date => (is => 'rw', isa => 'Int'); # should be long
has route_time => (is => 'rw', isa => 'Any');
has shared_publicly => (is => 'rw', isa => 'Str');
has optimize => (is => 'rw', isa => 'Str');
has lock_last => (is => 'rw', isa => 'Bool');
has vehicle_capacity => (is => 'rw', isa => 'Str');
has vehicle_max_distance_mi => (is => 'rw', isa => 'Str');
has distance_unit => (is => 'rw', isa => 'Str');
has travel_mode => (is => 'rw', isa => 'Str');
has avoid => (is => 'rw', isa => 'Str');
has vehicle_id => (is => 'rw', isa => 'Str');
has driver_id => (is => 'rw', isa => 'Str');
has dev_lat => (is => 'rw', isa => 'Num');
has dev_lng => (is => 'rw', isa => 'Num');
has route_max_duration => (is => 'rw', isa => 'Int');
has route_email => (is => 'rw', isa => 'Str');
has route_type => (is => 'rw', isa => 'Str');
has store_route => (is => 'rw', isa => 'Bool');
has metric => (is => 'rw', isa => 'PositiveInt');
has algorithm_type => (is => 'rw', isa => 'PositiveInt');
has member_id => (is => 'rw', isa => 'Str');
has ip => (is => 'rw', isa => 'Str');
has dm => (is => 'rw', isa => 'Int');
has dirm => (is => 'rw', isa => 'Int');
has parts => (is => 'rw', isa => 'Int');
has device_id => (is => 'rw', isa => 'object');
has device_type => (is => 'rw', isa => 'Str');
has has_trailer => (is => 'rw', isa => 'Bool');
has trailer_weight_t => (is => 'rw', isa => 'Num');
has limited_weight_t => (is => 'rw', isa => 'Num');
has weight_per_axle_t => (is => 'rw', isa => 'Num');
has truck_height_meters => (is => 'rw', isa => 'Int');
has truck_width_meters => (is => 'rw', isa => 'Int');
has truck_length_meters => (is => 'rw', isa => 'Int');
has min_tour_size => (is => 'rw', isa => 'Int');
has max_tour_size => (is => 'rw', isa => 'Int');
has optimization_quality => (is => 'rw', isa => 'Int');


1;