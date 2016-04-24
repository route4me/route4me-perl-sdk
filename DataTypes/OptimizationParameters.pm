package OptimizationParameters;
use Moose;
use DataTypes::Address;

has optimization_problem_id => (is => 'rw', isa => 'Str');
has reoptimize => (is => 'rw', isa => 'Bool');
has show_directions => (is => 'rw', isa => 'Bool');
has parameters => (is => 'rw', isa => 'RouteParameters');
has addresses => (is => 'rw', isa => 'ArrayRef[Address]');

1;