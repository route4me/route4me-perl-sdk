package AddressParameters;
use Moose;

has route_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has route_destination_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Int', query_string => 1);
has notes => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Bool', query_string => 1);

1;