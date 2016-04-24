package AddressNote;
use Moose;
use Moose::Util::TypeConstraints;

subtype 'PositiveInt',
    as 'Int',
        where { $_ > 0 },
            message { "The number you provided, $_, was not a positive number" };

has note_id => (is => 'rw', isa => 'Int');
has route_id => (is => 'rw', isa => 'Str');
has route_destination_id => (is => 'rw', isa => 'Int');
has upload_id => (is => 'rw', isa => 'Str');
has ts_added => (is => 'rw', isa => 'PositiveInt');
has lat => (is => 'rw', isa => 'Num');
has lng => (is => 'rw', isa => 'Num');
has activity_type => (is => 'rw', isa => 'Str');
has contents => (is => 'rw', isa => 'Str');
has upload_type => (is => 'rw', isa => 'Str');
has upload_url => (is => 'rw', isa => 'Str');
has upload_extension => (is => 'rw', isa => 'Str');
has device_type => (is => 'rw', isa => 'Str');

1;