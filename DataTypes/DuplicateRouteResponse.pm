package DuplicateRouteResponse;
use Moose;

has optimization_problem_id => (is => 'rw', isa => 'Str');
has success => (is => 'rw', isa => 'Bool');
1;