package AddressBookParameters;
use Moose;

has address_id => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has limit => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Int]', query_string => 1);
has offset => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Int]', query_string => 1);
has start => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Maybe[Int]', query_string => 1);
has query => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has fields => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has display => (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);

1;