package Territory;
use Moose;

has type => (is => 'rw', isa => 'Str');
has data => (is => 'rw', isa => 'ArrayRef[Str]');

1;