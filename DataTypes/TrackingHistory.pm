package TrackingHistory;
use Moose;

has s => (is => 'rw', isa => 'Num');
has lt => (is => 'rw', isa => 'Num');
has lg => (is => 'rw', isa => 'Num');
has d => (is => 'rw', isa => 'Str');
has ts => (is => 'rw', isa => 'Str');
has ts_friendly => (is => 'rw', isa => 'Str');

1;