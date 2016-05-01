package DataObjectOptimizations;
use Moose;

has optimizations => (is => 'rw', isa => 'ArrayRef[DataObject]');

1;