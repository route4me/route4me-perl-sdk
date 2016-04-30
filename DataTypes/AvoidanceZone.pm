package AvoidanceZone;
use Moose;

has territory_id => (is => 'rw', isa => 'Str');
has territory_name => (is => 'rw', isa => 'Str');
has territory_color => (is => 'rw', isa => 'Str');
has member_id => (is => 'rw', isa => 'Str');
has territory => (is => 'rw', isa => 'Territory');

1;