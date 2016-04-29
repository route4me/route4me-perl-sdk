package DeleteRouteResponse;
use Moose;

has deleted => (is => 'rw', isa => 'Bool');
has errors => (is => 'rw', isa => 'ArrayRef[Str]');
has route_id => (is => 'rw', isa => 'Str');
has route_ids => (is => 'rw', isa => 'ArrayRef[Str]');

1;