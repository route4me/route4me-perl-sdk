package GetActivitiesResponse;
use Moose;
has results => ( is => 'rw', isa => 'ArrayRef[Activity]');
has total => ( is => 'rw', isa => 'Int');
1;