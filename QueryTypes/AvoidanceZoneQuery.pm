package AvoidanceZoneQuery;
use Moose;

has device_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has territory_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);

1;