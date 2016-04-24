package Links;
use Moose;

has route => (is => 'rw', isa => 'Str');
has view => (is => 'rw', isa => 'Str');
has optimization_problem_id => (is => 'rw', isa => 'Str');

1;