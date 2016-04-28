package Activity;
use Moose;

has activity_id => (is => 'rw', isa => 'Str');
has activity_type => (is => 'rw', isa => 'Str');
has activity_timestamp => (is => 'rw', isa => 'Maybe[Int]');
has activity_message => (is => 'rw', isa => 'Str');

1;