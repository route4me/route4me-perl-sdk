package RemoveAddressBookContactsRequest;
use Moose;

has address_ids => (is => 'rw', isa => 'ArrayRef[Str]');

1;