package AddressBookContact;
use Moose;

has address_id => (is => 'rw', isa => 'Str');
has address_group => (is => 'rw', isa => 'Str');
has address_alias => (is => 'rw', isa => 'Str');
has address_1 => (is => 'rw', isa => 'Str');
has address_2 => (is => 'rw', isa => 'Str');
has first_name => (is => 'rw', isa => 'Str');
has last_name => (is => 'rw', isa => 'Str');
has address_email => (is => 'rw', isa => 'Str');
has address_phone_number => (is => 'rw', isa => 'Str');
has address_city => (is => 'rw', isa => 'Str');
has address_state_id => (is => 'rw', isa => 'Str');
has address_country_id => (is => 'rw', isa => 'Str');
has address_zip => (is => 'rw', isa => 'Str');
has cached_lat => (is => 'rw', isa => 'Num');
has cached_lng => (is => 'rw', isa => 'Num');
has color => (is => 'rw', isa => 'Str');

1;