package GPSParameters;
use Moose;

has format =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has member_id =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Int', query_string => 1);
has route_id =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has tx_id =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has vehicle_id =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Int', query_string => 1);
has course =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Int', query_string => 1);
has speed =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Num', query_string => 1);
has lat =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Num', query_string => 1);
has lng =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Num', query_string => 1);
has altitude =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Num', query_string => 1);
has device_type =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has device_guid =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has device_timestamp =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);
has app_version =>  (traits => [ qw/QueryString/ ], is => 'rw', isa => 'Str', query_string => 1);

1;