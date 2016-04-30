package GetAddressBookContactsResponse;
use Moose;

has results => (is => 'rw', isa => 'ArrayRef[AddressBookContact]');
has total => (is => 'rw', isa => 'Int');


1;