package ActivityParameters;
use Moose;


has  "route_id" => (traits => [ qw/QueryString/ ], is => "rw", isa => "Str", query_string => 1);
has  "device_id" => (traits => [ qw/QueryString/ ], is => "rw", isa => "Str", query_string => 1);
has  "member_id", => (traits => [ qw/QueryString/ ], is => "rw", isa => "Maybe[Int]", query_string => 1);
has  "limit" => (traits => [ qw/QueryString/ ], is => "rw", isa => "Maybe[Int]", query_string => 1);
has  "offset" => (traits => [ qw/QueryString/ ], is => "rw", isa => "Maybe[Int]", query_string => 1);
has  "start" => (traits => [ qw/QueryString/ ], is => "rw", isa => "Maybe[Int]", query_string => 1);
has  "end" => (traits => [ qw/QueryString/ ], is => "rw", isa => "Maybe[Int]", query_string => 1);

1;