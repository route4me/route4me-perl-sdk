package DataObject;
use Moose;

has optimization_problem_id => (is => 'rw', isa => 'Str');
has state => (is => 'rw', isa => 'Int');
has user_errors => (is => 'rw', isa => 'ArrayRef[Str]');
has sent_to_background => (is => 'rw', isa => 'Bool');
has parameters => (is => 'rw', isa => 'RouteParameters');
has addresses => (is => 'rw', isa => 'ArrayRef[Address]');
has routes => (is => 'rw', isa => 'ArrayRef[DataObjectRoute]');
has links => (is => 'rw', isa => 'Links');
has tracking_history => (is => 'rw', isa => 'ArrayRef[TrackingHistory]');

1;