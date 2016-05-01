package OptimizationParameters;
use Moose;
use Address;

has optimization_problem_id => (traits => [qw/QueryString/], is => 'rw', isa => 'Str', query_string  => 1);
has reoptimize => (traits => [qw/QueryString/], is => 'rw', isa => 'Bool', query_string  => 1);
has show_directions => (traits => [qw/QueryString/], is => 'rw', isa => 'Bool', query_string  => 1);
has parameters => (is => 'rw', isa => 'RouteParameters');
has addresses => (is => 'rw', isa => 'ArrayRef[Address]');

1;