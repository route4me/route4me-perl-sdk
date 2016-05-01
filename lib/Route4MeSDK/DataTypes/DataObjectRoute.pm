package DataObjectRoute;
use Moose;
extends 'DataObject';
has route_id => (is => 'rw', isa => 'Str');
has member_id => (is => 'rw', isa => 'Str');
has member_email => (is => 'rw', isa => 'Str');
has vehicle_alias => (is => 'rw', isa => 'Str');
has driver_alias => (is => 'rw', isa => 'Str');
has route_cost => (is => 'rw', isa => 'Num');
has route_revenue => (is => 'rw', isa => 'Num');
has net_revenue_per_distance_unit => (is => 'rw', isa => 'Num');
has created_timestamp => (is => 'rw', isa => 'Int');
has mpg => (is => 'rw', isa => 'Str');
has trip_distance => (is => 'rw', isa => 'Num');
has gas_price => (is => 'rw', isa => 'Num');
has route_duration_sec => (is => 'rw', isa => 'Int');

1;