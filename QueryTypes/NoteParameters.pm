package NoteParameters;
use Moose;

has route_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string  => 1);
has address_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Int', query_string  => 1);
has dev_lat => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Num', query_string  => 1);
has dev_lng => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Num', query_string  => 1);
has device_type => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string  => 1);
has strUpdateType => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string  => 1);


1;