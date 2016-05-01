package RouteParametersQuery;
use Moose;

has route_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string  => 1);
has directions => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Bool]', query_string  => 1);
has route_path_output => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string  => 1);
has device_tracking_history => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Bool]', query_string  => 1);
has limit => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Int]', query_string  => 1);
has offset => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Int]', query_string  => 1);
has original => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Bool]', query_string  => 1);
has notes => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Bool]', query_string  => 1);
has query => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string  => 1);
has reoptimize => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Bool]', query_string  => 1);
has recompute_directions => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Bool]', query_string  => 1);
has parameters => (is => 'rw', isa => 'RouteParameters');

1;