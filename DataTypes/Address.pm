package Address;
use Moose;
use Moose::Util::TypeConstraints;

subtype 'PositiveInt',
    as 'Int',
        where { $_ > 0 },
            message { "The number you provided, $_, was not a positive number" };



has route_destination_id => (is => 'rw', isa => 'Int');
has alias => (is => 'rw', isa => 'Str');
has member_id => (is => 'rw', isa => 'Str');
has address => (is => 'rw', isa => 'Str');
has is_depot => (is => 'rw', isa => 'Bool');
has lat => (is => 'rw', isa => 'Num');
has lng => (is => 'rw', isa => 'Num');
has route_id => (is => 'rw', isa => 'Str');
has original_route_id => (is => 'rw', isa => 'Str');
has optimization_problem_id => (is => 'rw', isa => 'Str');
has sequence_no => (is => 'rw', isa => 'Int');
has geocoded => (is => 'rw', isa => 'Bool');
has preferred_geocoding => (is => 'rw', isa => 'Int');
has FailedGeocoding => (is => 'rw', isa => 'Bool');
has contact_id => (is => 'rw', isa => 'Int');
has is_departed => (is => 'rw', isa => 'Bool');
has timestamp_last_visited => (is => 'rw', isa => 'PositiveInt');
has timestamp_last_departed => (is => 'rw', isa => 'PositiveInt');
has CustomerPo => (is => 'rw', isa => 'Object');
has invoice_no => (is => 'rw', isa => 'Object');
has reference_no => (is => 'rw', isa => 'Object');
has order_no => (is => 'rw', isa => 'Object');
has weight => (is => 'rw', isa => 'Object');
has cost => (is => 'rw', isa => 'Object');
has cube => (is => 'rw', isa => 'Object');
has pieces => (is => 'rw', isa => 'Object');
has email => (is => 'rw', isa => 'Object');
has phone => (is => 'rw', isa => 'Object');
has destination_note_count => (is => 'rw', isa => 'Int');
has drive_time_to_next_destination => (is => 'rw', isa => 'Int');
has distance_to_next_destination => (is => 'rw', isa => 'Num');
has generated_time_window_start => (is => 'rw', isa => 'Int');
has generated_time_window_end => (is => 'rw', isa => 'Int');
has channel_name => (is => 'rw', isa => 'Str');
has time_window_start => (is => 'rw', isa => 'Int');
has time_window_end => (is => 'rw', isa => 'Int');
has time => (is => 'rw', isa => 'Int');
has notes => (is => 'rw', isa => 'ArrayRef[AddressNote]');
has priority => (is => 'rw', isa => 'Int');
has curbside_lat => (is => 'rw', isa => 'Maybe[Num]');
has curbside_lng => (is => 'rw', isa => 'Maybe[Num]');
has time_window_start_2 => (is => 'rw', isa => 'Int');
has time_window_end_2 => (is => 'rw', isa => 'Int');
has custom_fields => (is => 'rw', isa => 'HashRef[Str]');
1;