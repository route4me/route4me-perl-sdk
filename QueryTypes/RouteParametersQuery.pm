package RouteParametersQuery;
use Moose;

has route_id => (is => 'rw', isa => 'Str');
has directions => (is => 'rw', isa => 'Maybe[Bool]');
has route_path_output => (is => 'rw', isa => 'Str');
has device_tracking_history => (is => 'rw', isa => 'Maybe[Bool]');
has limit => (is => 'rw', isa => 'Maybe[Int]');
has offset => (is => 'rw', isa => 'Maybe[Int]');
has original => (is => 'rw', isa => 'Maybe[Bool]');
has notes => (is => 'rw', isa => 'Maybe[Bool]');
has query => (is => 'rw', isa => 'Str');
has reoptimize => (is => 'rw', isa => 'Maybe[Bool]');
has recompute_directions => (is => 'rw', isa => 'Maybe[Bool]');
has parameters => (is => 'rw', isa => 'RouteParameters');

1;