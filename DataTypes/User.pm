package User;
use Moose;

has member_id => ( is => "rw", isa => 'Maybe[Int]');
has account_type_id => ( is => "rw", isa => 'Maybe[Int]');
has member_type => ( is => "rw", isa => 'Str');
has member_first_name => ( is => "rw", isa => 'Str');
has member_last_name => ( is => "rw", isa => 'Str');
has member_email => ( is => "rw", isa => 'Str');
has phone_number => ( is => "rw", isa => 'Str');
has readonly_user => ( is => "rw", isa => 'Maybe[Bool]');
has show_superuser_addresses => ( is => "rw", isa => 'Maybe[Bool]');

1;